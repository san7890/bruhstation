/// A tablet app that lets anyone see all the valid emoji they can send via a PDA message (and even OOC!)
/datum/computer_file/program/emojipedia
	filename = "emojipedia"
	filedesc = "EmojiPedia"
	category = PROGRAM_CATEGORY_CREW // we want everyone to be able to access this application, since they can use it as a reference for posting in OOC (only mimes and curators can send emoji via PDAs right now)
	program_icon_state = "face-smile"
	extended_desc = "This program allows you to view all the emojis you can send via PDA messages."
	size = 3
	tgui_id = "NtosEmojipedia"
	program_icon = "icons"
	/// Store the list of potential emojis here.
	var/static/list/emoji_list = icon_states(icon(EMOJI_SET))

/datum/computer_file/program/emojipedia/ui_data(mob_user)
	var/list/data = get_header_data()
	sortTim(emoji_list, /proc/cmp_text_asc)
	for(var/emoji in emoji_list)
		data["emoji_list"] += list(list(
			"name" = emoji,
			"icon64" = icon2base64(icon(EMOJI_SET, emoji)),
		))

	return data

