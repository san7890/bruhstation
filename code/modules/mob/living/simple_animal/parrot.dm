/* Parrots!
 * Contains
 * Defines
 * Inventory (headset stuff)
 * Attack responces
 * AI
 * Procs / Verbs (usable by players)
 * Sub-types
 * Hear & say (the things we do for gimmicks)
 */

/*
 * Defines
 */

//Only a maximum of one action and one intent should be active at any given time.
//Actions
#define PARROT_PERCH (1<<0) //Sitting/sleeping, not moving
#define PARROT_SWOOP (1<<1) //Moving towards or away from a target
#define PARROT_WANDER (1<<2) //Moving without a specific target in mind

//Intents
#define PARROT_STEAL (1<<3) //Flying towards a target to steal it/from it
#define PARROT_ATTACK (1<<4) //Flying towards a target to attack it
#define PARROT_RETURN (1<<5) //Flying towards its perch
#define PARROT_FLEE (1<<6) //Flying away from its attacker


/mob/living/simple_animal/parrot
	name = "parrot"
	desc = "The parrot squawks, \"They're a Parrot! BAWWK!\"" //'
	icon = 'icons/mob/simple/animal.dmi'
	icon_state = "parrot_fly"
	icon_living = "parrot_fly"
	icon_dead = "parrot_dead"
	var/icon_sit = "parrot_sit"
	density = FALSE
	health = 80
	maxHealth = 80
	pass_flags = PASSTABLE | PASSMOB

	speak = list("Hi!","Hello!","Cracker?","BAWWWWK george mellons griffing me!")
	speak_emote = list("squawks","says","yells")
	emote_hear = list("squawks.","bawks!")
	emote_see = list("flutters their wings.")

	speak_chance = 1 //1% (1 in 100) chance every tick; So about once per 150 seconds, assuming an average tick is 1.5s
	turns_per_move = 5
	butcher_results = list(/obj/item/food/cracker = 1)
	melee_damage_upper = 10
	melee_damage_lower = 5

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently moves aside"
	response_disarm_simple = "gently move aside"
	response_harm_continuous = "swats"
	response_harm_simple = "swat"
	stop_automated_movement = 1
	combat_mode = TRUE //parrots now start "aggressive" since only player parrots will nuzzle.
	attack_verb_continuous = "chomps"
	attack_verb_simple = "chomp"
	attack_vis_effect = ATTACK_EFFECT_BITE
	friendly_verb_continuous = "grooms"
	friendly_verb_simple = "groom"
	mob_size = MOB_SIZE_SMALL
	gold_core_spawnable = FRIENDLY_SPAWN

	var/parrot_damage_upper = 10
	var/parrot_state = PARROT_WANDER //Hunt for a perch when created
	var/parrot_sleep_max = 25 //The time the parrot sits while perched before looking around. Mosly a way to avoid the parrot's AI in life() being run every single tick.
	var/parrot_sleep_dur = 25 //Same as above, this is the var that physically counts down
	var/parrot_dam_zone = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_ARM, BODY_ZONE_R_LEG) //For humans, select a bodypart to attack

	var/parrot_speed = 5 //"Delay in world ticks between movement." according to byond. Yeah, that's BS but it does directly affect movement. Higher number = slower.
	var/parrot_lastmove = null //Updates/Stores position of the parrot while it's moving
	var/parrot_stuck = 0 //If parrot_lastmove hasn't changed, this will increment until it reaches parrot_stuck_threshold
	var/parrot_stuck_threshold = 10 //if this == parrot_stuck, it'll force the parrot back to wandering

	var/list/speech_buffer = list()
	var/speech_shuffle_rate = 20
	var/list/available_channels = list()

	//Headset for Poly to yell at engineers :)
	var/obj/item/radio/headset/ears = null

	//Wheter the Parrot should come with a headset
	var/spawn_headset = TRUE

	//The thing the parrot is currently interested in. This gets used for items the parrot wants to pick up, mobs it wants to steal from,
	//mobs it wants to attack or mobs that have attacked it
	var/atom/movable/parrot_interest = null

	//Parrots will generally sit on their perch unless something catches their eye.
	//These vars store their preffered perch and if they dont have one, what they can use as a perch
	var/obj/parrot_perch = null
	var/obj/desired_perches = list(/obj/structure/frame/computer,
		/obj/structure/displaycase,
		/obj/structure/filingcabinet,
		/obj/machinery/teleport,
		/obj/machinery/dna_scannernew,
		/obj/machinery/telecomms,
		/obj/machinery/nuclearbomb,
		/obj/machinery/recharge_station,
		/obj/machinery/smartfridge,
		/obj/machinery/computer,
		/obj/machinery/suit_storage_unit,
	)

	///Parrots are kleptomaniacs. This variable ... stores the item a parrot is holding.
	///The AI behavior is nice, but we need this to work without an AI (as well as us having a bunch of snowflakey interactions)
	var/obj/item/held_item = null


