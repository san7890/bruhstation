/// Parent will send a warning message that it's in a space area, because people can slip and fall into other z-levels and lose the item.
#define IN_SPACE "In Space"
/// Parent will send a warning message that it's in a mining zone, it's not fond of the climate and animals found in this zone so it'll be unhappy.
#define IN_MINING "In Mining"
/// Parent is outside in the rocky wastes of the icemoon, how tragic. It's not happy about that.
#define IN_ICEMOON "In Icemoon"
/// Parent will send a message about how we're on a good shuttle going to a valid location! Yippie!
#define ON_FAVORABLE_SHUTTLE "On Favorable Shuttle"
/// Parent will send a message about how this shuttle goes somewhere we don't want to go! Uh-oh!
#define ON_UNFAVORABLE_SHUTTLE "On Unfavorable Shuttle"
/// Parent will send a message about the nice amenities of the Syndicate Shuttle they are currently on.
#define ON_SYNDICATE_SHUTTLE "On Syndicate Shuttle"
/// Parent will send a message about how you're going outside of the station into a planetary area, and starts to tick down a timer...
#define OUTSIDE_ON_PLANETARY_STATION "Outside on Planetary Station"
/// Parent will send a message about being left alone when you drop it. Very saddening.
#define DROPPED_ALONE "Dropped Alone"
/// Parent will send a message about how we're safe inside the station. Just chilling out and hanging around. Good times.
#define ON_STATION "On Station"
/// Parent will send a message about how they're thankful that they're safe inside the station.
#define BACK_INSIDE_STATION "Back Inside Station"
/// Parent will send a callous message to anyone who can hear it right before it zoops away.
#define PISSING_OFF "Pissing Off"
/// Parent will send a message about how it's going to start counting down until you put it back in a station area.
#define CLINGY_TIMER_START_MESSAGE "Clingy Timer Start Message"

#define COMPONENT_FORCED_SPEAK_NAME "Clingy Stationloving Component"

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
	/// Number of seconds we create a bound-checking timer for. This only matters in clingy mode, and it's how long the item-holder has to get back to a safe zone.
	var/clingy_timer_duration = 30 SECONDS
	/// Are we currently on a cooldown for the (unimportant) messaging tree? This is to prevent spamming the user with messages. Don't use this for the important stuff, like the off-station timer.
	var/unimportant_clingy_message_cooldown = FALSE

	/// Typecache of shuttles that we allow the disk to stay on
	var/static/list/allowed_shuttles = typecacheof(list(
		/area/shuttle/syndicate,
		/area/shuttle/escape,
		/area/shuttle/pod_1,
		/area/shuttle/pod_2,
		/area/shuttle/pod_3,
		/area/shuttle/pod_4,
	))
	/// Typecache of areas on the centcom Z-level that we do not allow the disk to stay on
	var/static/list/disallowed_centcom_areas = typecacheof(list(
		/area/centcom/abductor_ship,
		/area/awaymission/errorroom,
	))
	/// Typecache of areas that are considered "outdoors" on the station Z-level. This is... everything that's not reasonably a station area (/area/station subtypes)
	var/static/list/outdoors_areas = typecacheof(list(
		/area/icemoon,
		/area/lavaland, // planetary maps could use lavaland areas!
		/area/mine,
	))

/datum/component/stationloving/Initialize(inform_admins = FALSE, allow_item_destruction = FALSE, clingy = FALSE, clingy_timer_duration = 30 SECONDS)
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	src.inform_admins = inform_admins
	src.allow_item_destruction = allow_item_destruction
	src.clingy = clingy
	src.clingy_timer_duration = clingy_timer_duration

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
/// Don't handle logging here. Please do it in the calling proc, since this is meant to operate agnostic of context.
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

	if(atom_in_bounds(source, clingy))
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

/// Signal proc for [SIGNAL_ADDTRAIT], via [TRAIT_SECLUDED_LOCATION] on our locs, to ensure nothing funky happens
/datum/component/stationloving/proc/on_loc_secluded(atom/movable/source)
	SIGNAL_HANDLER

	var/turf/new_destination = relocate()
	// for our intents and purposes regarding secluded, the source is both the source atom and the destination turf
	generate_logs(source, source, new_destination, loc_changed = FALSE)

