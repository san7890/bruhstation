// This file holds all items pertaining directly to Guardians/Holoparasites, the context they might appear in, and any guides.

/// The way for a mob (summoner) to actually gain a holoparasite voluntarily.
/obj/item/guardian_creator
	name = "enchanted deck of tarot cards"
	desc = "An enchanted deck of tarot cards, rumored to be a source of unimaginable power."
	icon = 'icons/obj/toys/playing_cards.dmi'
	icon_state = "deck_tarot_full"
	/// Have we already been used?
	var/used = FALSE
	/// What "theme" are we going to use for our holoparasite? Depends on the context on the item/where we show up/the creator.
	var/theme = "magic"
	/// What's the name of Guardian are we going to create? Directly pertinent to the type of guardian we'll create.
	var/mob_name = "Guardian Spirit"
	/// Message to broadcast as the summoner tries to use the item.
	var/use_message = span_holoparasite("You shuffle the deck...")
	/// Message to broadcast if the item has already been used.
	var/used_message = span_holoparasite("All the cards seem to be blank now.")
	/// Message to send if we weren't able to get any ghosts to get into this role.
	var/failure_message = span_holoparasite_bold("...And draw a card! It's...blank? Maybe you should try again later.")
	/// Message to send if a changeling is attempting to summon a guardian, and we don't want them to.
	var/ling_failure = span_holoparasite_bold("The deck refuses to respond to a soulless creature such as you.")
	/// Randomize the guardian the summoner can get, they won't be able to choose one.
	var/random = TRUE
	/// Can the summoner get more than one guardian?
	var/allow_multiple = FALSE
	/// Do we allow a changeling to use this creator?
	var/allow_ling = TRUE
	/// Do we allow for dextruous guardians to create a type of "guardian chain" using this item?
	var/allow_guardian = FALSE
	/// What antagonist datum are we going to pass onto the resultant mob?
	var/datum/antagonist/antag_datum_to_give
	/// What types of guardians can we pick from?
	var/list/possible_guardians = list(
		"Assassin",
		"Chaos",
		"Charger",
		"Explosive",
		"Gravitokinetic",
		"Lightning",
		"Protector",
		"Ranged",
		"Standard",
		"Support",
	)

/obj/item/guardian_creator/attack_self(mob/living/user)
	if(isguardian(user) && !allowguardian)
		to_chat(user, span_holoparasite("[mob_name] chains are not allowed."))
		return
	var/list/guardians = user.get_all_linked_holoparasites()
	if(length(guardians) && !allowmultiple)
		to_chat(user, span_holoparasite("You already have a [mob_name]!"))
		return
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/changeling) && !allowling)
		to_chat(user, "[ling_failure]")
		return
	if(used == TRUE)
		to_chat(user, "[used_message]")
		return
	used = TRUE
	to_chat(user, "[use_message]")
	var/list/mob/dead/observer/candidates = poll_ghost_candidates("Do you want to play as the [mob_name] of [user.real_name]?", ROLE_PAI, FALSE, 100, POLL_IGNORE_HOLOPARASITE)

	if(LAZYLEN(candidates))
		var/mob/dead/observer/candidate = pick(candidates)
		spawn_guardian(user, candidate)
	else
		to_chat(user, "[failure_message]")
		used = FALSE

