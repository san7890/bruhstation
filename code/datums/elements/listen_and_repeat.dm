/// The maximum number of phrases we can store in our speech buffer
#define MAX_SPEECH_BUFFER_SIZE 500
/// Tendency we have to ignore radio chatter
#define RADIO_IGNORE_CHANCE 10

/// Simple element that will deterministically set a value based on stuff that the source has heard and will then compel the source to repeat it.area
/// Requires a valid AI Blackboard.
/datum/element/listen_and_repeat
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	/// List of things that we start out having in our speech buffer
	var/list/desired_phrases = null
	/// The AI Blackboard Key we assign the value to.
	var/blackboard_key = null
	/// Probability we actually do anything upon hearing something
	var/probability_stat = null
	/// List of things that we've heard and will repeat.
	var/list/speech_buffer = null

/datum/element/listen_and_repeat/Attach(datum/target, list/desired_phrases, blackboard_key, probability_stat)
	. = ..()
	if(!ismovable(target))
		return ELEMENT_INCOMPATIBLE

	if(isnull(probability_stat))
		probability_stat = 50 // default for sanity

	if(!isnull(desired_phrases))
		LAZYADD(speech_buffer, desired_phrases)
	src.blackboard_key = blackboard_key

	RegisterSignal(target, COMSIG_MOVABLE_HEAR, PROC_REF(on_hear))
	RegisterSignal(target, COMSIG_NEEDS_NEW_PHRASE, PROC_REF(set_new_blackboard_key))
	// register to detach when a client logs in maybe

/// Called when we hear something.
/datum/element/listen_and_repeat/proc/on_hear(datum/source, list/passed_arguments)
	SIGNAL_HANDLER
	if(prob(probability_stat))
		return

	var/message = passed_arguments[HEARING_MESSAGE]
	var/speaker = passed_arguments[HEARING_SPEAKER]
	var/over_radio = !!passed_arguments[HEARING_RADIO_FREQ]
	if(speaker == source) // don't parrot ourselves
		return

	if(over_radio && prob(RADIO_IGNORE_CHANCE))
		return

	if(LAZYLEN(speech_buffer) >= MAX_SPEECH_BUFFER_SIZE) // only remove if we're full
		LAZYREMOVE(speech_buffer, pick(speech_buffer))

	LAZYOR(speech_buffer, html_decode(raw_message))

/// Called to set a new value for the blackboard key.
/datum/element/listen_and_repeat/proc/set_new_blackboard_key(datum/source)
	if(LAZYLEN(speech_buffer))
		controller.set_blackboard_key(blackboard_key, null)
		return

	var/atom/movable/atom_source = source
	var/datum/ai_controller/controller = atom_source.ai_controller
	var/selected_phrase = pick(speech_buffer)

	controller.set_blackboard_key(blackboard_key, selected_phrase)