/// Generate logs and messages for when our parent goes back to the station. Args are important in how you pass them in.
/// Source Atom was the location where the parent was "safe", the very last turf that it was okay at right before we started to move it. Could be the thing that's secluding the disk, or the source turf.
/// Destination Turf was the turf that the parent was moved to. This is the "unsafe" turf that triggered the forceMove. If we're calling this since parent got put in a secluded area, pass loc_changed as FALSE.
/// Final Turf is the turf that we forceMoved the parent to after we determined it was in an invalid area.
/// Use clingy_timer_expired if we do a timer countdown to requesting the parent to be moved back to the station, and the timer expired.
/datum/component/stationloving/proc/generate_logs(atom/source, turf/destination_turf, turf/final_turf, loc_changed = TRUE, clingy_timer_expired = FALSE)
	if(clingy_timer_expired)
		log_game("The [DisplayTimeText(clingy_timer_duration)] timer on [parent] ran out after finding itself in [loc_name(source)], \
		so it has been moved to [loc_name(final_turf)] from it's final recorded position of [loc_name(destination_turf)].")

		if(inform_admins)
			message_admins("The [DisplayTimeText(clingy_timer_duration)] timer on [parent] ran out after finding itself in [loc_name(source)], \
			so it has been moved to [ADMIN_VERBOSEJMP(final_turf)] from it's final recorded position of [ADMIN_VERBOSEJMP(destination_turf)].")

	if(loc_changed)
		log_game("[parent] attempted to be moved out of bounds from [loc_name(source)] \
		to [loc_name(destination_turf)]. Moving it to [loc_name(final_turf)].")

		if(inform_admins)
			message_admins("[parent] attempted to be moved out of bounds from [ADMIN_VERBOSEJMP(source)] \
				to [ADMIN_VERBOSEJMP(destination_turf)]. Moving it to [ADMIN_VERBOSEJMP(final_turf)].")
	else
		log_game("[parent] moved out of bounds at [loc_name(source)], becoming inaccessible / secluded. \
			Moving it to [loc_name(final_turf)].")

		if(inform_admins)
			message_admins("[parent] moved out of bounds at [ADMIN_VERBOSEJMP(source)], becoming inaccessible / secluded. \
				Moving it to [ADMIN_VERBOSEJMP(final_turf)].")

/datum/component/stationloving/proc/check_soul_imbue(datum/source)
	SIGNAL_HANDLER

	if(disallow_soul_imbue)
		return COMPONENT_BLOCK_IMBUE

/datum/component/stationloving/proc/check_mark_retrieval(datum/source)
	SIGNAL_HANDLER

	return COMPONENT_BLOCK_MARK_RETRIEVAL

/// Checks whether a given atom's turf is within bounds. Returns TRUE if it is, FALSE if it isn't.
/// is_clingy is a boolean that determines whether we should enable additional checking for clinginess.
/datum/component/stationloving/proc/atom_in_bounds(atom/atom_to_check, is_clingy = FALSE)
	// Our loc is a secluded location = not in bounds
	if (atom_to_check.loc && HAS_TRAIT(atom_to_check.loc, TRAIT_SECLUDED_LOCATION))
		return FALSE
	// No turf below us = nullspace = not in bounds
	var/turf/destination_turf = get_turf(atom_to_check)
	var/area/destination_area = get_area(atom_to_check)
	if (!destination_turf)
		return FALSE
	if (is_station_level(destination_turf.z))
		if(is_clingy)
			if(!(is_type_in_typecache(destination_area, outdoors_areas) && clingy_handling)) // if passed, we over-write the rest of the proc here, just in case we're doing some clingy handling timers and such
				if(!clingy_outdoors_checking())
					return FALSE
			else
				clingy_messaging_tree()
		return TRUE

	if (is_centcom_level(destination_turf.z))
		if (is_type_in_typecache(destination_area, disallowed_centcom_areas))
			return FALSE
		return TRUE
	if (is_reserved_level(destination_turf.z))
		if (is_type_in_typecache(destination_area, allowed_shuttles))
			return TRUE

/// Handles specific clingy behavior for when our parent is outdoors (like in space, or outside on a planetary map). Return TRUE if we're inside and fine, FALSE otherwise.
/datum/component/stationloving/proc/clingy_outdoors_checking()
	var/atom/movable/item = parent
	var/item_area = get_area(item)

	var/first_recorded_turf = get_turf(item)

	// Alright, we're in the great outdoors. It's hustle time.
	clingy_handling = TRUE
	clingy_message(determine_appropriate_message(item_area))

	addtimer(CALLBACK(src, .proc/clingy_message, CLINGY_TIMER_START_MESSAGE), 1 SECONDS) // little bit of a delay to make it look more natural even though the timers spitting

	var/timer_countdown = (clingy_timer_duration / (1 SECONDS))
	for(var/integer in 1 to timer_countdown)
		item.balloon_alert_to_viewers("[timer_countdown - integer] seconds left...") // "29 seconds left..."
		if(atom_in_bounds(item, is_clingy = TRUE))
			clingy_handling = FALSE
			clingy_message(BACK_INSIDE_STATION)
			return TRUE
		sleep(1 SECONDS)

	// Timer ran out, and our plead was not heeded. We're moving.
	clingy_message(PISSING_OFF)
	var/final_recorded_turf = get_turf(item)
	var/turf_to_move_to = find_safe_turf()
	generate_logs(first_recorded_turf, final_recorded_turf, turf_to_move_to, clingy_timer_expired = TRUE)
	addtimer(CALLBACK(src, .proc/full_move, turf_to_move_to), 1 SECONDS)
	addtimer(CALLBACK(src, .proc/invert_clingy_handling), 1 SECONDS) // this is just so the override lasts long enough so we can teleport once, and not trigger another one immediately after.
	return FALSE

