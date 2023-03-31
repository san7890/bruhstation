/// Just a message in the log nothing more
/datum/exploration_event/fluff
	name = "glup shitto"

/datum/exploration_event/fluff/get_discovery_message(obj/item/exodrone/drone)
	return pick_list(EXODRONE_FILE,drone.location.fluff_type)
