/// Looks for cool items, or maybe people with cool items to start hordeing stuff.
/datum/ai_planning_subtree/find_interesting_things

/datum/ai_planning_subtree/find_interesting_things/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()

	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(!QDELETED(target))
		// Busy with something
		return

	if(QDELETED(ai_controller.blackboard[BB_PARROT_INANIMATE_PERCH])) // first order is to nab a nice perch
		ai_controller.queue_behavior(/datum/ai_behavior/find_and_set/in_list/turf_location, BB_PARROT_INANIMATE_PERCH, controller.blackboard[BB_PARROT_PERCH_TYPES])
		return SUBTREE_RETURN_FINISH_PLANNING



