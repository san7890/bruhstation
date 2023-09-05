/// Default poly, presumably died the last shift and has no special traits.
#define POLY_DEFAULT "default"
/// Poly has survived a number of rounds equivalent to the longest survival of his being.
#define POLY_LONGEST_SURVIVAL "longest_survival"
/// Poly has survived a number of rounds equivalent to the longest deathstreak of his being.
#define POLY_BEATING_DEATHSTREAK "longest_deathstreak"
/// Poly has only just survived a round, and is doing a consecutive one.
#define POLY_CONSECUTIVE_ROUND "consecutive_round"

/// The classically famous compadre to the Chief Engineer, Poly.
/mob/living/basic/parrot/poly
	name = "Poly"
	desc = "Poly the Parrot. An expert on quantum cracker theory."
	//speak = list("Poly wanna cracker!", ":e Check the crystal, you chucklefucks!",":e Wire the solars, you lazy bums!",":e WHO TOOK THE DAMN MODSUITS?",":e OH GOD ITS ABOUT TO DELAMINATE CALL THE SHUTTLE")
	gold_core_spawnable = NO_SPAWN
	//speak_chance = 3

	/// Did we write the memory to disk?
	var/memory_saved = FALSE
	/// How long has this bird been alive for?
	var/rounds_survived = 0
	/// How long have we survived for at max?
	var/longest_survival = 0
	/// How many rounds in a row have we been dead for?
	var/longest_deathstreak = 0

/mob/living/basic/parrot/poly/Initialize(mapload)
	. = ..()
	if(SStts.tts_enabled)
		voice = pick(SStts.available_speakers)
		if(SStts.pitch_enabled)
			if(findtext(voice, "Woman"))
				pitch = 12 // up-pitch by one octave
			else
				pitch = 24 // up-pitch by 2 octaves
		else
			voice_filter = "rubberband=pitch=1.5" // Use the filter to pitch up if we can't naturally pitch up.

	REGISTER_REQUIRED_MAP_ITEM(1, 1) // every map needs a poly!
	update_appearance()

/mob/living/basic/parrot/poly/death(gibbed)
	if(HAS_TRAIT(src, TRAIT_DONT_WRITE_MEMORY))
		return ..() // Don't read memory either.
	if(!memory_saved)
		Write_Memory(TRUE)
	var/special_status = determine_special_poly()
	if(special_status == POLY_LONGEST_SURVIVAL || special_status == POLY_BEATING_DEATHSTREAK || prob(0.666))
		var/mob/living/simple_animal/parrot/poly/ghost/G = new(loc) // san7890 make this the transfer mob proc
		if(mind)
			mind.transfer_to(G)
		else
			G.key = key
	return ..()

/mob/living/basic/parrot/poly/get_static_list_of_phrases() // there's only one poly, so there should only be one ongoing list of phrases. i guess
	var/static/list/phrases_to_return = list()
	if(length(phrases_to_return))
		return phrases_to_return

	phrases_to_return += read_memory() // must come first!!!
	switch(determine_special_poly())
		if(POLY_DEFAULT)
			phrases_to_return += pick("...alive?", "This isn't parrot heaven!", "I live, I die, I live again!", "The void fades!")
		if(POLY_LONGEST_SURVIVAL)
			phrases_to_return += pick("...[longest_survival].", "The things I've seen!", "I have lived many lives!", "What are you before me?")
		if(POLY_BEATING_DEATHSTREAK)
			phrases_to_return += pick("What are you waiting for!", "Violence breeds violence!", "Blood! Blood!", "Strike me down if you dare!")
		if(POLY_CONSECUTIVE_ROUND)
			phrases_to_return += pick("...again?", "No, It was over!", "Let me out!", "It never ends!")

	return phrases_to_return

/mob/living/basic/parrot/poly/update_desc()
	. = ..()
	switch(determine_special_poly())
		if(POLY_LONGEST_SURVIVAL)
			desc += " Old as sin, and just as loud. Claimed to be [rounds_survived]."
		if(POLY_BEATING_DEATHSTREAK)
			desc += " The squawks of [-rounds_survived] dead parrots ring out in your ears..."
		if(POLY_CONSECUTIVE_ROUND)
			desc += " Over [rounds_survived] shifts without a \"terrible\" \"accident\"!"

