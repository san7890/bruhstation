/// Allows the user to create the powerful wendigo slam ability
/datum/element/wendigo_slam
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2

/datum/element/wendigo_slam/Attach(datum/target)
	. = ..()
	if (!isliving(target))
		return ELEMENT_INCOMPATIBLE

	ADD_TRAIT(target, TRAIT_WENDIGO_SLAMMER, ELEMENT_TRAIT(src))
	RegisterSignal(target, COMSIG_WENDIGO_SLAM, PROC_REF(handle_wendigo_slam), override = TRUE)

/datum/element/wendigo_slam/Detach(datum/target)
	. = ..()
	REMOVE_TRAIT(target, TRAIT_WENDIGO_SLAMMER, ELEMENT_TRAIT(src))
	UnregisterSignal(target, COMSIG_WENDIGO_SLAM)

/// Signal Handler Wrapper for the wendigo slam ability
/datum/element/wendigo_slam/proc/handle_wendigo_slam(datum/source, range, delay, throw_range)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, PROC_REF(wendigo_slam), range, delay, throw_range)

/// Causes a ground slam effect that throws targets within range
/datum/element/wendigo_slam/proc/wendigo_slam(datum/source, range, delay, throw_range)
	var/turf/origin = get_turf(source)
	if(isnull(origin))
		return

	var/list/all_turfs = RANGE_TURFS(range, origin)
	for(var/sound_range = 0 to range)
		playsound(origin, 'sound/effects/bamf.ogg', 600, TRUE, 10)
		for(var/turf/stomp_turf in all_turfs)
			if(get_dist(origin, stomp_turf) > sound_range)
				continue

			new /obj/effect/temp_visual/small_smoke/halfsecond(stomp_turf)

			for(var/mob/living/hit_mob in stomp_turf)
				if(hit_mob == source || hit_mob.throwing)
					continue
				to_chat(hit_mob, span_userdanger("[source]'s ground slam shockwave sends you flying!"))
				var/turf/thrownat = get_ranged_target_turf_direct(source, hit_mob, throw_range, rand(-10, 10))
				hit_mob.throw_at(thrownat, 8, 2, null, TRUE, force = MOVE_FORCE_OVERPOWERING, gentle = TRUE)
				hit_mob.apply_damage(20, BRUTE, wound_bonus = CANT_WOUND)
				shake_camera(hit_mob, 2, 1)

			all_turfs -= stomp_turf

		SLEEP_CHECK_DEATH(delay, source)