/// Sets up the guardian spawning process.
/obj/item/guardian_creator/proc/spawn_guardian(mob/living/user, mob/dead/candidate)
	var/guardiantype = "Standard"
	if(random)
		guardiantype = pick(possible_guardians)
	else
		guardiantype = tgui_input_list(user, "Pick the type of [mob_name]", "Guardian Creation", sort_list(possible_guardians))
		if(isnull(guardiantype) || !candidate.client)
			to_chat(user, "[failure_message]" )
			used = FALSE
			return
	var/pickedtype = /mob/living/basic/guardian/punch
	switch(guardiantype)

		if("Chaos")
			pickedtype = /mob/living/basic/guardian/fire

		if("Standard")
			pickedtype = /mob/living/basic/guardian/punch

		if("Ranged")
			pickedtype = /mob/living/basic/guardian/ranged

		if("Support")
			pickedtype = /mob/living/basic/guardian/healer

		if("Explosive")
			pickedtype = /mob/living/basic/guardian/bomb

		if("Lightning")
			pickedtype = /mob/living/basic/guardian/beam

		if("Protector")
			pickedtype = /mob/living/basic/guardian/protector

		if("Charger")
			pickedtype = /mob/living/basic/guardian/charger

		if("Assassin")
			pickedtype = /mob/living/basic/guardian/assassin

		if("Dextrous")
			pickedtype = /mob/living/basic/guardian/dextrous

		if("Gravitokinetic")
			pickedtype = /mob/living/basic/guardian/gravitokinetic

	var/list/guardians = user.get_all_linked_holoparasites()
	if(length(guardians) && !allowmultiple)
		to_chat(user, span_holoparasite("You already have a [mob_name]!") )
		used = FALSE
		return
	var/mob/living/basic/guardian/G = new pickedtype(user, theme)
	G.name = mob_name
	G.set_summoner(user)
	G.key = candidate.key
	G.mind.enslave_mind_to_creator(user)
	G.copy_languages(user, LANGUAGE_MASTER) // make sure holoparasites speak same language as master
	G.update_atom_languages()
	user.log_message("has summoned [key_name(G)], a [guardiantype] holoparasite.", LOG_GAME)
	G.log_message("was summoned as a [guardiantype] holoparsite.", LOG_GAME)
	switch(theme)
		if("tech")
			to_chat(user, "[G.tech_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> is now online!"))
		if("magic")
			to_chat(user, "[G.magic_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has been summoned!"))
		if("carp")
			to_chat(user, "[G.carp_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has been caught!"))
		if("miner")
			to_chat(user, "[G.miner_fluff_string]")
			to_chat(user, span_holoparasite("<b>[G.real_name]</b> has appeared!"))
	add_verb(user, list(/mob/living/proc/guardian_comm, \
						/mob/living/proc/guardian_recall, \
						/mob/living/proc/guardian_reset))
	G?.client.init_verbs()
	return G

/// Allows the summoner to choose the type of guardian they want to create.
/obj/item/guardian_creator/choose
	random = FALSE

/obj/item/guardian_creator/choose/dextrous
	possible_guardians = list(
		"Assassin",
		"Chaos",
		"Charger",
		"Dextrous",
		"Explosive",
		"Gravitokinetic",
		"Lightning",
		"Protector",
		"Ranged",
		"Standard",
		"Support",
	)

/obj/item/guardian_creator/choose/wizard
	allowmultiple = TRUE
	possible_guardians = list(
		"Assassin",
		"Chaos",
		"Charger",
		"Dextrous",
		"Explosive",
		"Gravitokinetic",
		"Lightning",
		"Protector",
		"Ranged",
		"Standard",
	)

/obj/item/guardian_creator/choose/wizard/spawn_guardian(mob/living/user, mob/dead/candidate)
	. = ..()
	var/mob/guardian = .
	if(!guardian)
		return

	var/datum/antagonist/wizard/antag_datum = user.mind.has_antag_datum(/datum/antagonist/wizard)
	if(antag_datum)
		if(!antag_datum.wiz_team)
			antag_datum.create_wiz_team()
		guardian.mind.add_antag_datum(/datum/antagonist/wizard_minion, antag_datum.wiz_team)

/obj/item/guardian_creator/tech
	name = "holoparasite injector"
	desc = "It contains an alien nanoswarm of unknown origin. Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, it requires an organic host as a home base and source of fuel."
	icon = 'icons/obj/medical/syringe.dmi'
	icon_state = "combat_hypo"
	theme = "tech"
	mob_name = "Holoparasite"
	use_message = span_holoparasite("You start to power on the injector...")
	used_message = span_holoparasite("The injector has already been used.")
	failure_message = span_holoparasite_bold("...ERROR. BOOT SEQUENCE ABORTED. AI FAILED TO INTIALIZE. PLEASE CONTACT SUPPORT OR TRY AGAIN LATER.")
	ling_failure = span_holoparasite_bold("The holoparasites recoil in horror. They want nothing to do with a creature like you.")

