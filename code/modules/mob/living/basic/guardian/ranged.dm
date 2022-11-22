//Ranged
/obj/projectile/guardian
	name = "crystal spray"
	icon_state = "guardian"
	damage = 5
	damage_type = BRUTE
	armour_penetration = 100

/mob/living/basic/guardian/ranged
	combat_mode = FALSE
	friendly_verb_continuous = "quietly assesses"
	friendly_verb_simple = "quietly assess"
	melee_damage_lower = 10
	melee_damage_upper = 10
	damage_coeff = list(BRUTE = 0.9, BURN = 0.9, TOX = 0.9, CLONE = 0.9, STAMINA = 0, OXY = 0.9)
	range = 13
	playstyle_string = span_holoparasite("As a <b>ranged</b> type, you have only light damage resistance, but are capable of spraying shards of crystal at incredibly high speed. You can also deploy surveillance snares to monitor enemy movement. Finally, you can switch to scout mode, in which you can't attack, but can move without limit.")
	magic_fluff_string = span_holoparasite("..And draw the Sentinel, an alien master of ranged combat.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Ranged combat modules active. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one, it's a ranged carp. This fishy can watch people pee in the ocean.") // this one sucks who came up with this shit
	miner_fluff_string = span_holoparasite("You encounter... Diamond, a powerful projectile thrower.")
	see_invisible = SEE_INVISIBLE_LIVING
	see_in_dark = NIGHTVISION_FOV_RANGE
	toggle_button_type = /atom/movable/screen/guardian/toggle_mode
	/// List to track how many snares this guardian has set.
	var/list/snares = list()
	/// Number of snares we can have out at once.
	var/max_snares = 5
	/// Boolean for mode-toggling between ranged (attack) and scout (incapable of attacking).
	var/toggle = FALSE
	/// How long we want to have a cooldown between projectile attacks.
	var/projectile_cooldown = 1 SECONDS

/mob/living/basic/guardian/ranged/Initialize(mapload, theme)
	// We default to being in attack/ranged mode to start off with, so let's add it to ensure we can start firing right away without needing to toggle/untoggle first.
	AddElement(/datum/element/ranged_attacks, null, 'sound/effects/hit_on_shattered_glass.ogg', /obj/projectile/guardian, projectile_cooldown, guardian_color)
	return ..()

// We got to switch colors again, so let's swap the color of our projectile as well so we don't have to wait around by switching into scout mode, and then back into ranged attack mode again.
/mob/living/basic/guardian/ranged/guardian_recolor()
	. = ..()
	RemoveElement(/datum/element/ranged_attacks, null, 'sound/effects/hit_on_shattered_glass.ogg', /obj/projectile/guardian, projectile_cooldown, guardian_color)
	AddElement(/datum/element/ranged_attacks, null, 'sound/effects/hit_on_shattered_glass.ogg', /obj/projectile/guardian, projectile_cooldown, guardian_color)

/mob/living/basic/guardian/ranged/get_status_tab_items()
	. = ..()
	. += "Number of Snares In Play: [length(snares)]/[max_snares]"

// Swap between ranged and scout mode. Ranged we get the element that allows us to shoot, scout we get the element that allows us to move without limit (but we can't attack).
/mob/living/basic/guardian/ranged/ToggleMode()
	if(loc == summoner)
		if(toggle)
			melee_damage_lower = initial(melee_damage_lower)
			melee_damage_upper = initial(melee_damage_upper)
			obj_damage = initial(obj_damage)
			environment_smash = initial(environment_smash)
			alpha = 255
			range = initial(range)
			to_chat(src, "[span_danger("<B>You switch to combat mode.</B>")]")
			toggle = FALSE
		else
			melee_damage_lower = 0
			melee_damage_upper = 0
			obj_damage = 0
			environment_smash = ENVIRONMENT_SMASH_NONE
			alpha = 45
			range = 255
			to_chat(src, span_danger("<B>You switch to scout mode.</B>"))
			toggle = TRUE
	else
		to_chat(src, span_danger("<B>You have to be recalled to toggle modes!</B>"))

/mob/living/basic/guardian/ranged/RangedAttack()
	if(toggle) // in scout mode, zero attacking allowed. ensures that the ranged attack signal never gets sent to the element
		return
	return ..()

/mob/living/basic/guardian/ranged/ToggleLight()
	var/msg = ""

	switch(lighting_alpha)
		if (LIGHTING_PLANE_ALPHA_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
			msg = "You activate your night vision."
		if (LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
			msg = "You increase your night vision."
		if (LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_INVISIBLE
			msg = "You maximize your night vision."
		else
			lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
			msg = "You deactivate your night vision."

	to_chat(src, span_notice(msg))

/mob/living/basic/guardian/ranged/verb/Snare()
	set name = "Set Surveillance Snare"
	set category = "Guardian"
	set desc = "Set an invisible snare that will alert you when living creatures walk over it."
	if(length(snares) <= max_snares)
		var/turf/snare_loc = get_turf(loc)
		var/obj/effect/abstract/guardian_snare/trap = new /obj/effect/abstract/guardian_snare(snare_loc)
		trap.spawner = src
		trap.name = "[get_area(snare_loc)] snare ([rand(1, 1000)])"
		snares |= trap
		to_chat(src, span_danger("<B>Surveillance snare deployed! Now at ([length(snares)]/[max_snares]) total snares placed.</B>"))
	else
		to_chat(src, span_danger("<B>You have too many snares deployed: ([length(snares)]/[max_snares]). Remove some first.</B>"))

/mob/living/basic/guardian/ranged/verb/DisarmSnare()
	set name = "Remove Surveillance Snare"
	set category = "Guardian"
	set desc = "Disarm unwanted surveillance snares."
	var/picked_snare = tgui_input_list(src, "Pick which snare to remove", "Remove Snare", sort_names(snares))
	if(isnull(picked_snare))
		return
	snares -= picked_snare
	qdel(picked_snare)
	to_chat(src, span_danger("<B>Snare disarmed.</B>"))

/mob/living/basic/guardian/ranged/Manifest(forced)
	if (toggle)
		incorporeal_move = INCORPOREAL_MOVE_BASIC
	. = ..()

/mob/living/basic/guardian/ranged/Recall(forced)
	// To stop scout mode from moving when recalled
	incorporeal_move = FALSE
	. = ..()

/mob/living/basic/guardian/ranged/melee_attack(atom/target)
	if(toggle)
		return
	..()

/// Abstract effect "snare" that we just use for surveillance to see if anyone walks over it.
/obj/effect/abstract/guardian_snare
	name = "snare"
	desc = "You shouldn't be seeing this!"
	invisibility = INVISIBILITY_ABSTRACT
	/// Track the guardian that spawned us.
	var/mob/living/basic/guardian/spawner

/obj/effect/abstract/guardian_snare/Initialize(mapload)
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/effect/abstract/guardian_snare/proc/on_entered(datum/source, movable as mob|obj)
	SIGNAL_HANDLER
	if(isliving(movable) && spawner.summoner && movable != spawner && !spawner.has_matching_summoner(movable))
		to_chat(spawner.summoner, span_danger("<B>[movable] has crossed surveillance snare, [name].</B>"))
		var/list/guardians = spawner.summoner.get_all_linked_holoparasites()
		for(var/entity in guardians)
			to_chat(entity, span_danger("<B>[movable] has crossed surveillance snare, [name].</B>"))
