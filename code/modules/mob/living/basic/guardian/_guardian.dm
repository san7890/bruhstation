/// all currently existing/living guardians
GLOBAL_LIST_EMPTY(parasites)

#define GUARDIAN_HANDS_LAYER 1
#define GUARDIAN_TOTAL_LAYERS 1

/// Guardian Spirits, also known as "Holoparasites", are player-controlled mobs summoned by certain antags to wreak havoc. They can also be summoned through lavaland loot when discovered by miners.
/// This is the base implementation of the mob and shouldn't be used in the game setting, refer to the subtypes.
/mob/living/basic/guardian
	name = "Guardian Spirit"
	real_name = "Guardian Spirit"
	desc = "A mysterious being that stands by its charge, ever vigilant."
	speak_emote = list("hisses")
	gender = NEUTER
	mob_biotypes = NONE
	bubble_icon = "guardian"
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "flails at"
	response_disarm_simple = "flail at"
	response_harm_continuous = "punches"
	response_harm_simple = "punch"
	icon = 'icons/mob/nonhuman-player/guardian.dmi'
	icon_state = "magicbase"
	icon_living = "magicbase"
	icon_dead = "magicbase"
	light_system = MOVABLE_LIGHT
	light_range = 3
	light_on = FALSE
	speed = 0
	// The spirit itself is invincible
	maxHealth = INFINITY
	health = INFINITY
	combat_mode = TRUE
	attack_sound = 'sound/weapons/punch1.ogg'
	melee_damage_lower = 15
	melee_damage_upper = 15
	butcher_results = list(/obj/item/ectoplasm = 1)
	obj_damage = 40
	hud_type = /datum/hud/guardian
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	butcher_results = list(/obj/item/ectoplasm = 1)
	// This is effectively how much damage gets reflected onto the summoner.
	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, CLONE = 0.5, STAMINA = 0, OXY = 0.5)
	/// Mob that summoned us.
	var/mob/living/summoner
	/// The thematic style this guardian is using, which is used for the actual sprite/thematicism (magic, tech, etc)
	var/theme
	/// Boolean that tracks if someone has already reset this guardian.
	var/reset = FALSE
	/// Boolean that tracks if the guardian is forced to not be able to manifest/recall.
	var/locked = FALSE
	/// How long of a cooldown should there be between recalls?
	var/recall_cooldown_duration = 1 SECONDS
	COOLDOWN_DECLARE(recall_cooldown)
	/// Maximum allowed distance between the summoner and the guardian.
	var/range = 10
	/// Overlay that we apply on top of the guardian mob.
	var/mutable_appearance/cool_overlay
	/// The color of the guardian
	var/guardian_color
	/// Should we recolor the entire sprite when we generate the mob?
	var/recolor_entire_sprite
	/// Stored list of the overlays linked to this guardian.
	var/list/guardian_overlays[GUARDIAN_TOTAL_LAYERS]
	/// What sort of toggle button should we use on the HUD?
	var/toggle_button_type = /atom/movable/screen/guardian/toggle_mode/inactive
	/// STring to send to the guardian's player about the specific playstyle they should assume?
	var/playstyle_string = span_holoparasite_bold("You are a Guardian without any type. You shouldn't exist!")
	/// String to send if summoned in a magic context.
	var/magic_fluff_string = span_holoparasite("You draw the Coder, symbolizing bugs and errors. This shouldn't happen! Submit a bug report!")
	/// String to send if summoned in a technical context.
	var/tech_fluff_string = span_holoparasite("BOOT SEQUENCE COMPLETE. ERROR MODULE LOADED. THIS SHOULDN'T HAPPEN. Submit a bug report!")
	/// String to send if summoned in a carpy context.
	var/carp_fluff_string = span_holoparasite("CARP CARP CARP SOME SORT OF HORRIFIC BUG BLAME THE CODERS CARP CARP CARP")
	/// String to send if summoned via miner loot.
	var/miner_fluff_string = span_holoparasite("You encounter... Mythril, it shouldn't exist... Submit a bug report!")

