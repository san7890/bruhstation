GLOBAL_LIST_INIT(strippable_parrot_items, create_strippable_list(list(
	/datum/strippable_item/parrot_headset,
)))


/// Parrots! Klepto bastards that imitate your speech and hoard your shit.
/mob/living/basic/parrot
	name = "parrot"
	desc = "The parrot squawks, \"They're a Parrot! BAWWK!\""
	icon = 'icons/mob/simple/animal.dmi'
	icon_state = "parrot_fly"
	icon_living = "parrot_fly"
	icon_dead = "parrot_dead"
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

	/// Icon we use while sitting
	var/icon_sit = "parrot_sit"
	/// The number of damage we do when we decide to aggro for our lives
	var/parrot_damage_upper = 10
	//var/parrot_state = PARROT_WANDER
	//var/parrot_sleep_max = 25 //The time the parrot sits while perched before looking around. Mosly a way to avoid the parrot's AI in life() being run every single tick.
	//var/parrot_sleep_dur = 25 //Same as above, this is the var that physically counts down
	/// Pottential bodyparts for us to attack
	var/parrot_dam_zone = CARBON_GENERIC_BODY_ZONES

	//Headset for Poly to yell at engineers :)
	var/obj/item/radio/headset/ears = null

	//Parrots are kleptomaniacs. This variable ... stores the item a parrot is holding.
	var/obj/item/held_item = null

	//var/parrot_speed = 5 //"Delay in world ticks between movement." according to byond. Yeah, that's BS but it does directly affect movement. Higher number = slower.
	//var/parrot_lastmove = null //Updates/Stores position of the parrot while it's moving
	//var/parrot_stuck = 0 //If parrot_lastmove hasn't changed, this will increment until it reaches parrot_stuck_threshold
	//var/parrot_stuck_threshold = 10 //if this == parrot_stuck, it'll force the parrot back to wandering

	/// The blackboard key we use to store the string we're repeating
	var/speech_blackboard_key = BB_PARROT_REPEAT_STRING
	/// The generic probability odds we have to do a speech-related action
	var/speech_probability_rate = 25

	////The thing the parrot is currently interested in. This gets used for items the parrot wants to pick up, mobs it wants to steal from,
	////mobs it wants to attack or mobs that have attacked it
	//var/atom/movable/parrot_interest = null

	//Parrots will generally sit on their perch unless something catches their eye.
	//These vars store their preffered perch and if they dont have one, what they can use as a perch
	//var/obj/parrot_perch = null
	var/obj/desired_perches = list(
		/obj/machinery/computer,
		/obj/machinery/dna_scannernew,
		/obj/machinery/nuclearbomb,
		/obj/machinery/recharge_station,
		/obj/machinery/smartfridge,
		/obj/machinery/suit_storage_unit,
		/obj/machinery/telecomms,
		/obj/machinery/teleport,
		/obj/structure/displaycase,
		/obj/structure/filingcabinet,
		/obj/structure/frame/computer,
	)


/mob/living/basic/parrot/Initialize(mapload)
	. = ..()
	setup_headset()

	AddElement(/datum/component/listen_and_repeat, get_static_list_of_phrases(), speech_blackboard_key, speech_probability_rate)
	AddElement(/datum/element/strippable, GLOB.strippable_parrot_items)
	AddElement(/datum/element/simple_flying)

/mob/living/basic/parrot/Destroy()
	// should have cleaned these up on death, but let's be super safe in case that didn't happen
	if(!QDELETED(ears))
		QDEL_NULL(ears)
	if(!QDELETED(held_item))
		QDEL_NULL(held_item)
	return ..()

/mob/living/simple_animal/parrot/death(gibbed)
	if(held_item)
		held_item.forceMove(drop_location())
		held_item = null

	if(ears)
		ears.forceMove(drop_location())
		ears = null

	//SSmove_manager.stop_looping(src)

	if(!isnull(buckled))
		buckled.unbuckle_mob(src, force = TRUE)
	buckled = null
	pixel_x = base_pixel_x
	pixel_y = base_pixel_y

	return ..()

/mob/living/basic/parrot/examine(mob/user)
	. = ..()
	if(stat != DEAD)
		return

	if(HAS_MIND_TRAIT(user, TRAIT_NAIVE))
		. += pick(
			"It seems tired and shagged out after a long squawk.",
			"It seems to be pining for the fjords.",
			"It's resting. It's a beautiful bird. Lovely plumage.",
		)
	else
		. += pick(
			"This is a late parrot.",
			"This is an ex-parrot.",
			"This parrot is no more.",
		)

/mob/living/basic/parrot/get_status_tab_items()
	. = ..()
	. += "Held Item: [held_item]"

/mob/living/basic/parrot/Process_Spacemove(movement_dir = 0, continuous_move = FALSE)
	if(stat != DEAD) // parrots have evolved to let them fly in space because fucking uhhhhhhhhhh
		return TRUE
	return ..()

/mob/living/basic/parrot/radio(message, list/message_mods = list(), list/spans, language) //literally copied from human/radio(), but there's no other way to do this. at least it's better than it used to be.
	. = ..()
	if(.)
		return

	if(message_mods[MODE_HEADSET])
		if(ears)
			ears.talk_into(src, message, , spans, language, message_mods)
		return ITALICS | REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] == MODE_DEPARTMENT)
		if(ears)
			ears.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
		return ITALICS | REDUCE_RANGE
	else if(message_mods[RADIO_EXTENSION] in GLOB.radiochannels)
		if(ears)
			ears.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
			return ITALICS | REDUCE_RANGE

	return NONE

/// Will simply set up the headset for the parrot to use. Stub, implemented on subtypes.
/mob/living/basic/parrot/proc/setup_headset()
	return

/// Gets a static list of phrases we wish to pass to the element.
/mob/living/basic/parrot/proc/get_static_list_of_phrases()
	var/static/list/default_phrases = list(
		"BAWWWWK george mellons griffing me!",
		"Cracker?",
		"Hello!",
		"Hi!",
	)

	return default_phrases


/// Gets the available channels that this parrot has access to. Returns a list of the channels we can use.
/mob/living/basic/parrot/proc/get_available_channels()
	var/list/returnable_list = list()
	if(isnull(ears))
		return returnable_list

	for(var/channel in ears.channels)
		GLOB.channel_tokens[channels[channel]] // will return something like ":e" or ":c" y'know

	return returnable_list
