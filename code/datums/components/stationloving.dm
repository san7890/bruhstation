/// Parent will send a warning message that it's in a space area, because people can slip and fall into other z-levels and lose the item.
#define IN_SPACE "In Space"
/// Parent will send a message about how we're on a good shuttle going to a valid location! Yippie!
#define ON_FAVORABLE_SHUTTLE "On Favorable Shuttle"
/// Parent will send a message about how this shuttle goes somewhere we don't want to go! Uh-oh!
#define ON_UNFAVORABLE_SHUTTLE "On Unfavorable Shuttle"
/// Parent will send a message about how you're going outside of the station into a planetary area, and starts to tick down a timer...
#define OUTSIDE_ON_PLANETARY_STATION "Outside on Planetary Station"
/// Parent will send a message about being left alone when you drop it. Very saddening.
#define DROPPED_ALONE "Dropped Alone"
/// Parent will send a message about how we're back inside the station, safe at-last.
#define BACK_INSIDE_STATION "Back Inside Station"
/// Parent will send a callous message to anyone who can hear it right before it zoops away.
#define PISSING_OFF "Pissing Off"

/// Teleports the movable atom back to a safe turf on the station if it leaves the z-level or becomes inaccessible.
/datum/component/stationloving
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	/// If TRUE, notifies admins when parent is teleported back to the station.
	var/inform_admins = FALSE
	/// Boolean that prevents liches from imbuing their soul in this item.
	var/disallow_soul_imbue = TRUE
	/// If FALSE, prevents parent from being qdel'd unless it's a force = TRUE qdel.
	var/allow_item_destruction = FALSE
	/// Boolean that tracks if this disk is "clingy". In short terms, "clingy" disks are more strict about where they can be placed (as in being more resistant to being in a non-station area)
	/// This variable will enhance the behavior to give more user feedback as to it's preferences. It's more annoying to have to deal with, but such is the cost for being the bearer of such an important item.
	var/clingy = FALSE
	/// Boolean that tracks if we are currently processing behavior related to clinginess. Prevents message flooding (lag, things happening during timers), and allows graceful overrides of certain actions.
	var/clingy_handling = FALSE

/datum/component/stationloving/Initialize(inform_admins = FALSE, allow_item_destruction = FALSE, clingy = FALSE)
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	src.inform_admins = inform_admins
	src.allow_item_destruction = allow_item_destruction
	src.clingy = clingy

	// Just in case something is being created outside of station/centcom
	if(!atom_in_bounds(parent))
		relocate()

/datum/component/stationloving/RegisterWithParent()
	RegisterSignal(parent, COMSIG_PARENT_PREQDELETED, .proc/on_parent_pre_qdeleted)
	RegisterSignal(parent, COMSIG_ITEM_IMBUE_SOUL, .proc/check_soul_imbue)
	RegisterSignal(parent, COMSIG_ITEM_MARK_RETRIEVAL, .proc/check_mark_retrieval)
	// Relocate when we become unreachable
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, .proc/on_parent_moved)
	// Relocate when our loc, or any of our loc's locs, becomes unreachable
	var/static/list/loc_connections = list(
		COMSIG_MOVABLE_MOVED = .proc/on_parent_moved,
		SIGNAL_ADDTRAIT(TRAIT_SECLUDED_LOCATION) = .proc/on_loc_secluded,
	)
	AddComponent(/datum/component/connect_containers, parent, loc_connections)

/datum/component/stationloving/UnregisterFromParent()
	UnregisterSignal(parent, list(
		COMSIG_MOVABLE_Z_CHANGED,
		COMSIG_PARENT_PREQDELETED,
		COMSIG_ITEM_IMBUE_SOUL,
		COMSIG_ITEM_MARK_RETRIEVAL,
		COMSIG_MOVABLE_MOVED,
	))

	qdel(GetComponent(/datum/component/connect_containers))

/datum/component/stationloving/InheritComponent(datum/component/stationloving/newc, original, inform_admins, allow_death)
	if (original)
		if (newc)
			inform_admins = newc.inform_admins
			allow_death = newc.allow_item_destruction
		else
			inform_admins = inform_admins