/mob/living/basic/guardian/Initialize(mapload, theme)
	GLOB.parasites += src
	updatetheme(theme)
	AddElement(/datum/element/simple_flying)
	// string_assoc_list returns a cached list, which we then use as a static list to pass into the atmos_requirements element.
	var/list/habitable_atmos = string_assoc_list(list(
		"min_oxy" = 0,
		"max_oxy" = 0,
		"min_plas" = 0,
		"max_plas" = 0,
		"min_co2" = 0,
		"max_co2" = 0,
		"min_n2" = 0,
		"max_n2" = 0,
	))
	AddElement(/datum/element/atmos_requirements, atmos_requirements = habitable_atmos, unsuitable_atmos_damage = 0)
	AddElement(/datum/element/basic_body_temp_sensitive, min_body_temp = 0, max_body_temp = INFINITY, cold_damage = 0, heat_damage = 0)
	return ..()

/mob/living/basic/guardian/Destroy()
	GLOB.parasites -= src
	return ..()

/// In summary, we only die if our summoner dies. Work with that in mind.
/mob/living/basic/guardian/Life(delta_time = SSMOBS_DT, times_fired)
	. = ..()
	update_health_hud() //we need to update all of our health displays to match our summoner and we can't practically give the summoner a hook to do it
	med_hud_set_health()
	med_hud_set_status()
	if(!QDELETED(summoner))
		if(summoner.stat != DEAD)
			return
		forceMove(get_turf(summoner))
		to_chat(src, span_danger("Your summoner has died!"))
		visible_message(span_danger("<B>\The [src] dies along with its user!</B>"))
		summoner.visible_message(span_danger("<B>[summoner]'s body is completely consumed by the strain of sustaining [src]!</B>"))
		for(var/obj/item/possession in summoner)
			if(!summoner.dropItemToGround(possession))
				qdel(possession)
		summoner.dust()
		death(TRUE)
		qdel(src)
	else
		to_chat(src, span_danger("Your summoner has died!"))
		visible_message(span_danger("<B>[src] dies along with its user!</B>"))
		death(TRUE)
		qdel(src)
	snapback()

/mob/living/basic/guardian/Login() //if we have a mind, set its name to ours when it logs in
	. = ..()
	if(!. || !client)
		return FALSE
	if(mind)
		mind.name = "[real_name]"
	if(!summoner)
		to_chat(src, span_holoparasite_bold("For some reason, somehow, you have no summoner. Please report this bug immediately."))
		return
	to_chat(src, span_holoparasite("You are a <b>[real_name]</b>, bound to serve [summoner.real_name]."))
	to_chat(src, span_holoparasite("You are capable of manifesting or recalling to your master with the buttons on your HUD. You will also find a button to communicate with [summoner.p_them()] privately there."))
	to_chat(src, span_holoparasite("While personally invincible, you will die if [summoner.real_name] does, and any damage dealt to you will have a portion passed on to [summoner.p_them()] as you feed upon [summoner.p_them()] to sustain yourself."))
	to_chat(src, playstyle_string)
	if(!guardian_color)
		guardian_rename()
		guardian_recolor()

/mob/living/basic/guardian/Move()
	. = ..()
	snapback()

/// If the guardian moves out of the prescribed range of the summoner, snap it back to move to the same turf as the user.
/mob/living/basic/guardian/proc/snapback()
	if(!summoner)
		return

	if(get_dist(get_turf(summoner), get_turf(src)) >= range)
		to_chat(src, span_holoparasite("You moved out of range, and were pulled back! You can only move [range] meters from [summoner.real_name]!"))
		visible_message(span_danger("\The [src] jumps back to its user."))
		if(istype(summoner.loc, /obj/effect))
			Recall(TRUE)
		else
			new /obj/effect/temp_visual/guardian/phase/out(loc)
			forceMove(summoner.loc)
			new /obj/effect/temp_visual/guardian/phase(loc)

/mob/living/basic/guardian/death()
	drop_all_held_items()
	. = ..()
	if(summoner)
		to_chat(summoner, "[span_danger("<B>Your [name] died somehow!")]</B>")
		summoner.dust()

/mob/living/basic/guardian/gib()
	if(summoner)
		to_chat(summoner, "[span_danger("<B>Your [src] was blown up!")]</B>")
		summoner.investigate_log("has been gibbed by an explosion.", INVESTIGATE_DEATHS)
		summoner.gib()
	ghostize()
	qdel(src)

/// Quick check to see if the guardian is deployed, or present in the real world. Pass FALSE if we are inside our summoner (undeployed), TRUE otherwise.
/mob/living/basic/guardian/proc/is_deployed()
	return loc != summoner

