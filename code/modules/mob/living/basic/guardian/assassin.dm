//Assassin
/mob/living/basic/guardian/assassin
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_SLASH
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 1, CLONE = 1, STAMINA = 0, OXY = 1)
	playstyle_string = span_holoparasite("As an <b>assassin</b> type you do medium damage and have no damage resistance, but can enter stealth, massively increasing the damage of your next attack and causing it to ignore armor. Stealth is broken when you attack or take damage.")
	magic_fluff_string = span_holoparasite("..And draw the Space Ninja, a lethal, invisible assassin.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Assassin modules loaded. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's an assassin carp! Just when you thought it was safe to go back to the water... which is unhelpful, because we're in space.")
	miner_fluff_string = span_holoparasite("You encounter... Glass, a sharp, fragile attacker.")
	toggle_button_type = /atom/movable/screen/guardian/toggle_mode/assassin
	recall_cooldown = 4 SECONDS
	var/datum/action/cooldown/guardian/stealth/stealth_action
	/// Swap between stealth and power mode.
	var/toggle = FALSE
	/// How long of a cooldown we should apply since we were forced out of stealth mode and had to go into a cooldown.
	var/stealth_cooldown_duration = 16 SECONDS
	COOLDOWN_DECLARE(stealth_cooldown)
	var/atom/movable/screen/alert/can_stealth_alert
	var/atom/movable/screen/alert/in_stealth_alert

/mob/living/basic/guardian/assassin/Initialize(mapload, theme)
	stealth_action = new
	stealth_action.Grant(src)
	return ..()

/mob/living/basic/guardian/assassin/Destroy()
	QDEL_NULL(stealth_action)
	return ..()

/mob/living/basic/guardian/assassin/Life(delta_time = SSMOBS_DT, times_fired)
	. = ..()
	update_stealth_alert()
	if(loc == summoner && toggle)
		ToggleMode()

/mob/living/basic/guardian/assassin/get_status_tab_items()
	. = ..()
	if(!COOLDOWN_FINISHED(src, stealth_cooldown))
		. += "Stealth Cooldown Remaining: [DisplayTimeText(stealth_cooldown - world.time)]"

/mob/living/basic/guardian/assassin/melee_attack(atom/target)
	if(toggle && (isliving(target) || istype(target, /obj/structure/window) || istype(target, /obj/structure/grille)))
		ToggleMode()

	return ..()

/mob/living/basic/guardian/assassin/adjust_health(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0 && toggle)
		ToggleMode()

/// yeah apparently basic mobs controlled by players use attack_animal() instead of attack_basic(). mmmm.
/mob/living/basic/guardian/assassin/attack_animal()
	if(toggle) // anyways we attacked someone in stealth mode, so we crash out of stealth mode and swap into regular ol' guardian mode.
		ToggleMode()

	return ..()

/mob/living/basic/guardian/assassin/Recall()
	if(..() && toggle)
		ToggleMode()

/// Toggles between stealth mode and standard mode.
/mob/living/basic/guardian/assassin/ToggleMode()
	if(toggle)
		stealth_action.normalize_power()
		update_stealth_alert()
		toggle = FALSE
	else
		stealth_action.empower()
		update_stealth_alert()
		toggle = TRUE

/// Depending on our current on-screen alerts, update what shows up to the player's screen.
/mob/living/basic/guardian/assassin/proc/update_stealth_alert()
	if(COOLDOWN_FINISHED(src, stealth_cooldown))
		if(toggle)
			if(!in_stealth_alert)
				in_stealth_alert = throw_alert("in_stealth", /atom/movable/screen/alert/in_stealth)
				clear_alert("can_stealth")
				can_stealth_alert = null
		else
			if(!can_stealth_alert)
				can_stealth_alert = throw_alert("can_stealth", /atom/movable/screen/alert/can_stealth)
				clear_alert("in_stealth")
				in_stealth_alert = null
	else
		clear_alert("in_stealth")
		in_stealth_alert = null
		clear_alert("can_stealth")
		can_stealth_alert = null