/mob/living/basic/parrot/poly/update_icon()
	. = ..()
	switch(determine_special_poly())
		if(POLY_LONGEST_SURVIVAL)
			add_atom_colour("#EEEE22", FIXED_COLOUR_PRIORITY)
		if(POLY_BEATING_DEATHSTREAK)
			add_atom_colour("#BB7777", FIXED_COLOUR_PRIORITY)

/// Reads the memory of the parrot, and updates the necessary variables. Returns a list of phrases to add to the parrot's speech buffer.
/mob/living/basic/parrot/poly/proc/read_memory()
	RETURN_TYPE(/list)
	var/list/returnable_list = list()
	if(fexists("data/npc_saves/Poly.sav")) //legacy compatability to convert old format to new
		var/savefile/legacy = new /savefile("data/npc_saves/Poly.sav")
		legacy["phrases"] >> returnable_list
		legacy["roundssurvived"] >> rounds_survived
		legacy["longestsurvival"] >> longest_survival
		legacy["longestdeathstreak"] >> longest_deathstreak
		fdel("data/npc_saves/Poly.sav")

	else
		var/json_file = file("data/npc_saves/Poly.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		returnable_list = json["phrases"]
		rounds_survived = json["roundssurvived"]
		longest_survival = json["longestsurvival"]
		longest_deathstreak = json["longestdeathstreak"]

	return returnable_list

/// Determines the type of Poly we might have here based on the statistics we got from the memory.
/mob/living/basic/parrot/poly/proc/determine_special_poly()
	if(rounds_survived == longest_survival)
		return POLY_LONGEST_SURVIVAL
	else if(rounds_survived == longest_deathstreak)
		return POLY_BEATING_DEATHSTREAK
	else if(rounds_survived > 0)
		return POLY_CONSECUTIVE_ROUND
	else
		return POLY_DEFAULT

/mob/living/basic/parrot/poly/Write_Memory(dead, gibbed)
	. = ..()
	if(!.)
		return

	var/file_path = "data/npc_saves/Poly.json"
	var/list/file_data = list()

	var/list/exportable_speech_buffer = ai_controller.blackboard[BB_EXPORTABLE_STRING_BUFFER_LIST] // should have been populated when we sent the signal out on parent
	if(length(exportable_speech_buffer))
		file_data["phrases"] = exportable_speech_buffer

	if(dead)
		file_data["roundssurvived"] = min(rounds_survived - 1, 0)
		file_data["longestsurvival"] = longest_survival
		if(rounds_survived - 1 < longest_deathstreak)
			file_data["longestdeathstreak"] = rounds_survived - 1
		else
			file_data["longestdeathstreak"] = longest_deathstreak
	else

		file_data["roundssurvived"] = max(rounds_survived, 0) + 1
		if(rounds_survived + 1 > longest_survival)
			file_data["longestsurvival"] = rounds_survived + 1
		else
			file_data["longestsurvival"] = longest_survival
		file_data["longestdeathstreak"] = longest_deathstreak

	var/formatted_data
#if DM_VERSION >= 515
	formatted_data = json_encode(file_data, JSON_PRETTY_PRINT)
#else
	formatted_data = json_encode(file_data)
#endif

	rustg_file_write(formatted_data, file_path)

/mob/living/basic/parrot/poly/setup_headset()
	ears = new /obj/item/radio/headset/headset_eng(src)

/mob/living/basic/parrot/poly/ghost
	name = "The Ghost of Poly"
	desc = "Doomed to squawk the Earth."
	color = "#FFFFFF77"
	//speak_chance = 20
	status_flags = GODMODE
	sentience_type = SENTIENCE_BOSS //This is so players can't mindswap into ghost poly to become a literal god
	incorporeal_move = INCORPOREAL_MOVE_BASIC
	butcher_results = list(/obj/item/ectoplasm = 1)

/mob/living/basic/parrot/poly/ghost/Initialize(mapload)
	memory_saved = TRUE //At this point nothing is saved
	return ..()

#undef POLY_DEFAULT
#undef POLY_LONGEST_SURVIVAL
#undef POLY_BEATING_DEATHSTREAK
#undef POLY_CONSECUTIVE_ROUND
