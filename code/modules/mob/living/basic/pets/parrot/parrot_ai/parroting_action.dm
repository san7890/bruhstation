/// When a parrot... parrots...
/datum/ai_planning_subtree/parrot_as_in_repeat
	operational_datums = list(/datum/element/listen_and_repeat)

/datum/ai_planning_subtree/parrot_as_in_repeat/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	var/atom/speaking_pawn = controller.pawn
	var/potential_string = controller.blackboard[BB_PARROT_REPEAT_STRING]
	var/probability = controller.blackboard[BB_PARROT_REPEAT_PROBABILITY]
	var/return_value = SEND_SIGNAL(speaking_pawn, COMSIG_NEEDS_NEW_PHRASE)

	potential_string = controller.blackboard[BB_PARROT_REPEAT_STRING]

	if(isnull(potential_string) || prob(probability))
		return

	controller.queue_behavior(/datum/ai_behavior/perform_speech/parrot, potential_string)

/datum/ai_behavior/perform_speech/parrot
	action_cooldown = 2 SECONDS

