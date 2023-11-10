/datum/ai_controller/basic_controller/parrot
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic,
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

	planning_subtrees = list(
	//	/datum/ai_planning_subtree/perch,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/parrot_as_in_repeat, // always get a witty oneliner in when you can
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)



