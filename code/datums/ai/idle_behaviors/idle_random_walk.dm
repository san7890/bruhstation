/datum/idle_behavior/idle_random_walk
	///Chance that the mob random walks per second
	var/walk_chance = 25
	/// What dirs does this mob typically walk in? Defaults to alldirs.
	var/dirs

/datum/idle_behavior/idle_random_walk/New()
	dirs = GLOB.alldirs // yeah i hate it here too

/datum/idle_behavior/idle_random_walk/perform_idle_behavior(seconds_per_tick, datum/ai_controller/controller)
	. = ..()
	var/mob/living/living_pawn = controller.pawn
	if(LAZYLEN(living_pawn.do_afters))
		return

	if(SPT_PROB(walk_chance, seconds_per_tick) && (living_pawn.mobility_flags & MOBILITY_MOVE) && isturf(living_pawn.loc) && !living_pawn.pulledby)
		var/move_dir = pick(dirs)
		living_pawn.Move(get_step(living_pawn, move_dir), move_dir)

/datum/idle_behavior/idle_random_walk/less_walking
	walk_chance = 10

/// Crabs don't walk in straight lines when they don't have anything better to do, they just sorta walk left and right.
/datum/idle_behavior/idle_random_walk/crab
	dirs = list(EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
