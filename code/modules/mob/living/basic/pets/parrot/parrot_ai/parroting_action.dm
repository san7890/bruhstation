/// When a parrot... parrots...
/datum/ai_planning_subtree/parrot_as_in_repeat
	operational_datums = list(/datum/component/listen_and_repeat)

/datum/ai_planning_subtree/parrot_as_in_repeat/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	var/atom/speaking_pawn = controller.pawn
	var/potential_string = controller.blackboard[BB_PARROT_REPEAT_STRING]
	var/probability = controller.blackboard[BB_PARROT_REPEAT_PROBABILITY]
	var/return_value = SEND_SIGNAL(speaking_pawn, COMSIG_NEEDS_NEW_PHRASE) // we always grab a new phrase every time this fires for randomness
	if(prob(probability) || return_value & NO_NEW_PHRASE_AVAILABLE)
		return

	potential_string = controller.blackboard[BB_PARROT_REPEAT_STRING]
	if(isnull(potential_string))
		stack_trace("Parrot As In Repeat Subtree somehow is getting a null potential string while not getting `NO_NEW_PHRASE_AVAILABLE`!")
		return

	controller.queue_behavior(/datum/ai_behavior/perform_speech/parrot, potential_string)

/datum/ai_behavior/perform_speech/parrot
	action_cooldown = 2 SECONDS

/datum/ai_behavior/perform_speech/parrot/perform(seconds_per_tick, datum/ai_controller/controller, speech, speech_sound)
	var/mob/living/basic/parrot/speaking_pawn = controller.pawn
	var/list/available_channels = speaking_pawn.get_available_channels()
	var/modified_speech = speech
	var/use_radio = prob(50) // we might not even use the radio if we even have a channel

#define HAS_CHANNEL_PREFIX (speech[1] in GLOB.department_radio_prefixes) && (copytext_char(speech, 2, 3) in GLOB.department_radio_keys) // determine if we need to crop the channel prefix

	if(!length(available_channels)) // might not even use the radio at all
		if(HAS_CHANNEL_PREFIX)
			modified_speech = copytext_char(speech, 3)

	else
		if(HAS_CHANNEL_PREFIX)
			modified_speech = "[use_radio ? pick(available_channels) : ""][copytext_char(speech, 3)]"
		else
			modified_speech = "[use_radio ? pick(available_channels) : ""][speech]"


	speaking_pawn.say(modified_speech, forced = "AI Controller")
	if(speech_sound)
		playsound(speaking_pawn, speech_sound, 80, vary = TRUE)
	finish_action(controller, TRUE)

#undef HAS_CHANNEL_PREFIX
