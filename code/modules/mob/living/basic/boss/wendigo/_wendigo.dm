#define WENDIGO_ENRAGED (health <= maxHealth * 0.5)

/// Ice-themed Boss Mob, aiming for hard difficulty with multiple abilities
/mob/living/basic/boss/wendigo
	name = "wendigo"
	desc = "A mythological man-eating legendary creature, the sockets of its eyes track you with an unsatiated hunger."
	health = 2500
	maxHealth = 2500
	icon_state = "wendigo"
	icon_living = "wendigo"
	icon_dead = "wendigo_dead"
	icon = 'icons/mob/simple/icemoon/64x64megafauna.dmi'
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/effects/magic/demon_attack1.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW

	speak_emote = list("roars")
	armour_penetration = 40
	melee_damage_lower = 40
	melee_damage_upper = 40

	pixel_x = -16
	base_pixel_x = -16
	gps_name = "Berserk Signal"

	butcher_results = list()
	guaranteed_butcher_results = list(/obj/item/wendigo_blood = 1, /obj/item/wendigo_skull = 1)
	crusher_loot = /obj/item/crusher_trophy/wendigo_horn
	wander = FALSE

	vision_range = 9
	aggro_vision_range = 18 // man-eating for a reason
	speed = 6
	move_to_delay = 6
	ranged = TRUE

	basic_mob_flags = DEL_ON_DEATH

	default_blood_volume = BLOOD_VOLUME_NORMAL

	death_message = "falls to the ground in a bloody heap, shaking the arena."
	death_sound = 'sound/effects/gravhit.ogg'

	summon_line = "GwaHOOOOOOOOOOOOOOOOOOOOO"

	achievements = list(
		/datum/award/achievement/boss/boss_killer,
		/datum/award/achievement/boss/wendigo_kill,
		/datum/award/score/boss_score,
		/datum/award/score/wendigo_score,
	)
	crusher_achievement_type = /datum/award/achievement/boss/wendigo_crusher
	victor_memory_type = /datum/memory/megafauna_slayer

	/// Saves the turf the megafauna was created at (spawns exit portal here)
	var/turf/starting
	/// Range for wendigo stomping when it moves
	var/stomp_range = 1
	/// Stores directions the mob is moving, then calls that a move has fully ended when these directions are removed in moved
	var/stored_move_dirs = 0
	/// Time before the wendigo can scream again
	var/scream_cooldown_time = 10 SECONDS

	/// Stores the last scream time so it doesn't spam it
	COOLDOWN_DECLARE(scream_cooldown)

/mob/living/basic/boss/wendigo/Initialize(mapload)
	. = ..()
	add_traits(list(TRAIT_NO_FLOATING_ANIM, TRAIT_SNOWSTORM_IMMUNE), INNATE_TRAIT)
	AddElement(/datum/element/relay_attackers)
	AddElement(/datum/element/footstep, footstep_type = FOOTSTEP_MOB_HEAVY)

	grant_actions_by_list(get_innate_actions())

/mob/living/basic/boss/wendigo/Initialize(mapload)
	. = ..()
	starting = get_turf(src)

/// Returns a list of innate actions for the wendigo
/mob/living/basic/boss/wendigo/proc/get_innate_actions()
	var/static/list/innate_abilities = list(
		/datum/action/cooldown/mob_cooldown/teleport = BB_WENDIGO_TELEPORT_ABILITY,
		/datum/action/cooldown/mob_cooldown/projectile_attack/shotgun_blast/wendigo = BB_WENDIGO_SHOTGUN_BLAST_ABILITY,
		/datum/action/cooldown/mob_cooldown/ground_slam = BB_WENDIGO_GROUND_SLAM_ABILITY,
		/datum/action/cooldown/mob_cooldown/projectile_attack/alternating_circle = BB_WENDIGO_ALTERNATING_CIRCLE_ABILITY,
		/datum/action/cooldown/mob_cooldown/projectile_attack/spiral_shots/wendigo = BB_WENDIGO_SPIRAL_SHOT_ABILITY,
		/datum/action/cooldown/mob_cooldown/projectile_attack/wave = BB_WENDIGO_WAVE_ABILITY,
	)
	return innate_abilities

