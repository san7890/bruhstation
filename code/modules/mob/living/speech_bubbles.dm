/// All the speech bubbles that a living mob could potentially use, they show up to hover over the mob as a type of "typing indicator" in-game.
/datum/speech_bubble
	/// The icon file where we can get the icon state from.
	var/icon_file = 'icons/mob/effects/talk.dmi'
	/// The icon state of the speech bubble, we get this from 'icons/mob/effects/talk.dmi'
	var/icon_state = "default"

/datum/speech_bubble/alien
	icon_state = "alien"

/datum/speech_bubble/alien/royal
	icon_state = "alien_royal"

/datum/speech_bubble/blob
	icon_state = "blob"

/datum/speech_bubble/guardian
	icon_state = "guardian"

/datum/speech_bubble/holo
	icon_state = "holo"

/datum/speech_bubble/lawyer
	icon_state = "lawyer"

/datum/speech_bubble/machine
	icon_state = "machine"

/datum/speech_bubble/robot
	icon_state = "robot"

/datum/speech_bubble/sign_language
	icon_state = "signlang"

/datum/speech_bubble/slime
	icon_state = "slime"

/datum/speech_bubble/syndibot
	icon_state = "syndibot"
