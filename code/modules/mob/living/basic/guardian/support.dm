//Healer
/mob/living/basic/guardian/healer
	friendly_verb_continuous = "heals"
	friendly_verb_simple = "heal"
	speed = 0
	damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
	playstyle_string = span_holoparasite("As a <b>support</b> type, you may toggle your basic attacks to a healing mode. In addition, Alt-Clicking on an adjacent object or mob will warp them to your bluespace beacon after a short delay.")
	magic_fluff_string = span_holoparasite("..And draw the Chief Medical Officer, a potent force of life... and death.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! You caught a support carp. It's a kleptocarp!")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Support modules active. Holoparasite swarm online.")
	miner_fluff_string = span_holoparasite("You encounter... Bluespace, the master of support.")
	toggle_button_type = /atom/movable/screen/guardian/toggle_mode
	/// The receiving pad that we track and warp people to.
	var/obj/structure/receiving_pad/beacon
	/// How long we need to cool down for after we place a beacon.
	var/beacon_cooldown = 5 MINUTES
	COOLDOWN_DECLARE(beacon_placement_cooldown)
	/// Swap between combat and healer mode.
	var/toggle = FALSE

/mob/living/basic/guardian/healer/Initialize(mapload)
	. = ..()
	var/datum/atom_hud/medsensor = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	medsensor.show_to(src)

/mob/living/basic/guardian/healer/get_status_tab_items()
	. = ..()
	if(!COOLDOWN_FINISHED(src, beacon_placement_cooldown))
		. += "Beacon Cooldown Remaining: [DisplayTimeText(beacon_placement_cooldown - world.time)]"

/mob/living/basic/guardian/healer/melee_attack(atom/target)
	. = ..()
	if(is_deployed() && toggle && iscarbon(target))
		var/mob/living/carbon/healee = target
		healee.adjustBruteLoss(-5)
		healee.adjustFireLoss(-5)
		healee.adjustOxyLoss(-5)
		healee.adjustToxLoss(-5)
		var/obj/effect/temp_visual/heal/effect = new /obj/effect/temp_visual/heal(get_turf(healee))
		if(guardian_color)
			effect.color = guardian_color
		if(healee == summoner)
			update_health_hud()
			med_hud_set_health()
			med_hud_set_status()

/mob/living/basic/guardian/healer/ToggleMode()
	if(src.loc == summoner)
		if(toggle)
			set_combat_mode(TRUE)
			speed = 0
			damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
			melee_damage_lower = initial(melee_damage_lower)
			melee_damage_upper = initial(melee_damage_upper)
			to_chat(src, span_danger("<B>You switch to combat mode.</B>"))
			toggle = FALSE
		else
			set_combat_mode(FALSE)
			speed = 1
			damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 1, CLONE = 1, STAMINA = 0, OXY = 1)
			melee_damage_lower = 0
			melee_damage_upper = 0
			to_chat(src, span_danger("<B>You switch to healing mode.</B>"))
			toggle = TRUE
	else
		to_chat(src, span_danger("<B>You have to be recalled to toggle modes!</B>"))


/mob/living/basic/guardian/healer/verb/Beacon()
	set name = "Place Bluespace Beacon"
	set category = "Guardian"
	set desc = "Mark a floor as your beacon point, allowing you to warp targets to it. Your beacon will not work at extreme distances."

	if(!COOLDOWN_FINISHED(src, beacon_placement_cooldown))
		to_chat(src, span_danger("<B>Your power is on cooldown. You must wait [DisplayTimeText(beacon_cooldown)] between placing beacons.</B>"))
		return

	var/turf/beacon_loc = get_turf(src)
	if(!isfloorturf(beacon_loc))
		return

	if(beacon)
		beacon.disappear()
		beacon = null

	beacon = new /obj/structure/receiving_pad(beacon_loc)
	beacon.set_color(src)

	to_chat(src, span_danger("<B>Beacon placed! You may now warp targets and objects to it, including your user, via Alt+Click.</B>"))

	COOLDOWN_START(src, beacon_placement_cooldown, beacon_cooldown)


/mob/living/basic/guardian/healer/AltClickOn(atom/movable/source)
	if(!istype(source))
		return
	if(src.loc == summoner)
		to_chat(src, span_danger("<B>You must be manifested to warp a target!</B>"))
		return
	if(!beacon)
		to_chat(src, span_danger("<B>You need a beacon placed to warp things!</B>"))
		return
	if(!Adjacent(source))
		to_chat(src, span_danger("<B>You must be adjacent to your target!</B>"))
		return
	if(source.anchored)
		to_chat(src, span_danger("<B>Your target cannot be anchored!</B>"))
		return

	var/turf/source_turf = get_turf(source)
	if(beacon.z != source_turf.z)
		to_chat(src, span_danger("<B>The beacon is too far away to warp to!</B>"))
		return

	to_chat(src, span_danger("<B>You begin to warp [source].</B>"))
	source.visible_message(span_danger("[source] starts to glow faintly!"), \
	span_userdanger("You start to faintly glow, and you feel strangely weightless!"))
	do_attack_animation(source)

	if(!do_mob(src, source, 6 SECONDS)) //now start the channel
		to_chat(src, span_danger("<B>You need to hold still!</B>"))
		return

	new /obj/effect/temp_visual/guardian/phase/out(source_turf)
	if(isliving(source))
		var/mob/living/teleported = source
		teleported.flash_act()
	source.visible_message(span_danger("[source] disappears in a flash of light!"), \
	span_userdanger("Your vision is obscured by a flash of light!"))
	do_teleport(source, beacon, 0, channel = TELEPORT_CHANNEL_BLUESPACE)
	new /obj/effect/temp_visual/guardian/phase(get_turf(source))
