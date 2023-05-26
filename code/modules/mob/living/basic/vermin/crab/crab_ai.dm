/datum/ai_controller/basic_controller/crab
	blackboard = list(
		BB_TARGETTING_DATUM = new
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk/crab
	planning_subtrees = list(
		/datum/ai_planning_subtree/find_food,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/crab,
	)

/datum/ai_planning_subtree/random_speech/crab
	speech_chance = 2
	emote_hear = list("clicks.")
	emote_see = list("clacks.")
