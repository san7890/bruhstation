/// Simple component that forces a mob to only move in certain directions based on what direction they're facing
/// Hm, I wonder what this could be used for.
/datum/component/crab_movement
	/// Bitflag - The directions that we should only move in. (i.e. only West and East)
	var/allowed_directions = NONE
	/// Number - The acceptable angle to turn to when we try to move in a direction we're not allowed to. 90 is typically fair.
	var/acceptable_turning_angle

	/// Typecasted cache of our parent.
	var/mob/living/living_parent

/datum/component/crab_movement/Initialize(allowed_directions, acceptable_turning_angle)
	. = ..()
	if(!isliving(parent) || isnull(allowed_directions) || !isnum(acceptable_turning_angle))
		return COMPONENT_INCOMPATIBLE

	src.living_parent = parent
	src.allowed_directions = allowed_directions
	src.acceptable_turning_angle = acceptable_turning_angle

	RegisterSignal(parent, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(pre_movement))

/datum/component/crab_movement/Destroy()
	living_parent = null
	return ..()

/datum/component/crab_movement/proc/pre_movement(new_loc)
	SIGNAL_HANDLER
	var/current_loc = living_parent.loc
	var/movement_dir = get_dir(current_loc, new_loc)
	if(movement_dir & allowed_directions)
		return

	// alright, so the player (presumably) wants to move in an invalid direction. that's okay, we just gotta make sure the sprite turns in some way.
	// this is to give the illusion that they turned, then moved.
	// note that even if the following calculation doesn't yield a cardinal direction, it just means that we were moving in a non-cardinal direction anyways...
	// and i think we're just gonna have to live with that, looks fine anyways.
	var/direction_to_turn = angle2dir(pick(dir2angle(movement_dir) + acceptable_turning_angle, dir2angle(movement_dir) - acceptable_turning_angle)) // this automagically normalizes the angle btw
	living_parent.dir = direction_to_turn









