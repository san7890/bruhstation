/// Controls the AI for crabs.
/// Basically, we only move east-west when idle. However, when we become a crab with a plan, all bets are off and we immediately start moving towards our target.
/datum/ai_controller/basic_controller/crab
	blackboard = list(
		BB_TARGETTING_DATUM = new
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance/crab
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

/// Basically here, we just want to hook into the moveloop checks in order to rotate ourselves around.
/// If you ever wanna make it more complex than this, move it to it's own file in the `ai_movement` folder.
/datum/ai_movement/basic_avoidance/crab
