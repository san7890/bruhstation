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

	//speak = list("Hi!","Hello!","Cracker?","BAWWWWK george mellons griffing me!")
	//speak_emote = list("squawks","says","yells")
	//emote_hear = list("squawks.","bawks!")
	//emote_see = list("flutters their wings.")

	butcher_results = list(/obj/item/food/cracker = 1)
	melee_damage_upper = 10
	melee_damage_lower = 5

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently moves aside"
	response_disarm_simple = "gently move aside"
	response_harm_continuous = "swats"
	response_harm_simple = "swat"
	combat_mode = TRUE //parrots now start "aggressive" since only player parrots will nuzzle.
	attack_verb_continuous = "chomps"
	attack_verb_simple = "chomp"
	attack_vis_effect = ATTACK_EFFECT_BITE
	friendly_verb_continuous = "grooms"
	friendly_verb_simple = "groom"
	mob_size = MOB_SIZE_SMALL
	gold_core_spawnable = FRIENDLY_SPAWN

	ai_controller = /datum/ai_controller/basic_controller/parrot

	/// Icon we use while sitting
	var/icon_sit = "parrot_sit"
	/// The number of damage we do when we decide to aggro for our lives
	var/parrot_damage_upper = 10
	//var/parrot_state = PARROT_WANDER
	//var/parrot_sleep_max = 25 //The time the parrot sits while perched before looking around. Mosly a way to avoid the parrot's AI in life() being run every single tick.
	//var/parrot_sleep_dur = 25 //Same as above, this is the var that physically counts down
	/// Potential bodyparts for us to attack
	var/parrot_dam_zone = CARBON_GENERIC_BODY_ZONES

	///Headset for Poly to yell at engineers :)
	var/obj/item/radio/headset/ears = null

	///Parrots are kleptomaniacs. This variable ... stores the item a parrot is holding.
	var/obj/item/held_item = null

	//var/parrot_speed = 5 //"Delay in world ticks between movement." according to byond. Yeah, that's BS but it does directly affect movement. Higher number = slower.
	//var/parrot_lastmove = null //Updates/Stores position of the parrot while it's moving
	//var/parrot_stuck = 0 //If parrot_lastmove hasn't changed, this will increment until it reaches parrot_stuck_threshold
	//var/parrot_stuck_threshold = 10 //if this == parrot_stuck, it'll force the parrot back to wandering

	/// The blackboard key we use to store the string we're repeating
	var/speech_blackboard_key = BB_PARROT_REPEAT_STRING
	/// The generic probability odds we have to do a speech-related action // FIXME might need to tone this down
	var/speech_probability_rate = 25
	/// The generic probability odds we have to switch out our speech string
	var/speech_shuffle_rate = 20

	////The thing the parrot is currently interested in. This gets used for items the parrot wants to pick up, mobs it wants to steal from,
	////mobs it wants to attack or mobs that have attacked it
	//var/atom/movable/parrot_interest = null

	//Parrots will generally sit on their perch unless something catches their eye.
	var/static/list/desired_perches = list(
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
	update_speech_blackboards()
	ai_controller.set_blackboard_key(BB_PARROT_PERCH_TYPES, desired_perches)

	AddComponent(/datum/component/listen_and_repeat, get_static_list_of_phrases(), speech_blackboard_key, speech_probability_rate, speech_shuffle_rate)
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/strippable, GLOB.strippable_parrot_items)
	AddElement(/datum/element/simple_flying)

	RegisterSignal(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(pre_attacking))
	RegisterSignal(src, COMSIG_MOB_CLICKON, PROC_REF(on_click))
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	RegisterSignal(src, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attacked)) // this means we could have a peaceful interaction, like getting a cracker
	RegisterSignal(src, COMSIG_ATOM_WAS_ATTACKED, PROC_REF(on_injured)) // this means we got hurt and it's go time

/mob/living/basic/parrot/Destroy()
	// should have cleaned these up on death, but let's be super safe in case that didn't happen
	if(!QDELETED(ears))
		QDEL_NULL(ears)
	if(!QDELETED(held_item))
		QDEL_NULL(held_item)
	return ..()

/mob/living/basic/parrot/death(gibbed)
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
	if(. != NONE)
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

#define PARROT_PERCHED "parrot_perched" // move this later

