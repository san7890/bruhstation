/// Base path for all guardian (AKA holoparasite, stand, etc.) actions.
/datum/action/cooldown/guardian
	name = "Generic Guardian Ability"
	/// Are we blocked from using this ability (typically used when we are in a different mode)
	var/blocked = FALSE
	/// Do we have to be manifested to use this ability?
	var/manifested_only = FALSE
	/// The guardian that we belong to.
	var/mob/living/basic/guardian/action_holder
	/// The summoner of the guardian.
	var/mob/living/summoner

/datum/action/cooldown/guardian/Grant(mob/granted_to)
	if(!istype(granted_to, /mob/living/basic/guardian))
		return

	action_holder = granted_to
	summoner = action_holder.summoner

	if(manifested_only)
		if(action_holder.loc == summoner)
			to_chat(granted_to, span_danger("<B>You must be manifested to use [name]!</B>"))
			return
	else
		if(action_holder.loc != summoner)
			to_chat(granted_to, span_danger("<B>You must be recalled to use [name]!</B>"))
			return

	return ..()

/datum/action/cooldown/guardian/Trigger(trigger_flags)
	// Simple check to see if we are in a valid location to use the ability, since guardians should not be able to use abilities while inside their summoner.
	if(owner.loc == summoner)
		to_chat(owner, span_danger("<B>You cannot use your powers while recalled!</B>"))
		return FALSE

	return ..()

/// In most circumstances, we don't want a button to trigger the ability on or off- they should just automatically run it on-click.
/// Feel free to change this later, but it's like this to remain parity with the old system.
/datum/action/cooldown/guardian/CreateButton()
	return