/// We're relocated to an unfavorable position! Determine if we should immediately get back to the station, or if we're clingy, do some extra stuff.
/// If we aren't going to immediately relocate, return null to prevent any further processing on behalf of other procs. Otherwise, return the turf we're going to.
/datum/component/stationloving/proc/relocate()
	if(clingy_handling)
		return

	var/target_turf = find_safe_turf()

	if(!target_turf)
		if(GLOB.blobstart.len > 0)
			target_turf = get_turf(pick(GLOB.blobstart))
		else
			CRASH("Unable to find a blobstart landmark for [type] to relocate [parent].")

	if(clingy)
		clingy_handling = TRUE
		// Give it a second in case we're switching z-levels so the user can actually hear the message, and then teleport it back a second after their mistake is made and all they can do is watch in horror.
		addtimer(CALLBACK(src, .proc/clingy_message, PISSING_OFF), 1 SECONDS)
		addtimer(CALLBACK(src, .proc/full_move, target_turf), 2 SECONDS)
		return target_turf

	full_move(target_turf)
	return target_turf

/// Alright, let's actually move (we've exceeded all possible thresholds/affordances to the holder of this item). If no turf is provided, we'll find one ourselves.
/datum/component/stationloving/proc/full_move(turf/location_turf)
	// Set clingy handling to FALSE here, we have exhausted all possible avenues of user feedback and we're now resetting our state.
	clingy_handling = FALSE
	if(!location_turf)
		location_turf = find_safe_turf()

	var/atom/movable/movable_parent = parent
	playsound(movable_parent, 'sound/machines/synth_no.ogg', 5, TRUE)

	var/mob/holder = get(movable_parent, /mob)
	if(holder)
		to_chat(holder, span_danger("You can't help but feel that you just lost something back there..."))
		holder.temporarilyRemoveItemFromInventory(parent, TRUE) // prevents ghost diskie

	movable_parent.forceMove(location_turf)

	return location_turf

/// Signal proc for [COMSIG_MOVABLE_MOVED], called when our parent moves, or our parent's loc, or our parent's loc loc...
/// To check if our disk is moving somewhere it shouldn't be, such as off Z level, or into an invalid area
/datum/component/stationloving/proc/on_parent_moved(atom/movable/source, turf/old_turf)
	SIGNAL_HANDLER

	if(atom_in_bounds(source))
		return

	var/turf/current_turf = get_turf(source)
	var/turf/new_destination = relocate()

	// Expected behavior from relocate() is that it will return a turf if it's full-steam-ahead on moving the parent, and null if it's not.
	if(isnull(new_destination))
		return

	var/secluded
	// Our turf actually didn't change, so it's more likely we became secluded
	if(current_turf == old_turf)
		secluded = TRUE

	generate_logs(old_turf, current_turf, new_destination, loc_changed = !secluded)

/// Generate logs and messages for when our parent goes back to the station. Args are important in how you pass them in.
/// Origin Turf was the turf where the parent was "safe", the very last turf that it was okay at right before we started to move it.
/// Destination Turf was the turf that the parent was moved to. This is the "unsafe" turf that triggered the forceMove. If we're calling this since parent got put in a secluded area, pass loc_changed as FALSE.
/// Final Turf is the turf that we forceMoved the parent to after we determined it was in an invalid area.
/datum/component/stationloving/proc/generate_logs(turf/origin_turf, turf/destination_turf, turf/final_turf, loc_changed = TRUE)
	if(loc_changed)
		log_game("[parent] attempted to be moved out of bounds from [loc_name(origin_turf)] \
		to [loc_name(destination_turf)]. Moving it to [loc_name(final_turf)].")

		if(inform_admins)
			message_admins("[parent] attempted to be moved out of bounds from [ADMIN_VERBOSEJMP(origin_turf)] \
				to [ADMIN_VERBOSEJMP(destination_turf)]. Moving it to [ADMIN_VERBOSEJMP(final_turf)].")
	else
		log_game("[parent] moved out of bounds at [loc_name(destination_turf)], becoming inaccessible / secluded. \
			Moving it to [loc_name(final_turf)].")

		if(inform_admins)
			message_admins("[parent] moved out of bounds at [ADMIN_VERBOSEJMP(destination_turf)], becoming inaccessible / secluded. \
				Moving it to [ADMIN_VERBOSEJMP(final_turf)].")


/// Signal proc for [SIGNAL_ADDTRAIT], via [TRAIT_SECLUDED_LOCATION] on our locs, to ensure nothing funky happens
/datum/component/stationloving/proc/on_loc_secluded(atom/movable/source)
	SIGNAL_HANDLER

	var/turf/new_destination = relocate()
	log_game("[parent] moved out of bounds at [loc_name(source)], becoming inaccessible / secluded. \
		Moving it to [loc_name(new_destination)].")

	if(inform_admins)
		message_admins("[parent] moved out of bounds at [ADMIN_VERBOSEJMP(source)], becoming inaccessible / secluded. \
			Moving it to [ADMIN_VERBOSEJMP(new_destination)].")