/mob/living/basic/parrot/update_icon(updates)
	. = ..()
	if(HAS_TRAIT(src, PARROT_PERCHED))
		icon_state = icon_sit
	else
		icon_state = icon_living
		pixel_x = initial(pixel_x)
		pixel_y = initial(pixel_y)

/// Proc that we just use to see if we're rightclicking something for perch behavior or dropping the item we currently ahve
/mob/living/basic/parrot/proc/on_click(mob/living/basic/source, atom/target, params)
	SIGNAL_HANDLER
	if(!LAZYACCESS(params, RIGHT_CLICK))
		return

	if(start_perching(target))
		return COMSIG_MOB_CANCEL_CLICKON

	if(!isnull(held_item))
		drop_held_item(gently = TRUE)

/// Proc that ascertains the type of perch we're dealing with and starts the perching process.
/// Returns TRUE if we started perching, FALSE otherwise.
/mob/living/basic/parrot/proc/start_perching(atom/target)
	if(HAS_TRAIT(src, PARROT_PERCHED))
		balloon_alert(src, "already perched!")
		return FALSE

	if(ishuman(target))
		if(perch_on_human(target))
			return TRUE
		return FALSE

	if(!isobj(target))
		return FALSE

	forceMove(get_turf(target))
	ADD_TRAIT(src, PARROT_PERCHED, TRAIT_GENERIC)
	drop_held_item(gently = TRUE) // comfy :)
	update_appearance()
	return TRUE

/// Proc that will perch us on a human. Returns TRUE if we perched, FALSE otherwise.
/mob/living/basic/parrot/proc/perch_on_human(mob/living/carbon/human/target)
	if(target.has_buckled_mobs() && (length(target.buckled_mobs) >= target.max_buckled_mobs))
		balloon_alert(src, "can't perch on them!")
		return FALSE

	forceMove(get_turf(target))
	if(!target.buckle_mob(src, TRUE))
		return FALSE

	pixel_y = 9
	pixel_x = pick(-8,8) //pick left or right shoulder
	to_chat(src, span_notice("You sit on [target]'s shoulder."))
	ADD_TRAIT(src, PARROT_PERCHED, TRAIT_GENERIC)
	update_appearance()
	return TRUE

/// If we move, remove the perching trait and reset our icon state.
/mob/living/basic/parrot/proc/on_move(mob/living/basic/source)
	if(!HAS_TRAIT(src, PARROT_PERCHED))
		return

	REMOVE_TRAIT(src, PARROT_PERCHED, TRAIT_GENERIC)
	update_appearance()

/// Master proc which will determine the intent of OUR attacks on an object and summon the relevant procs accordingly.
/// This is pretty much meant for players, AI will use the task-specific procs instead.
/mob/living/basic/parrot/proc/pre_attacking(mob/living/basic/source, atom/target)
	SIGNAL_HANDLER
	if(isnull(client) || stat != CONSCIOUS)
		return

	if(isitem(target))
		if(steal_from_ground(target))
			return COMPONENT_HOSTILE_NO_ATTACK
		return

	if(iscarbon(target))
		if(steal_from_mob(target))
			return COMPONENT_HOSTILE_NO_ATTACK
		return

/// Picks up an item from the ground and puts it in our claws. Returns TRUE if we picked it up, FALSE otherwise.
/mob/living/basic/parrot/proc/steal_from_ground(obj/item/target)
	if(!isnull(held_item))
		balloon_alert(src, "already holding something!")
		return FALSE

	if(target.w_class > WEIGHT_CLASS_SMALL)
		balloon_alert(src, "too big to pick up!")
		return FALSE

	var/turf/open/perch = ai_controller.blackboard[BB_PARROT_INANIMATE_PERCH]
	if(isnull(client) && target.loc == perch) // we'll leave that on our perch if we're ai controlled
		return FALSE

	target.forceMove(src)
	held_item = target
	visible_message(
		span_notice("[src] grabs [held_item]!"),
		span_notice("You grab [held_item]!"),
		span_hear("You hear the sounds of wings flapping furiously."),
	)
	return TRUE