/mob/living/simple_animal/parrot/Initialize(mapload)
	. = ..()
	parrot_sleep_dur = parrot_sleep_max //In case someone decides to change the max without changing the duration var














/*
 * Attack responces
 */
//Humans, monkeys, aliens
/mob/living/simple_animal/parrot/attack_hand(mob/living/carbon/user, list/modifiers)
	..()
	if(client)
		return
	if(!stat && user.combat_mode)

		icon_state = icon_living //It is going to be flying regardless of whether it flees or attacks

		if(parrot_state == PARROT_PERCH)
			parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

		set_parrot_interest(user)
		parrot_state = PARROT_SWOOP //The parrot just got hit, it WILL move, now to pick a direction..

		if(health > 30) //Let's get in there and squawk it up!
			parrot_state |= PARROT_ATTACK
		else
			parrot_state |= PARROT_FLEE //Otherwise, fly like a bat out of hell!
//			drop_held_item(0)
	if(stat != DEAD && !user.combat_mode)
		handle_automated_speech(1) //assured speak/emote
	return

/mob/living/simple_animal/parrot/attack_paw(mob/living/carbon/human/user, list/modifiers)
	return attack_hand(user, modifiers)

/mob/living/simple_animal/parrot/attack_alien(mob/living/carbon/alien/user, list/modifiers)
	return attack_hand(user, modifiers)

//Simple animals
/mob/living/simple_animal/parrot/attack_animal(mob/living/simple_animal/user, list/modifiers)
	. = ..() //goodbye immortal parrots

	if(client)
		return

	if(parrot_state == PARROT_PERCH)
		parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

	if(user.melee_damage_upper > 0 && !stat)
		set_parrot_interest(user)
		parrot_state = PARROT_SWOOP | PARROT_ATTACK //Attack other animals regardless
		icon_state = icon_living

//Mobs with objects
/mob/living/simple_animal/parrot/attackby(obj/item/O, mob/living/user, params)
	if(!stat && !client && !istype(O, /obj/item/stack/medical) && !istype(O, /obj/item/food/cracker))
		if(O.force)
			if(parrot_state == PARROT_PERCH)
				parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

			set_parrot_interest(user)
			parrot_state = PARROT_SWOOP
			if(health > 30) //Let's get in there and squawk it up!
				parrot_state |= PARROT_ATTACK
			else
				parrot_state |= PARROT_FLEE
			icon_state = icon_living
//			drop_held_item(0)

//Bullets
/mob/living/simple_animal/parrot/bullet_act(obj/projectile/Proj)
	. = ..()
	if(!stat && !client)
		if(parrot_state == PARROT_PERCH)
			parrot_sleep_dur = parrot_sleep_max //Reset it's sleep timer if it was perched

		set_parrot_interest(null)
		parrot_state = PARROT_WANDER | PARROT_FLEE //Been shot and survived! RUN LIKE HELL!
		//parrot_been_shot += 5
		icon_state = icon_living
