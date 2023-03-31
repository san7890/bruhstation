/// "Fully immerses" the player, making them manually breathe and blink
/datum/smite/immerse
	name = "glup shitto"

/datum/smite/immerse/effect(client/user, mob/living/target)
	. = ..()
	immerse_player(target)
	SEND_SOUND(target, sound('sound/voice/roleplay.ogg'))
	to_chat(target, span_boldnotice("Please roleplay appropriately, okay?"))