/// Setter for our summoner mob.
/mob/living/basic/guardian/proc/set_summoner(mob/to_who)
	if(summoner)
		UnregisterSignal(summoner, list(COMSIG_LIVING_ON_WABBAJACKED, COMSIG_LIVING_SHAPESHIFTED, COMSIG_LIVING_UNSHAPESHIFTED))

	summoner = to_who
	Recall(TRUE)
	RegisterSignal(to_who, COMSIG_LIVING_ON_WABBAJACKED, PROC_REF(on_owner_wabbajacked))
	RegisterSignal(to_who, COMSIG_LIVING_SHAPESHIFTED, PROC_REF(on_owner_shapeshifted))
	RegisterSignal(to_who, COMSIG_LIVING_UNSHAPESHIFTED, PROC_REF(on_owner_unshapeshifted))

/// Signal proc for [COMSIG_LIVING_ON_WABBAJACKED], when our summoner is wabbajacked we should be alerted.
/mob/living/basic/guardian/proc/on_owner_wabbajacked(mob/living/source, mob/living/new_mob)
	SIGNAL_HANDLER

	set_summoner(new_mob)
	to_chat(src, span_holoparasite("Your summoner has changed form!"))

/// Signal proc for [COMSIG_LIVING_SHAPESHIFTED], when our summoner is shapeshifted we should change to the new mob
/mob/living/basic/guardian/proc/on_owner_shapeshifted(mob/living/source, mob/living/new_shape)
	SIGNAL_HANDLER

	set_summoner(new_shape)
	to_chat(src, span_holoparasite("Your summoner has shapeshifted into that of a [new_shape]!"))

/// Signal proc for [COMSIG_LIVING_UNSHAPESHIFTED], when our summoner unshapeshifts go back to that mob
/mob/living/basic/guardian/proc/on_owner_unshapeshifted(mob/living/source, mob/living/old_summoner)
	SIGNAL_HANDLER

	set_summoner(old_summoner)
	to_chat(src, span_holoparasite("Your summoner has shapeshifted back into their normal form!"))

// We don't want this to wabbajack/transform. No, please no.
/mob/living/basic/guardian/wabbajack(what_to_randomize, change_flags = WABBAJACK)
	visible_message(span_warning("[src] resists the polymorph!"))

/mob/living/basic/guardian/canSuicide()
	return FALSE

/mob/living/basic/guardian/melee_attack(atom/target)
	if(!is_deployed())
		to_chat(src, "[span_danger("<B>You must be manifested to attack!")]</B>")
		return FALSE
	else
		return ..()

// Track the health of our summoner so you can more accurately assess the health of who the guardian's life force is tied to.
/mob/living/basic/guardian/med_hud_set_health()
	if(summoner)
		var/image/holder = hud_list[HEALTH_HUD]
		holder.icon_state = "hud[RoundHealth(summoner)]"

/mob/living/basic/guardian/med_hud_set_status()
	if(summoner)
		var/image/holder = hud_list[STATUS_HUD]
		var/icon/I = icon(icon, icon_state, dir)
		holder.pixel_y = I.Height() - world.icon_size
		if(summoner.stat == DEAD)
			holder.icon_state = "huddead"
		else
			holder.icon_state = "hudhealthy"

/mob/living/basic/guardian/get_status_tab_items()
	. += ..()
	if(summoner)
		var/resulthealth
		if(iscarbon(summoner))
			resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
		else
			resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
		. += "Summoner Health: [resulthealth]%"
	if(!COOLDOWN_FINISHED(src, recall_cooldown))
		. += "Manifest/Recall Cooldown Remaining: [DisplayTimeText(recall_cooldown - world.time)]"

/mob/living/basic/guardian/update_health_hud()
	if(summoner && hud_used?.healths)
		var/resulthealth
		if(iscarbon(summoner))
			resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
		else
			resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
		hud_used.healths.maptext = MAPTEXT("<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='#efeeef'>[resulthealth]%</font></div>")

