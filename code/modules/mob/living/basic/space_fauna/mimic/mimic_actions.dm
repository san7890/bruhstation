/datum/action/innate/mimic
	background_icon_state = "bg_default"
	overlay_icon_state = "bg_default_border"

/datum/action/innate/mimic/lock
	name = "Lock/Unlock"
	desc = "Toggle preventing yourself from being opened or closed."

/datum/action/innate/mimic/lock/Activate()
	var/mob/living/basic/mimic/xenobio/parent = owner
	parent.locked = !parent.locked
	if(!parent.locked)
		to_chat(parent, span_warning("You loosen up, allowing yourself to be opened and closed."))
	else
		to_chat(parent, span_warning("You stiffen up, preventing anyone from opening or closing you."))