//		drop_held_item(0)


/*
 * AI - Not really intelligent, but I'm calling it AI anyway.
 */
/mob/living/simple_animal/parrot/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()

	//Sprite update for when a parrot gets pulled
	if(pulledby && !stat && parrot_state != PARROT_WANDER)
		if(buckled)
			buckled.unbuckle_mob(src, TRUE)
			buckled = null
		icon_state = icon_living
		parrot_state = PARROT_WANDER
		pixel_x = initial(pixel_x)
		pixel_y = initial(pixel_y)
		return




/mob/living/simple_animal/parrot/handle_automated_movement()
	if(!isturf(src.loc) || !(mobility_flags & MOBILITY_MOVE) || buckled)
		return //If it can't move, dont let it move. (The buckled check probably isn't necessary thanks to canmove)

	if(client && stat == CONSCIOUS && parrot_state != icon_living)
		icon_state = icon_living

//-----SLEEPING
	if(parrot_state == PARROT_PERCH)
		if(parrot_perch && parrot_perch.loc != src.loc) //Make sure someone hasn't moved our perch on us
			if(parrot_perch in view(src))
				parrot_state = PARROT_SWOOP | PARROT_RETURN
				icon_state = icon_living
				return
			else
				parrot_state = PARROT_WANDER
				icon_state = icon_living
				return

		parrot_sleep_dur--
		if(parrot_sleep_dur) //Zzz
			return

		else
			//This way we only call the stuff below once every [sleep_max] ticks.
			parrot_sleep_dur = parrot_sleep_max


			//Search for item to steal
			set_parrot_interest(search_for_item())
			if(parrot_interest)
				manual_emote("looks in [parrot_interest]'s direction and takes flight.")
				parrot_state = PARROT_SWOOP | PARROT_STEAL
				icon_state = icon_living
			return

