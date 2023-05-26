/mob/living/basic/eyeball
	name = "eyeball"
	desc = "An odd looking creature, it won't stop staring..."
	icon = 'icons/mob/simple/carp.dmi'
	icon_state = "eyeball"
	icon_living = "eyeball"

	gender = NEUTER
	mob_biotypes = MOB_ORGANIC
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list(FACTION_CULT)
	basic_mob_flags = DEL_ON_DEATH

	maxHealth = 30
	health = 30
	obj_damage = 10
	melee_damage_lower = 8
	melee_damage_upper = 12

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	attack_verb_continuous = "blinks at"
	attack_verb_simple = "blink at"
	attack_sound = 'sound/weapons/pierce.ogg'

	habitable_atmos = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minimum_survivable_temperature = TCMB
	maximum_survivable_temperature = TCMB + 1500

	// Reddish ethereal glow. These lads live on the cult ship
	lighting_cutoff_red = 40
	lighting_cutoff_green = 20
	lighting_cutoff_blue = 30
	sight = SEE_SELF|SEE_MOBS|SEE_OBJS|SEE_TURFS

	ai_controller = /datum/ai_controller/basic_controller/eyeball

/mob/living/basic/eyeball/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/simple_flying)
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/datum/ai_controller/basic_controller/eyeball
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/eyeball,
	)
