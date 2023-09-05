/datum/strippable_item/parrot_headset
	key = STRIPPABLE_ITEM_PARROT_HEADSET

/datum/strippable_item/parrot_headset/get_item(atom/source)
	var/mob/living/simple_animal/parrot/parrot_source = source
	return istype(parrot_source) ? parrot_source.ears : null

/datum/strippable_item/parrot_headset/try_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if (!.)
		return FALSE

	if (!istype(equipping, /obj/item/radio/headset))
		to_chat(user, span_warning("[equipping] won't fit!"))
		return FALSE

	return TRUE

// There is no delay for putting a headset on a parrot.
/datum/strippable_item/parrot_headset/start_equip(atom/source, obj/item/equipping, mob/user)
	return TRUE

/datum/strippable_item/parrot_headset/finish_equip(atom/source, obj/item/equipping, mob/user)
	var/obj/item/radio/headset/radio = equipping
	if (!istype(radio))
		return

	var/mob/living/simple_animal/parrot/parrot_source = source
	if (!istype(parrot_source))
		return

	if (!user.transferItemToLoc(radio, source))
		return

	parrot_source.ears = radio

	to_chat(user, span_notice("You fit [radio] onto [source]."))

	parrot_source.available_channels.Cut()

	for (var/channel in radio.channels)
		var/channel_to_add

		switch (channel)
			if (RADIO_CHANNEL_ENGINEERING)
				channel_to_add = RADIO_TOKEN_ENGINEERING
			if (RADIO_CHANNEL_COMMAND)
				channel_to_add = RADIO_TOKEN_COMMAND
			if (RADIO_CHANNEL_SECURITY)
				channel_to_add = RADIO_TOKEN_SECURITY
			if (RADIO_CHANNEL_SCIENCE)
				channel_to_add = RADIO_TOKEN_SCIENCE
			if (RADIO_CHANNEL_MEDICAL)
				channel_to_add = RADIO_TOKEN_MEDICAL
			if (RADIO_CHANNEL_SUPPLY)
				channel_to_add = RADIO_TOKEN_SUPPLY
			if (RADIO_CHANNEL_SERVICE)
				channel_to_add = RADIO_TOKEN_SERVICE

		if (channel_to_add)
			parrot_source.available_channels += channel_to_add

	if (radio.translate_binary)
		parrot_source.available_channels.Add(MODE_TOKEN_BINARY)

/datum/strippable_item/parrot_headset/start_unequip(atom/source, mob/user)
	. = ..()
	if (!.)
		return FALSE

	var/mob/living/simple_animal/parrot/parrot_source = source
	if (!istype(parrot_source))
		return

	if (!parrot_source.stat)
		parrot_source.say("[parrot_source.available_channels.len ? "[pick(parrot_source.available_channels)] " : null]BAWWWWWK LEAVE THE HEADSET BAWKKKKK!")

	return TRUE

/datum/strippable_item/parrot_headset/finish_unequip(atom/source, mob/user)
	var/mob/living/simple_animal/parrot/parrot_source = source
	if (!istype(parrot_source))
		return

	parrot_source.ears.forceMove(parrot_source.drop_location())
	parrot_source.ears = null
