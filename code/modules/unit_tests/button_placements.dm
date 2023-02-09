/// Tests to ensure that any given button anywhere is accessible by checking to ensure that there is at least one valid turf that a given mob can qualify to it's adjacency check.
/// To be a valid turf, just has to be an open turf with no dense objects blocking it. You shouldn't have to move a table to hit a button or something silly like that.
/// Doesn't test for any aesthetic/stylistic issues, just that a mob can touch it.
/datum/unit_test/validate_button_placements

/datum/unit_test/validate_button_placements/Run()
	for(var/obj/machinery/button/pressable in GLOB.machines)
		// The location we are placed on in a map. Remember, we place it on an open turf and then pixel-shift it onto a table or wall or something.
		var/turf/placed_location = get_turf(pressable)
		var/area/location_name = get_area(placed_location)
		if(isclosedturf(placed_location))
			TEST_FAIL("Button [pressable] ([pressable.type]) at [AREACOORD(placed_location)] (in area [location_name.type]) is in a closed turf! This is not acceptable, place it on an open turf and pixel-shift it onto a wall.")
			continue

		var/list/applicable_turfs = list()
		applicable_turfs += placed_location // include the turf we're on.

		for(var/turf/surrounding_turf in orange(1, placed_location))
			if(isclosedturf(surrounding_turf))
				continue
			applicable_turfs += surrounding_turf

		var/successful_placement = FALSE
		for(var/turf/checkable as anything in applicable_turfs)
			if(validate_open_turf_density(checkable))
				successful_placement = TRUE
				break

		if(!successful_placement)
			TEST_FAIL("Button [pressable] ([pressable.type]) at [AREACOORD(placed_location)] (in area [location_name.type]) is not accessible by a mob, as there is a dense object in the way of it.")


/// Checks to ensure that a given turf is open and has no dense objects on it. Returns TRUE if it is clear of obstructions, FALSE if it isn't.
/datum/unit_test/validate_button_placements/proc/validate_open_turf_density(turf/checkable)
	for(var/atom/movable/thing in checkable)
		if(thing.density) // If ANYTHING is dense, we fail.
			return FALSE

	return TRUE