/mob/living/basic/boss/wendigo/OpenFire()
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 10 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 10 SECONDS))
	if(WENDIGO_ENRAGED)
		speed = 4
		move_to_delay = 4
	else
		stomp_range = initial(stomp_range)
		speed = initial(speed)
		move_to_delay = initial(move_to_delay)

	if(client)
		return

	var/mob/living/living_target = target
	if(istype(living_target) && living_target.stat == DEAD)
		return

	if(COOLDOWN_FINISHED(src, scream_cooldown))
		chosen_attack = rand(1, 3)
	else
		chosen_attack = rand(1, 2)
	switch(chosen_attack)
		if(1)
			ground_slam.Activate(target)
		if(2)
			teleport.Activate(target)
			if(WENDIGO_ENRAGED)
				shotgun_blast.Activate(target)
		if(3)
			do_teleport(src, starting, 0,  channel=TELEPORT_CHANNEL_BLUESPACE, forced = TRUE)
			var/shockwave_attack
			if(WENDIGO_ENRAGED)
				shockwave_attack = rand(1, 3)
			else
				shockwave_attack = rand(1, 2)
			switch(shockwave_attack)
				if(1)
					alternating_circle.enraged = WENDIGO_ENRAGED
					alternating_circle.Activate(target)
				if(2)
					spiral.enraged = WENDIGO_ENRAGED
					spiral.Activate(target)
				if(3)
					wave.Activate(target)
			update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 3 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 3 SECONDS))

/mob/living/basic/boss/wendigo/Move(atom/newloc, direct)
	stored_move_dirs |= direct
	. = ..()
	// Remove after anyways in case the movement was prevented
	stored_move_dirs &= ~direct

/mob/living/basic/boss/wendigo/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	stored_move_dirs &= ~movement_dir
	if(!stored_move_dirs)
		SEND_SIGNAL(SRC, COMSIG_WENDIGO_SLAM, stomp_range, 1, 8)

/// Signal Handler Wrapper for the wendigo scream ability
/mob/living/basic/boss/wendigo/proc/handle_wendigo_scream(datum/source)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, PROC_REF(wendigo_scream))


/// Makes a big scary scream that dazes nearby targets
/mob/living/basic/boss/wendigo/proc/wendigo_scream()
	SLEEP_CHECK_DEATH(5, src)
	playsound(get_turf(src), 'sound/effects/magic/demon_dies.ogg', 600, FALSE, 10)
	var/pixel_shift = rand(5, 15)

	animate(src, pixel_z = pixel_shift, time = 1, loop = 20, flags = ANIMATION_RELATIVE)
	animate(pixel_z = -pixel_shift, time = 1, flags = ANIMATION_RELATIVE)
	for(var/mob/living/dizzy_target in get_hearers_in_view(7, src) - src)
		dizzy_target.set_dizzy_if_lower(12 SECONDS)
		to_chat(dizzy_target, span_danger("[src] screams loudly!"))
	SLEEP_CHECK_DEATH(1 SECONDS, src)

/mob/living/basic/boss/wendigo/death(gibbed)
	if(health > 0)
		return

	if(!true_spawn)
		return ..()

	create_portal()
	return ..()

/mob/living/basic/boss/wendigo/proc/create_portal()
	var/obj/effect/portal/permanent/one_way/exit = new /obj/effect/portal/permanent/one_way(starting)
	exit.id = "wendigo arena exit"
	exit.add_atom_colour(COLOR_RED_LIGHT, ADMIN_COLOUR_PRIORITY)
	exit.set_light(20, 1, COLOR_SOFT_RED)

#undef WENDIGO_ENRAGED
