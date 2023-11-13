/datum/ai_controller/basic_controller/parrot
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic/allow_items,
		BB_HOARD_LOCATION_RANGE = 9,
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk/parrot

	planning_subtrees = list(
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/perch_on_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/hoard_items,
		/datum/ai_planning_subtree/parrot_as_in_repeat, // always get a witty oneliner in when you can
	)

/datum/idle_behavior/idle_random_walk/parrot
	///chance of us moving while perched
	var/walk_chance_when_perched = 5

/datum/idle_behavior/idle_random_walk/parrot/perform_idle_behavior(seconds_per_tick, datum/ai_controller/controller)
	var/mob/living/living_pawn = controller.pawn
	walk_chance = HAS_TRAIT(living_pawn, PARROT_PERCHED) ? walk_chance_when_perched : initial(walk_chance)
	return ..()

///subtree to steal items
/datum/ai_planning_subtree/hoard_items/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/living_pawn = controller.pawn

	var/turf/myspace = controller.blackboard[BB_HOARD_LOCATION]

	if(isnull(myspace) || myspace.is_blocked_turf(source_atom = controller.pawn) || get_dist(myspace, controller.pawn) > controller.blackboard[BB_HOARD_LOCATION_RANGE])
		controller.queue_behavior(/datum/ai_behavior/find_and_set/hoard_location, BB_HOARD_LOCATION, /turf/open)
		return

	//we have an item, go drop!
	var/list/our_contents = living_pawn.contents - typecache_filter_list(living_pawn.contents, controller.blackboard[BB_IGNORE_ITEMS])
	if(length(our_contents))
		controller.queue_behavior(/datum/ai_behavior/travel_towards/and_drop, BB_HOARD_LOCATION)
		return SUBTREE_RETURN_FINISH_PLANNING

	if(controller.blackboard_key_exists(BB_HOARD_ITEM_TARGET))
		controller.queue_behavior(/datum/ai_behavior/basic_melee_attack/interact_once, BB_HOARD_ITEM_TARGET, BB_TARGETING_STRATEGY)
		return SUBTREE_RETURN_FINISH_PLANNING

	controller.queue_behavior(/datum/ai_behavior/find_and_set/hoard_item, BB_HOARD_ITEM_TARGET)


/datum/ai_behavior/find_and_set/hoard_location/search_tactic(datum/ai_controller/controller, locate_path, search_range)
	for(var/turf/open/candidate in oview(search_range, controller.pawn))
		if(isspaceturf(candidate) || isopenspaceturf(candidate))
			continue
		if(candidate.is_blocked_turf(source_atom = controller.pawn))
			continue
		return candidate

	return null

/datum/ai_behavior/find_and_set/hoard_item
	action_cooldown = 5 SECONDS
	behavior_flags = AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION

/datum/ai_behavior/find_and_set/hoard_item/search_tactic(datum/ai_controller/controller, locate_path, search_range)
	if(!controller.blackboard_key_exists(BB_HOARD_LOCATION))
		return null
	var/turf/nest_turf = controller.blackboard[BB_HOARD_LOCATION]
	var/mob/living/living_pawn = controller.pawn
	for(var/atom/potential_victim in oview(search_range, controller.pawn))
		if(is_type_in_typecache(potential_victim, controller.blackboard[BB_IGNORE_ITEMS]))
			continue
		if(potential_victim.loc == nest_turf)
			continue
		if(isitem(potential_victim))
			var/obj/item/item_steal = potential_victim
			if(item_steal.w_class <= WEIGHT_CLASS_SMALL)
				return potential_victim
		if(!ishuman(potential_victim))
			continue
		if(living_pawn.faction.Find(REF(potential_victim)))
			continue //dont steal from friends
		if(holding_valuable(controller, potential_victim))
			controller.set_blackboard_key(BB_ALWAYS_IGNORE_FACTION, TRUE)
			return potential_victim

	return null

/datum/ai_behavior/find_and_set/hoard_item/proc/holding_valuable(datum/ai_controller/controller, mob/living/human_target)
	for(var/obj/item/potential_item in human_target.held_items)
		if(is_type_in_typecache(potential_item, controller.blackboard[BB_IGNORE_ITEMS]))
			continue
		if(potential_item.w_class <= WEIGHT_CLASS_SMALL)
			return TRUE
	return FALSE

/datum/ai_behavior/travel_towards/and_drop

/datum/ai_behavior/travel_towards/and_drop/finish_action(datum/ai_controller/controller, succeeded, target_key)
	. = ..()
	var/mob/living/living_mob = controller.pawn
	var/obj/drop_item = locate(/obj/item) in (living_mob.contents - typecache_filter_list(living_mob.contents, controller.blackboard[BB_IGNORE_ITEMS]))
	drop_item?.forceMove(get_turf(living_mob))

/datum/ai_behavior/basic_melee_attack/interact_once/parrot

/datum/ai_behavior/basic_melee_attack/interact_once/parrot/finish_action(datum/ai_controller/controller, succeeded, target_key)
	. = ..()
	controller.set_blackboard_key(BB_ALWAYS_IGNORE_FACTION, FALSE)