/// Looks for an item that we can snatch and puts it in our claws. Returns TRUE if we picked it up, FALSE otherwise.
/mob/living/basic/parrot/proc/steal_from_mob(mob/living/carbon/victim)
	if(!isnull(held_item))
		balloon_alert(src, "already holding something!")
		return FALSE

	for(var/obj/item/stealable in victim.held_items)
		if(stealable.w_class > WEIGHT_CLASS_SMALL)
			continue

		if(!victim.temporarilyRemoveItemFromInventory(stealable))
			continue

		visible_message(
			span_notice("[src] grabs [held_item] out of [victim]'s hand!"),
			span_notice("You snag [held_item] out of [victim]'s hand!"),
			span_hear("You hear the sounds of wings flapping furiously."),
		)
		pick_up_item(stealable)
		return TRUE

	return FALSE

/// Handles special behavior whenever we're attacked with a special item.
/mob/living/basic/parrot/proc/on_attacked(mob/living/basic/source, obj/item/thing, mob/living/attacker, params)
	SIGNAL_HANDLER
	if(!istype(thing, /obj/item/food/cracker)) // Poly wants a cracker
		return

	qdel(thing)
	if(health < maxHealth)
		adjustBruteLoss(-10)
	speech_probability_rate *= 1.27
	speech_shuffle_rate += 10
	update_speech_blackboards()
	to_chat(src, span_notice("[src] eagerly devours the cracker."))
	return COMPONENT_NO_AFTERATTACK

/// Handles special behavior whenever we are injured.
/mob/living/basic/parrot/proc/on_injured(mob/living/basic/source, mob/living/attacker, attack_flags)
	SIGNAL_HANDLER
	if(!isnull(client) || stat == CONSCIOUS)
		return

	drop_held_item(gently = FALSE)
	var/return_value = SEND_SIGNAL(source, COMSIG_NEEDS_NEW_PHRASE)
	if(return_value & NO_NEW_PHRASE_AVAILABLE)
		return

	INVOKE_ASYNC(src, PROC_REF(say), message = ai_controller.blackboard[BB_PARROT_REPEAT_STRING], forced = "parrot oneliner on attack")

/// Handles picking up the item we're holding, done in its own proc because of a snowflake edge case we need to account for. No additional logic beyond that.
/// Returns TRUE if we picked it up, FALSE otherwise.
/mob/living/basic/parrot/proc/pick_up_item(obj/item/target)
	target.forceMove(src)
	held_item = target

	if(!istype(held_item, /obj/item/food/cracker))
		return TRUE

	QDEL_NULL(held_item)
	if(health < maxHealth)
		adjustBruteLoss(-10)
	manual_emote("[src] eagerly downs the cracker.")
	return TRUE // yeah technically

/// Handles dropping items we're holding. Gently is a special modifier we can use for special interactions.
/mob/living/basic/parrot/proc/drop_held_item(gently = TRUE)
	if(isnull(held_item))
		balloon_alert(src, "nothing to drop!")
		return

	if(stat != CONSCIOUS) // don't gotta do shit
		held_item.forceMove(drop_location())
		held_item = null
		return

	if(!gently && isgrenade(held_item))
		var/obj/item/grenade/bomb = held_item
		balloon_alert(src, "bombs away!") // you'll likely die too so we can get away with the `!` here
		bomb.forceMove(drop_location())
		held_item = null
		bomb.detonate()
		return

	balloon_alert(src, "dropped item")
	held_item.forceMove(drop_location())
	held_item = null

/mob/living/basic/parrot/vv_edit_var(var_name, vval)
	. = ..() // give admins an easier time when it comes to fucking with poly
	switch (var_name)
		if (NAMEOF(src, speech_probability_rate))
			update_speech_blackboards()
		if (NAMEOF(src, speech_shuffle_rate))
			update_speech_blackboards()

/// Updates our speech blackboards mob-side to reflect the current speech on the controller to ensure everything is synchronized.
/mob/living/basic/parrot/proc/update_speech_blackboards()
	ai_controller.set_blackboard_key(BB_PARROT_REPEAT_PROBABILITY, speech_probability_rate)
	ai_controller.set_blackboard_key(BB_PARROT_PHRASE_CHANGE_PROBABILITY, speech_shuffle_rate)

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

	var/list/headset_channels = ears.channels
	for(var/channel in headset_channels)
		returnable_list += GLOB.channel_tokens[channel] // will return something like ":e" or ":c" y'know

	return returnable_list