//-----WANDERING - This is basically a 'I dont know what to do yet' state
	else if(parrot_state == PARROT_WANDER)
		//Stop movement, we'll set it later
		SSmove_manager.stop_looping(src)
		set_parrot_interest(null)

		//Wander around aimlessly. This will help keep the loops from searches down
		//and possibly move the mob into a new are in view of something they can use
		if(prob(90))
			step(src, pick(GLOB.cardinals))
			return

		if(!held_item && !parrot_perch) //If we've got nothing to do.. look for something to do.
			var/atom/movable/AM = search_for_perch_and_item() //This handles checking through lists so we know it's either a perch or stealable item
			if(AM)
				if(isitem(AM) || isliving(AM)) //If stealable item
					set_parrot_interest(AM)
					manual_emote("turns and flies towards [parrot_interest].")
					parrot_state = PARROT_SWOOP | PARROT_STEAL
					return
				else //Else it's a perch
					parrot_perch = AM
					parrot_state = PARROT_SWOOP | PARROT_RETURN
					return
			return

		if(parrot_interest && (parrot_interest in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_STEAL
			return

		if(parrot_perch && (parrot_perch in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		else //Have an item but no perch? Find one!
			parrot_perch = search_for_perch()
			if(parrot_perch)
				parrot_state = PARROT_SWOOP | PARROT_RETURN
				return
//-----STEALING
	else if(parrot_state == (PARROT_SWOOP | PARROT_STEAL))
		SSmove_manager.stop_looping(src)
		if(!parrot_interest || held_item)
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		if(!(parrot_interest in view(src)))
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		if(Adjacent(parrot_interest))

			if(isliving(parrot_interest))
//				steal_from_mob()

			else //This should ensure that we only grab the item we want, and make sure it's not already collected on our perch
				if(!parrot_perch || parrot_interest.loc != parrot_perch.loc)
					held_item = parrot_interest
					parrot_interest.forceMove(src)
					visible_message(span_notice("[src] grabs [held_item]!"), span_notice("You grab [held_item]!"), span_hear("You hear the sounds of wings flapping furiously."))

			set_parrot_interest(null)
			parrot_state = PARROT_SWOOP | PARROT_RETURN
			return

		SSmove_manager.move_to(src, parrot_interest, 1, parrot_speed)
		if(isStuck())
			return

		return

//-----RETURNING TO PERCH
	else if(parrot_state == (PARROT_SWOOP | PARROT_RETURN))
		SSmove_manager.stop_looping(src)
		if(!parrot_perch || !isturf(parrot_perch.loc)) //Make sure the perch exists and somehow isn't inside of something else.
			parrot_perch = null
			parrot_state = PARROT_WANDER
			return

		if(Adjacent(parrot_perch))
			forceMove(parrot_perch.loc)
//			drop_held_item()
			parrot_state = PARROT_PERCH
			icon_state = icon_sit
			return

		SSmove_manager.move_to(src, parrot_perch, 1, parrot_speed)
		if(isStuck())
			return

		return

//-----FLEEING
	else if(parrot_state == (PARROT_SWOOP | PARROT_FLEE))
		SSmove_manager.stop_looping(src)
		if(!parrot_interest || !isliving(parrot_interest)) //Sanity
			parrot_state = PARROT_WANDER

		SSmove_manager.move_away(src, parrot_interest, 1, parrot_speed)
		if(isStuck())
			return

		return

//-----ATTACKING
	else if(parrot_state == (PARROT_SWOOP | PARROT_ATTACK))

		//If we're attacking a nothing, an object, a turf or a ghost for some stupid reason, switch to wander
		if(!parrot_interest || !isliving(parrot_interest))
			set_parrot_interest(null)
			parrot_state = PARROT_WANDER
			return

		var/mob/living/L = parrot_interest
		if(melee_damage_upper == 0)
			melee_damage_upper = parrot_damage_upper
			set_combat_mode(TRUE)

		//If the mob is close enough to interact with
		if(Adjacent(parrot_interest))

			//If the mob we've been chasing/attacking dies or falls into crit, check for loot!
			if(L.stat)
				set_parrot_interest(null)
				if(!held_item)
					held_item = steal_from_ground()
					if(!held_item)
						held_item = steal_from_mob() //Apparently it's possible for dead mobs to hang onto items in certain circumstances.
				if(parrot_perch in view(src)) //If we have a home nearby, go to it, otherwise find a new home
					parrot_state = PARROT_SWOOP | PARROT_RETURN
				else
					parrot_state = PARROT_WANDER
				parrot_interest = null
//				if(!held_item)
//					held_item = steal_from_ground()
//					if(!held_item)
//						held_item = //Apparently it's possible for dead mobs to hang onto items in certain circumstances.
//				if(parrot_perch in view(src)) //If we have a home nearby, go to it, otherwise find a new home
//					parrot_state = PARROT_SWOOP | PARROT_RETURN
//				else
//					parrot_state = PARROT_WANDER
				return

			attack_verb_continuous = pick("claws at", "chomps")
			attack_verb_simple = pick("claw at", "chomp")
			L.attack_animal(src)//Time for the hurt to begin!
		//Otherwise, fly towards the mob!
		else
			SSmove_manager.move_to(src, parrot_interest, 1, parrot_speed)
			if(isStuck())
				return

		return
//-----STATE MISHAP
	else //This should not happen. If it does lets reset everything and try again
		SSmove_manager.stop_looping(src)
		set_parrot_interest(null)
		parrot_perch = null
	//	drop_held_item()
		parrot_state = PARROT_WANDER
		return

/*
 * Procs
 */

/mob/living/simple_animal/parrot/proc/set_parrot_interest(atom/movable/shiny)
	if(parrot_interest)
		UnregisterSignal(parrot_interest, COMSIG_QDELETING)
	parrot_interest = shiny
	if(parrot_interest)
		RegisterSignal(parrot_interest, COMSIG_QDELETING, PROC_REF(shiny_deleted))

/mob/living/simple_animal/parrot/proc/shiny_deleted(datum/source)
	SIGNAL_HANDLER
	set_parrot_interest(null)

/mob/living/simple_animal/parrot/proc/isStuck()
	//Check to see if the parrot is stuck due to things like windows or doors or windowdoors
	if(parrot_lastmove)
		if(parrot_lastmove == src.loc)
			if(parrot_stuck_threshold >= ++parrot_stuck) //If it has been stuck for a while, go back to wander.
				parrot_state = PARROT_WANDER
				parrot_stuck = 0
				parrot_lastmove = null
				return TRUE
		else
			parrot_lastmove = null
	else
		parrot_lastmove = src.loc
	return FALSE

/mob/living/simple_animal/parrot/proc/search_for_item()
	var/item
	for(var/atom/movable/AM in view(src))
		//Skip items we already stole or are wearing or are too big
		if(parrot_perch && AM.loc == parrot_perch.loc || AM.loc == src)
			continue
		if(isitem(AM))
			var/obj/item/I = AM
			if(I.w_class < WEIGHT_CLASS_SMALL)
				item = I
		else if(iscarbon(AM))
			var/mob/living/carbon/C = AM
			for(var/obj/item/I in C.held_items)
				if(I.w_class <= WEIGHT_CLASS_SMALL)
					item = I
					break
		if(item)
			if(!length(get_path_to(src, item))) // WHY DO WE DISREGARD THE PATH AHHHHHH
				item = null
				continue
			return item

/mob/living/simple_animal/parrot/proc/search_for_perch()
	for(var/obj/O in view(src))
		for(var/path in desired_perches)
			if(istype(O, path))
				return O
	return null

//This proc was made to save on doing two 'in view' loops seperatly
/mob/living/simple_animal/parrot/proc/search_for_perch_and_item()
	for(var/atom/movable/AM in view(src))
		for(var/perch_path in desired_perches)
			if(istype(AM, perch_path))
				return AM

		//Skip items we already stole or are wearing or are too big
		if(parrot_perch && AM.loc == parrot_perch.loc || AM.loc == src)
			continue

		if(isitem(AM))
			var/obj/item/I = AM
			if(I.w_class <= WEIGHT_CLASS_SMALL)
				return I

		if(iscarbon(AM))
			var/mob/living/carbon/C = AM
			for(var/obj/item/I in C.held_items)
				if(I.w_class <= WEIGHT_CLASS_SMALL)
					return C
	return null










/mob/living/simple_animal/parrot/poly/ghost/handle_automated_speech()
	if(ismob(loc))
		return
	..()

/mob/living/simple_animal/parrot/poly/ghost/handle_automated_movement()
	if(isliving(parrot_interest))
		if(!ishuman(parrot_interest))
			set_parrot_interest(null)
		else if(parrot_state == (PARROT_SWOOP | PARROT_ATTACK) && Adjacent(parrot_interest))
			SSmove_manager.move_to(src, parrot_interest, 0, parrot_speed)
			Possess(parrot_interest)
	..()

/mob/living/simple_animal/parrot/poly/ghost/proc/Possess(mob/living/carbon/human/H)
	if(!ishuman(H))
		return
	var/datum/disease/parrot_possession/P = new
	P.parrot = src
	forceMove(H)
	H.ForceContractDisease(P, FALSE)
	set_parrot_interest(null)
	H.visible_message(span_danger("[src] dive bombs into [H]'s chest and vanishes!"), span_userdanger("[src] dive bombs into your chest, vanishing! This can't be good!"))

#undef PARROT_PERCH
#undef PARROT_SWOOP
#undef PARROT_WANDER
#undef PARROT_STEAL
#undef PARROT_ATTACK
#undef PARROT_RETURN
#undef PARROT_FLEE