/datum/component/stationloving/proc/check_soul_imbue(datum/source)
	SIGNAL_HANDLER

	if(disallow_soul_imbue)
		return COMPONENT_BLOCK_IMBUE

/datum/component/stationloving/proc/check_mark_retrieval(datum/source)
	SIGNAL_HANDLER

	return COMPONENT_BLOCK_MARK_RETRIEVAL

/// Checks whether a given atom's turf is within bounds. Returns TRUE if it is, FALSE if it isn't.
/datum/component/stationloving/proc/atom_in_bounds(atom/atom_to_check)
	// Typecache of shuttles that we allow the disk to stay on
	var/static/list/allowed_shuttles = typecacheof(list(
		/area/shuttle/syndicate,
		/area/shuttle/escape,
		/area/shuttle/pod_1,
		/area/shuttle/pod_2,
		/area/shuttle/pod_3,
		/area/shuttle/pod_4,
	))
	// Typecache of areas on the centcom Z-level that we allow the disk to stay on
	var/static/list/disallowed_centcom_areas = typecacheof(list(
		/area/centcom/abductor_ship,
		/area/awaymission/errorroom,
	))

	// Our loc is a secluded location = not in bounds
	if (atom_to_check.loc && HAS_TRAIT(atom_to_check.loc, TRAIT_SECLUDED_LOCATION))
		return FALSE
	// No turf below us = nullspace = not in bounds
	var/turf/destination_turf = get_turf(atom_to_check)
	if (!destination_turf)
		return FALSE
	if (is_station_level(destination_turf.z))
		return TRUE

	var/area/destination_area = destination_turf.loc
	if (is_centcom_level(destination_turf.z))
		if (is_type_in_typecache(destination_area, disallowed_centcom_areas))
			return FALSE
		return TRUE
	if (is_reserved_level(destination_turf.z))
		if (is_type_in_typecache(destination_area, allowed_shuttles))
			return TRUE

	return FALSE

/// Signal handler for before the parent is qdel'd. Can prevent the parent from being deleted where allow_item_destruction is FALSE and force is FALSE.
/datum/component/stationloving/proc/on_parent_pre_qdeleted(datum/source, force)
	SIGNAL_HANDLER

	var/turf/current_turf = get_turf(parent)

	if(force && inform_admins)
		message_admins("[parent] has been !!force deleted!! in [ADMIN_VERBOSEJMP(current_turf)].")
		log_game("[parent] has been !!force deleted!! in [loc_name(current_turf)].")

	if(force || allow_item_destruction)
		return FALSE

	var/turf/new_turf = relocate()
	log_game("[parent] has been destroyed in [loc_name(current_turf)]. \
		Preventing destruction and moving it to [loc_name(new_turf)].")
	if(inform_admins)
		message_admins("[parent] has been destroyed in [ADMIN_VERBOSEJMP(current_turf)]. \
			Preventing destruction and moving it to [ADMIN_VERBOSEJMP(new_turf)].")
	return TRUE

/// Special proc for clingy items. This is the message (user feedback) that the parent will say aloud when a certain situation occurs.
/// Pass in one of the define macros at the top of this file to get the appropriate message for that situation.
/datum/component/stationloving/proc/clingy_message(message_type)
	var/atom/movable/speaker = parent
	switch(message_type) // san7890 - these are default messages. change these.
		if(IN_SPACE)
			speaker.say("I'm in space! I need to be on a shuttle or on a planetary station!", forced = "Clingy Stationloving Component")
		if(ON_UNFAVORABLE_SHUTTLE)
			speaker.say("I'm on a shuttle that's not going to the station! I need to be on a shuttle that's going to the station!", forced = "Clingy Stationloving Component")
		if(ON_FAVORABLE_SHUTTLE)
			speaker.say("I'm on a shuttle that's going to the station! I'm safe here!", forced = "Clingy Stationloving Component")
		if(OUTSIDE_ON_PLANETARY_STATION)
			speaker.say("I'm outside on a planetary station! I need to be inside the station!", forced = "Clingy Stationloving Component")
		if(BACK_INSIDE_STATION)
			speaker.say("I'm back inside the station! I'm safe here!", forced = "Clingy Stationloving Component")
		if(PISSING_OFF)
			speaker.say("Fuck you, I'm out of here. :middle_finger:", forced = "Clingy Stationloving Component")
		else
			stack_trace("Called clingy_message without a message_type.")

#undef IN_SPACE
#undef ON_UNFAVORABLE_SHUTTLE
#undef ON_FAVORABLE_SHUTTLE
#undef OUTSIDE_ON_PLANETARY_STATION
#undef BACK_INSIDE_STATION
#undef PISSING_OFF