/mob/living/basic/guardian/adjust_health(amount, updating_health = TRUE, forced = FALSE) //The spirit is invincible, but passes on damage to the summoner
	. = amount
	if(summoner)
		if(loc == summoner)
			return FALSE
		summoner.adjustBruteLoss(amount)
		if(amount > 0)
			to_chat(summoner, "[span_danger("<B>Your [name] is under attack! You take damage!")]</B>")
			summoner.visible_message(span_danger("<B>Blood sprays from [summoner] as [src] takes damage!</B>"))
			switch(summoner.stat)
				if(UNCONSCIOUS, HARD_CRIT)
					to_chat(summoner, "[span_danger("<B>Your body can't take the strain of sustaining [src] in this condition, it begins to fall apart!")]</B>")
					summoner.adjustCloneLoss(amount * 0.5) //dying hosts take 50% bonus damage as cloneloss
		update_health_hud()

/mob/living/basic/guardian/ex_act(severity, target)
	switch(severity)
		if(EXPLODE_DEVASTATE)
			investigate_log("has been gibbed by an explosion.", INVESTIGATE_DEATHS)
			gib()
			return TRUE
		if(EXPLODE_HEAVY)
			adjustBruteLoss(60)
		if(EXPLODE_LIGHT)
			adjustBruteLoss(30)

// Handle the guardian having hands.
/mob/living/basic/guardian/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return FALSE
	if(!istype(I))
		return FALSE

	. = TRUE
	var/index = get_held_index_of_item(I)
	if(index)
		held_items[index] = null
		update_held_items()

	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.equipped(src, slot)
	SET_PLANE_EXPLICIT(I, ABOVE_HUD_PLANE, src)

/mob/living/basic/guardian/proc/apply_overlay(cache_index)
	if((. = guardian_overlays[cache_index]))
		add_overlay(.)

/mob/living/basic/guardian/proc/remove_overlay(cache_index)
	var/I = guardian_overlays[cache_index]
	if(I)
		cut_overlay(I)
		guardian_overlays[cache_index] = null

/mob/living/basic/guardian/update_held_items()
	remove_overlay(GUARDIAN_HANDS_LAYER)
	var/list/hands_overlays = list()
	var/obj/item/l_hand = get_item_for_held_index(1)
	var/obj/item/r_hand = get_item_for_held_index(2)

	if(r_hand)
		hands_overlays += r_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = r_hand.righthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			SET_PLANE_EXPLICIT(r_hand, ABOVE_HUD_PLANE, src)
			r_hand.screen_loc = ui_hand_position(get_held_index_of_item(r_hand))
			client.screen |= r_hand

	if(l_hand)
		hands_overlays += l_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = l_hand.lefthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			SET_PLANE_EXPLICIT(l_hand, ABOVE_HUD_PLANE, src)
			l_hand.screen_loc = ui_hand_position(get_held_index_of_item(l_hand))
			client.screen |= l_hand

	if(length(hands_overlays))
		guardian_overlays[GUARDIAN_HANDS_LAYER] = hands_overlays
	apply_overlay(GUARDIAN_HANDS_LAYER)

/mob/living/basic/guardian/regenerate_icons()
	update_held_items()

/// Sets the guardian's theme, or the sprite that it'll use. Directly tied to the setting it was summoned in (Wizard, Holoparasite, Mining Loot, etc.)
/mob/living/basic/guardian/proc/updatetheme(theme)
	if(!theme)
		theme = pick("magic", "tech", "carp", "miner")

	switch(theme)//should make it easier to create new stand designs in the future if anyone likes that

		if("magic")
			name = "Guardian Spirit"
			real_name = "Guardian Spirit"
			bubble_icon = "guardian"
			icon_state = "magicbase"
			icon_living = "magicbase"
			icon_dead = "magicbase"

		if("tech")
			name = "Holoparasite"
			real_name = "Holoparasite"
			bubble_icon = "holo"
			icon_state = "techbase"
			icon_living = "techbase"
			icon_dead = "techbase"

		if("miner")
			name = "Power Miner"
			real_name = "Power Miner"
			bubble_icon = "guardian"
			icon_state = "minerbase"
			icon_living = "minerbase"
			icon_dead = "minerbase"


		if("carp")
			name = "Holocarp"
			real_name = "Holocarp"
			bubble_icon = "holo"
			icon_state = "holocarp"
			icon_living = "holocarp"
			icon_dead = "holocarp"
			speak_emote = list("gnashes")
			desc = "A mysterious fish that stands by its charge, ever vigilant."
			attack_verb_continuous = "bites"
			attack_verb_simple = "bite"
			attack_sound = 'sound/weapons/bite.ogg'
			attack_vis_effect = ATTACK_EFFECT_BITE
			recolor_entire_sprite = TRUE

	if(!recolor_entire_sprite) //we want this to proc before stand logs in, so the overlay isn't gone for some reason
		cool_overlay = mutable_appearance(icon, theme)
		add_overlay(cool_overlay)

/// Allows the player controlling the guardian to pick the color they want to be.
/mob/living/basic/guardian/proc/guardian_recolor()
	guardian_color = input(src, "What would you like your color to be?", "Choose Your Color", "#ffffff") as color|null
	if(!guardian_color) //redo proc until we get a color
		to_chat(src, span_warning("Not a valid color, please try again."))
		guardian_recolor()
		return
	if(!recolor_entire_sprite)
		cool_overlay.color = guardian_color
		cut_overlay(cool_overlay) //we need to get our new color
		add_overlay(cool_overlay)
	else
		add_atom_colour(guardian_color, FIXED_COLOUR_PRIORITY)

/// Allows the player controlling the guardian to pick the name they want to assume.
/mob/living/basic/guardian/proc/guardian_rename()
	var/new_name = sanitize_name(reject_bad_text(tgui_input_text(src, "What would you like your name to be?", "Choose Your Name", real_name, MAX_NAME_LEN)))
	if(!new_name) //redo proc until we get a good name
		to_chat(src, span_warning("Not a valid name, please try again."))
		guardian_rename()
		return
	to_chat(src, span_notice("Your new name [span_name("[new_name]")] anchors itself in your mind."))
	fully_replace_character_name(null, new_name)

/// The guardian's ability to manifest itself in the real world, derived from the life energy of its summoner or whatever it is
/mob/living/basic/guardian/proc/Manifest(forced)
	if(istype(summoner.loc, /obj/effect) || (!COOLDOWN_FINISHED(src, recall_cooldown) && !forced) || locked)
		return FALSE
	if(loc == summoner)
		forceMove(summoner.loc)
		new /obj/effect/temp_visual/guardian/phase(loc)
		COOLDOWN_START(src, recall_cooldown, recall_cooldown_duration)
		reset_perspective()
		return TRUE
	return FALSE

/// The guardian's recalling itself back into its summoner so it can remain "hidden" from the world.
/mob/living/basic/guardian/proc/Recall(forced)
	if(!summoner || loc == summoner || (!COOLDOWN_FINISHED(src, recall_cooldown) && !forced) || locked)
		return FALSE
	new /obj/effect/temp_visual/guardian/phase/out(loc)
	// we add it to the contents of the summoner to be super sure people can't detect it.
	forceMove(summoner)
	COOLDOWN_START(src, recall_cooldown, recall_cooldown_duration)
	return TRUE

/// The ability to shift a mode, or "attack style"
/mob/living/basic/guardian/proc/ToggleMode()
	to_chat(src, "[span_danger("<B>You don't have another mode!</B>")]")

/// The ability to turn the "inherent" light within a guardian on or off.
/mob/living/basic/guardian/proc/ToggleLight()
	if(!light_on)
		to_chat(src, span_notice("You activate your light."))
		set_light_on(TRUE)
	else
		to_chat(src, span_notice("You deactivate your light."))
		set_light_on(FALSE)

/// Verb that allows the guardian to re-check what type of guardian it is, and what its abilities are.
/mob/living/basic/guardian/verb/ShowType()
	set name = "Check Guardian Type"
	set category = "Guardian"
	set desc = "Check what type you are."
	to_chat(src, playstyle_string)

/// How we allow the guardian to speak to its summoner.
/mob/living/basic/guardian/proc/Communicate()
	if(summoner)
		var/sender_key = key
		var/input = tgui_input_text(src, "Enter a message to tell your summoner", "Guardian")
		if(sender_key != key || !input) //guardian got reset, or did not enter anything
			return

		var/preliminary_message = span_holoparasite_bold(input) //apply basic color/bolding
		var/my_message = "<font color=\"[guardian_color]\"><b><i>[src]:</i></b></font> [preliminary_message]" //add source, color source with the guardian's color

		to_chat(summoner, "<span class='say'>[my_message]</span>")
		var/list/guardians = summoner.get_all_linked_holoparasites()
		for(var/para in guardians)
			to_chat(para, "<span class='say'>[my_message]</span>")
		for(var/M in GLOB.dead_mob_list)
			var/link = FOLLOW_LINK(M, src)
			to_chat(M, "<span class='say'>[link] [my_message]</span>")

		src.log_talk(input, LOG_SAY, tag = "guardian")

/// Returns TRUE if this holoparasite has the same summoner as the passed holoparasite.
/mob/living/basic/guardian/proc/has_matching_summoner(mob/living/basic/guardian/other_guardian)
	return istype(other_guardian) && other_guardian.summoner == summoner
