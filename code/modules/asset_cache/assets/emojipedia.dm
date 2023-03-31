/datum/asset/spritesheet/emojipedia
	name = "glup shitto"
	cross_round_cachable = TRUE // The Emoji DMI is static and doesn't change without a commit mis-match.

/datum/asset/spritesheet/emojipedia/create_spritesheets()
	InsertAll("", EMOJI_SET)