/// Simple proc that just inverts the value of clingy_handling, just so we can assign a timer to it.
/datum/component/stationloving/proc/invert_clingy_handling()
	clingy_handling = !clingy_handling
	return clingy_handling

/// This handles saying funny/important messages in certain situations that our parent can find itself in.
/// Do not put anything critical to atom_in_bounds() here, add a new proc or update clingy_outdoors_handling() instead.
/datum/component/stationloving/proc/clingy_messaging_tree()
	if(unimportant_clingy_message_cooldown || clingy_handling)
		return

	var/atom/movable/item = parent
	var/item_area = get_area(item)

	// We're in space now!
	if(istype(item_area, /area/space))
		clingy_message(IN_SPACE)
		cooldown_clingy_messages()
		return

	// Handle shuttles.
	if(istype(item_area, /area/shuttle))
		if(is_type_in_typecache(item_area, allowed_shuttles))
			if(istype(item_area, /area/shuttle/syndicate))
				clingy_message(ON_SYNDICATE_SHUTTLE) // some funny special lines here :)
				cooldown_clingy_messages()
				return
			clingy_message(ON_FAVORABLE_SHUTTLE)
			cooldown_clingy_messages()
		// Return FALSE so we can give a desired message appropriate to the situation, but continue with bounds checking in atom_in_bounds()
		clingy_message(ON_UNFAVORABLE_SHUTTLE)
		cooldown_clingy_messages()
		return

	// Small message to tell you how much it appreciates being on the station :)
	if(prob(0.1) && istype(item_area, /area/station))
		clingy_message(ON_STATION)
		cooldown_clingy_messages()
		return

/// For non-important messages only (like when we're in space and not about to teleport away). Cooldowns are handled here.
/datum/component/stationloving/proc/cooldown_clingy_messages()
	unimportant_clingy_message_cooldown = TRUE
	addtimer(CALLBACK(src, .proc/restore_clingy_messages), clingy_timer_duration) // Re-use clingy_timer_duration here because it's all sorta cohesive in that way.
	return

/datum/component/stationloving/proc/restore_clingy_messages()
	unimportant_clingy_message_cooldown = FALSE
	return

/// We're not in a safe area, so we need to move. Let's figure out what message we should send based on our area. Return the type of message we want to say.
/datum/component/stationloving/proc/determine_appropriate_message(area/area_in_question)
	if(istype(area_in_question, /area/icemoon))
		return IN_ICEMOON
	if(istype(area_in_question, /area/mine) || istype(area_in_question, /area/lavaland))
		return IN_MINING
	stack_trace("determine_appropriate_message() called on an area that doesn't have a message defined. Area: [area_in_question]")

/// Special proc for clingy items. This is the message (user feedback) that the parent will say aloud when a certain situation occurs.
/// Pass in one of the define macros at the top of this file to get the appropriate message for that situation.
/datum/component/stationloving/proc/clingy_message(message_type)
	var/atom/movable/speaker = parent
	switch(message_type) // san7890 - these are default messages. change these.
		if(CLINGY_TIMER_START_MESSAGE)
			speaker.say("Get me back inside in [DisplayTimeText(clingy_timer_duration)] or I'll be very upset!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(IN_ICEMOON)
			speaker.say("I'm outside in the ice! It's so cold!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(IN_MINING)
			speaker.say("I'm in the asteroid!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(IN_SPACE)
			speaker.say("I'm in space!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(ON_FAVORABLE_SHUTTLE)
			speaker.say("I'm on a shuttle that's going to CentCom! I'm safe here!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(ON_STATION)
			speaker.say("I'm inside the station! I like being safe here!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(BACK_INSIDE_STATION)
			speaker.say(("Phew, back inside the station." + " I'm alright now."), forced = COMPONENT_FORCED_SPEAK_NAME)
		if(ON_SYNDICATE_SHUTTLE)
			speaker.say("There appears to be a lot of red in here...", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(ON_UNFAVORABLE_SHUTTLE)
			speaker.say("I'm on a shuttle that's not going to the station! I need to be on a shuttle that's going to the station!", forced = COMPONENT_FORCED_SPEAK_NAME)
		if(PISSING_OFF)
			speaker.say("Fuck you, I'm out of here. :middle_finger:", forced = COMPONENT_FORCED_SPEAK_NAME)
		else
			stack_trace("Called clingy_message without a valid message_type.")


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

#undef CLINGY_TIMER_START_MESSAGE
#undef COMPONENT_FORCED_SPEAK_NAME
#undef IN_ICEMOON
#undef IN_MINING
#undef IN_SPACE
#undef ON_FAVORABLE_SHUTTLE
#undef ON_STATION
#undef ON_SYNDICATE_SHUTTLE
#undef ON_UNFAVORABLE_SHUTTLE
#undef OUTSIDE_ON_PLANETARY_STATION
#undef PISSING_OFF
#undef BACK_INSIDE_STATION