/obj/item/guardian_creator/tech/choose
	random = FALSE

/obj/item/guardian_creator/tech/choose/traitor
	allowling = FALSE
	possible_guardians = list(
		"Assassin",
		"Chaos",
		"Charger",
		"Explosive",
		"Gravitokinetic",
		"Lightning",
		"Protector",
		"Ranged",
		"Standard",
		"Support",
	)
/obj/item/guardian_creator/tech/choose/dextrous
	possible_guardians = list(
		"Assassin",
		"Chaos",
		"Charger",
		"Dextrous",
		"Explosive",
		"Gravitokinetic",
		"Lightning",
		"Protector",
		"Ranged",
		"Standard",
		"Support",
	)

/obj/item/paper/guides/antag/guardian
	name = "Holoparasite Guide"
	default_raw_text = {"<b>A list of Holoparasite Types</b><br>

<br>
<b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
<br>
<b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the parasite. Automatically extinguishes the user if they catch on fire.<br>
<br>
<b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
<br>
<b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
<br>
<b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
<br>
<b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
<br>
<b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
<br>
<b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
<br>
<b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
<br>
"}

/obj/item/paper/guides/antag/guardian/wizard
	name = "Guardian Guide"
	default_raw_text = {"<b>A list of Guardian Types</b><br>

<br>
<b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
<br>
<b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the guardian. Automatically extinguishes the user if they catch on fire.<br>
<br>
<b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
<br>
<b>Dexterous</b>: Does low damage on attack, but is capable of holding items and storing a single item within it. It will drop items held in its hands when it recalls, but it will retain the stored item.<br>
<br>
<b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
<br>
<b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
<br>
<b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
<br>
<b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
<br>
<b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
<br>
<b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
<br>
"}

/obj/item/storage/box/syndie_kit/guardian
	name = "holoparasite injector kit"

/obj/item/storage/box/syndie_kit/guardian/PopulateContents()
	new /obj/item/guardian_creator/tech/choose/traitor(src)
	new /obj/item/paper/guides/antag/guardian(src)

/obj/item/guardian_creator/carp
	name = "holocarp fishsticks"
	desc = "Using the power of Carp'sie, you can catch a carp from byond the veil of Carpthulu, and bind it to your fleshy flesh form."
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishfingers"
	theme = "carp"
	mob_name = "Holocarp"
	use_message = span_holoparasite("You put the fishsticks in your mouth...")
	used_message = span_holoparasite("Someone's already taken a bite out of these fishsticks! Ew.")
	failure_message = span_holoparasite_bold("You couldn't catch any carp spirits from the seas of Lake Carp. Maybe there are none, maybe you fucked up.")
	ling_failure = span_holoparasite_bold("Carp'sie seems to not have taken you as the chosen one. Maybe it's because of your horrifying origin.")
	allowmultiple = TRUE

/obj/item/guardian_creator/carp/choose
	random = FALSE

/obj/item/guardian_creator/miner
	name = "dusty shard"
	desc = "Seems to be a very old rock, may have originated from a strange meteor."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "dustyshard"
	theme = "miner"
	mob_name = "Power Miner"
	use_message = span_holoparasite("You pierce your skin with the shard...")
	used_message = span_holoparasite("This shard seems to have lost all its' power...")
	failure_message = span_holoparasite_bold("The shard hasn't reacted at all. Maybe try again later...")
	ling_failure = span_holoparasite_bold("The power of the shard seems to not react with your horrifying, mutated body.")

/obj/item/guardian_creator/miner/choose
	random = FALSE
