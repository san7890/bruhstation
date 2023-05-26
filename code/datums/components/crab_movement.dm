/// Simple component that rotates your object in relation to the direction that you are moving in.
/// Hm, I wonder what this could be used for.
/datum/component/crab_movement
	/// List - The directions that we should only move in. (i.e. only West and East)
	var/list/allowed_directions

	/// Bitflag - The normalized directions that we should move in. These correlate directly to the sprite directions that we should have.
	var/normalized_directions = NONE
	/// Bitflag - The "old" direction that we were at before moving.
	var/old_direction
	/// Typecasted cache of our parent.
	var/mob/living/living_parent

/datum/component/crab_movement/Initialize(list/allowed_directions, setup_normalized_directions = FALSE)
	. = ..()
	if(!isliving(parent) || !islist(allowed_directions))
		return COMPONENT_INCOMPATIBLE

	living_parent = parent
	src.allowed_directions = allowed_directions

	RegisterSignal(parent, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(pre_movement))
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(on_movement))

	if(setup_normalized_directions)
		setup_normalized_directions()

/datum/component/crab_movement/Destroy()
	living_parent = null
	return ..()

/// Sets up the normalized directions that we set our dir to, because not all sprites have full rotation (just four dirs)
/datum/component/crab_movement/proc/setup_normalized_directions()
	for(var/direction_entry in allowed_directions)
		switch(direction_entry)
			if(NORTH)
				normalized_directions |= NORTH
			if(SOUTH)
				normalized_directions |= SOUTH
			if(EAST)
				normalized_directions |= EAST
			if(WEST)
				normalized_directions |= WEST

/datum/component/crab_movement/proc/pre_movement(new_loc)
	SIGNAL_HANDLER
	old_direction = living_parent.dir

/// This is where the magic happens. We check the direction we're moving in, and then rotate our object to face that direction.
/datum/component/crab_movement/proc/on_movement(atom/old_loc, dir, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER
	// this is in case something new is acting upon us, i.e. not continuous. it's okay to lurch in a noncompatible direction when you start moving: but when you start going, gotta turn.
	if(!momentum_change)
		return

	var/atom/current_location = parent.loc
	if(!isturf(current_location))
		return

	if(dir in allowed_directions)
		living_parent.dir = old_direction // keep them facing the same way.
		return

	// if we're not moving in a direction we're allowed to, we orient it so it looks good. this may be a bit frustrating to a potential player at times...
	// but maybe they should consider not playing a mob that is confined to such directionality. they can click the direction they want to look at anyways.
	living_parent.dir = pick(normalized_directions)


