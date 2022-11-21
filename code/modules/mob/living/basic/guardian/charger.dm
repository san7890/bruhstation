//Charger
/mob/living/basic/guardian/charger
	melee_damage_lower = 15
	melee_damage_upper = 15
	speed = -1
	damage_coeff = list(BRUTE = 0.6, BURN = 0.6, TOX = 0.6, CLONE = 0.6, STAMINA = 0, OXY = 0.6)
	playstyle_string = span_holoparasite("As a <b>charger</b> type you do medium damage, have medium damage resistance, move very fast, and can charge at a location, damaging any target hit and forcing them to drop any items they are holding.")
	magic_fluff_string = span_holoparasite("..And draw the Hunter, an alien master of rapid assault.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Charge modules loaded. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's a charger carp, that likes running at people. But it doesn't have any legs...")
	miner_fluff_string = span_holoparasite("You encounter... Titanium, a lightweight, agile fighter.")
	var/charging = 0
	var/atom/movable/screen/alert/chargealert
	/// This allows us to charge at stuff.
	var/datum/action/cooldown/mob_cooldown/charge/basic_charge/charging_ability

/mob/living/basic/guardian/charger/Initialize()
	. = ..()
	charging_ability = new
	charging_ability.Grant(src)
	charging_ability.cooldown_time = 4 SECONDS

/mob/living/basic/guardian/charger/Destroy()
	QDEL_NULL(charging_ability)
	return ..()

/mob/living/basic/guardian/charger/Move()
	if(charging_ability.next_use_time < world.time)
		new /obj/effect/temp_visual/decoy/fading(loc,src)
	return ..()

/mob/living/basic/guardian/charger/snapback()
	if(charging_ability.next_use_time > world.time)
		return ..()

/mob/living/basic/guardian/charger/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(charging_ability.next_use_time > world.time)
		return ..()

	else if(hit_atom)
		if(isliving(hit_atom) && hit_atom != summoner)
			var/mob/living/L = hit_atom
			var/blocked = FALSE
			if(has_matching_summoner(hit_atom)) //if the summoner matches don't hurt them
				blocked = TRUE
			if(ishuman(hit_atom))
				var/mob/living/carbon/human/H = hit_atom
				if(H.check_shields(src, 90, "[name]", attack_type = THROWN_PROJECTILE_ATTACK))
					blocked = TRUE
			if(!blocked)
				L.drop_all_held_items()
				L.visible_message(span_danger("[src] slams into [L]!"), span_userdanger("[src] slams into you!"))
				L.apply_damage(20, BRUTE)
				playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 10 SECONDS, TRUE)
				shake_camera(L, 4, 3)
				shake_camera(src, 2, 3)

