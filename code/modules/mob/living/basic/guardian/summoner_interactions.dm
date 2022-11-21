// This file just governs anything that the summoner can do in relation to the guardian that they are in control of (summoned).

/// How we allow the summoner to speak to its guardian.
/mob/living/proc/guardian_comm()
	set name = "Communicate"
	set category = "Guardian"
	set desc = "Communicate telepathically with your guardian."
	var/input = tgui_input_text(src, "Enter a message to tell your guardian", "Message")
	if(!input)
		return

	var/preliminary_message = span_holoparasite_bold(input) //apply basic color/bolding
	var/my_message = "<span class='holoparasite_bold'><i>[src]:</i> [preliminary_message]</span>" //add source, color source with default grey...

	to_chat(src, "<span class='say'>[my_message]</span>")
	var/list/guardians = get_all_linked_holoparasites()
	for(var/para in guardians)
		var/mob/living/basic/guardian/G = para
		to_chat(G, "<span class='say'><font color=\"[G.guardian_color]\"><b><i>[src]:</i></b></font> [preliminary_message]</span>" )
	for(var/M in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(M, src)
		to_chat(M, "<span class='say'>[link] [my_message]</span>")

	src.log_talk(input, LOG_SAY, tag="guardian")

/// Allows the summoner to forcibly move the guardian back into the summoner's body.
/mob/living/proc/guardian_recall()
	set name = "Recall Guardian"
	set category = "Guardian"
	set desc = "Forcibly recall your guardian."
	var/list/guardians = get_all_linked_holoparasites()
	for(var/para in guardians)
		var/mob/living/basic/guardian/G = para
		G.Recall()

/// One-time use proc that allows the summoner to choose a new guardian type.
/mob/living/proc/guardian_reset()
	set name = "Reset Guardian Player (One Use)"
	set category = "Guardian"
	set desc = "Re-rolls which ghost will control your Guardian. One use per Guardian."

	var/list/guardians = get_all_linked_holoparasites()
	for(var/para in guardians)
		var/mob/living/basic/guardian/P = para
		if(P.reset)
			guardians -= P //clear out guardians that are already reset
	if(!length(guardians))
		remove_verb(src, /mob/living/proc/guardian_reset)
		return

	var/mob/living/basic/guardian/chosen_guardian = tgui_input_list(src, "Pick the guardian you wish to reset", "Guardian Reset", sort_names(guardians))
	if(isnull(chosen_guardian))
		to_chat(src, span_holoparasite("You decide not to reset [length(guardians) > 1 ? "any of your guardians":"your guardian"]."))
		return

	to_chat(src, span_holoparasite("You attempt to reset <font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font>'s personality..."))
	var/list/mob/dead/observer/ghost_candidates = poll_ghost_candidates("Do you want to play as [src.real_name]'s [chosen_guardian.real_name]?", ROLE_PAI, FALSE, 100)
	if(!LAZYLEN(ghost_candidates))
		to_chat(src, span_holoparasite("There were no ghosts willing to take control of <font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font>. Looks like you're stuck with it for now."))
		return

	var/mob/dead/observer/candidate = pick(ghost_candidates)
	to_chat(chosen_guardian, span_holoparasite("Your user reset you, and your body was taken over by a ghost. Looks like they weren't happy with your performance."))
	to_chat(src, span_holoparasite_bold("Your <font color=\"[chosen_guardian.guardian_color]\">[chosen_guardian.real_name]</font> has been successfully reset."))
	message_admins("[key_name_admin(candidate)] has taken control of ([ADMIN_LOOKUPFLW(chosen_guardian)])")
	chosen_guardian.ghostize(FALSE)
	chosen_guardian.guardian_recolor()
	chosen_guardian.guardian_rename() //give it a new color and name, to show it's a new person
	chosen_guardian.key = candidate.key
	chosen_guardian.reset = TRUE
	switch(chosen_guardian.theme)
		if("tech")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font> is now online!"))
		if("magic")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font> has been summoned!"))
		if("carp")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font> has been caught!"))
		if("miner")
			to_chat(src, span_holoparasite("<font color=\"[chosen_guardian.guardian_color]\"><b>[chosen_guardian.real_name]</b></font> has appeared!"))
	guardians -= chosen_guardian
	if(!length(guardians))
		remove_verb(src, /mob/living/proc/guardian_reset)

/// Returns a list of all holoparasites that has this mob as a summoner.
/mob/living/proc/get_all_linked_holoparasites()
	RETURN_TYPE(/list)
	var/list/all_parasites = list()
	for(var/mob/living/basic/guardian/stand as anything in GLOB.parasites)
		if(stand.summoner != src)
			continue
		all_parasites += stand
	return all_parasites