///subtree to perch on targets
/datum/ai_planning_subtree/perch_on_target
	///perchance...
	var/perch_chance = 5
	///chance we unbuckle
	var/unperch_chance = 15


/datum/ai_planning_subtree/perch_on_target/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/living_pawn = controller.pawn
	var/atom/buckled_too = living_pawn.buckled

	//do we have a current target or is chance to unbuckle has passed? then unbuckle!
	if(buckled_too)
		if((SPT_PROB(unperch_chance, seconds_per_tick) || controller.blackboard_key_exists(BB_BASIC_MOB_CURRENT_TARGET)))
			controller.queue_behavior(/datum/ai_behavior/unbuckle_mob)
			return
		return SUBTREE_RETURN_FINISH_PLANNING

	//if we are perched, we can go find something else to perch too
	var/final_chance = HAS_TRAIT(living_pawn, PARROT_PERCHED) ? unperch_chance : perch_chance

	if(!SPT_PROB(final_chance, seconds_per_tick) || controller.blackboard_key_exists(BB_BASIC_MOB_CURRENT_TARGET))
		return

	if(controller.blackboard_key_exists(BB_PERCH_TARGET))
		controller.queue_behavior(/datum/ai_behavior/perch_on_target, BB_PERCH_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING

	//50 50 chance to look for an object, or a friend
	if(prob(50))
		controller.queue_behavior(/datum/ai_behavior/find_and_set/nearby_friends, BB_PERCH_TARGET)
		return

	controller.queue_behavior(/datum/ai_behavior/find_and_set/in_list, BB_PERCH_TARGET, controller.blackboard[BB_PARROT_PERCH_TYPES])


/datum/ai_behavior/perch_on_target
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT | AI_BEHAVIOR_REQUIRE_REACH | AI_BEHAVIOR_CAN_PLAN_DURING_EXECUTION

/datum/ai_behavior/perch_on_target/setup(datum/ai_controller/controller, target_key)
	. = ..()
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		return FALSE

	set_movement_target(controller, target)

/datum/ai_behavior/perch_on_target/perform(seconds_per_tick, datum/ai_controller/controller, target_key)
	. = ..()
	var/atom/target = controller.blackboard[target_key]
	if(QDELETED(target))
		finish_action(controller, FALSE, target_key)
		return

	var/mob/living/basic/parrot/living_pawn = controller.pawn

	if(!ishuman(target))
		living_pawn.start_perching(target)
		finish_action(controller, TRUE, target_key)
		return

	if(!check_human_conditions(target))
		finish_action(controller, FALSE, target_key)
		return

	living_pawn.start_perching(target)
	finish_action(controller, TRUE, target_key)

/datum/ai_behavior/perch_on_target/proc/check_human_conditions(mob/living/living_human)
	if(living_human.stat == DEAD || LAZYLEN(living_human.buckled_mobs) >= living_human.max_buckled_mobs)
		return FALSE

	return TRUE

/datum/ai_behavior/perch_on_target/finish_action(datum/ai_controller/controller, succeeded, target_key)
	. = ..()
	controller.clear_blackboard_key(target_key)

/datum/ai_behavior/unbuckle_mob

/datum/ai_behavior/unbuckle_mob/perform(seconds_per_tick, datum/ai_controller/controller)
	. = ..()

	var/mob/living/living_pawn = controller.pawn
	var/atom/movable/buckled_too = living_pawn.buckled

	if(isnull(buckled_too))
		finish_action(controller, FALSE)
		return

	buckled_too.unbuckle_mob(living_pawn)
	finish_action(controller, TRUE)


//ghost poly

/datum/ai_controller/basic_controller/parrot/ghost
	planning_subtrees = list(
		/datum/ai_planning_subtree/parrot_as_in_repeat,
		/datum/ai_planning_subtree/possess_humans,
		/datum/ai_planning_subtree/hoard_items,
	)

///subtree to possess humans
/datum/ai_planning_subtree/possess_humans
	///chance we go possess humans
	var/possess_chance = 2

/datum/ai_planning_subtree/possess_humans/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/living_pawn = controller.pawn

	if(controller.blackboard_key_exists(BB_PERCH_TARGET))
		controller.queue_behavior(/datum/ai_behavior/perch_on_target/haunt, BB_PERCH_TARGET)
		return SUBTREE_RETURN_FINISH_PLANNING


	if(!SPT_PROB(possess_chance, seconds_per_tick))
		if(ishuman(living_pawn.loc))
			return SUBTREE_RETURN_FINISH_PLANNING
		return

	if(ishuman(living_pawn.loc))
		controller.set_blackboard_key(living_pawn.loc)
		return

	controller.queue_behavior(/datum/ai_behavior/find_and_set/conscious_person, BB_PERCH_TARGET)


/datum/ai_behavior/perch_on_target/haunt

/datum/ai_behavior/perch_on_target/haunt/check_human_conditions(mob/living/living_human)
	if(living_human.stat == DEAD)
		return FALSE
	return TRUE
