/// Controls the AI for crabs.
/// Basically, we only move east-west when idle. However, when we become a crab with a plan, all bets are off and we immediately start moving towards our target.
/datum/ai_controller/basic_controller/crab
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic,
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk/crab
	planning_subtrees = list(
		/datum/ai_planning_subtree/find_nearest_thing_which_attacked_me_to_flee,
		/datum/ai_planning_subtree/flee_target,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/crab,
	)

/datum/ai_planning_subtree/random_speech/crab
	speech_chance = 2
	emote_hear = list("clicks.")
	emote_see = list("clacks.")

/// The evil crab is so evil that it moves in all directions like a normal mob! How nefarious!
/datum/ai_controller/basic_controller/crab/evil
	idle_behavior = /datum/idle_behavior/idle_random_walk
