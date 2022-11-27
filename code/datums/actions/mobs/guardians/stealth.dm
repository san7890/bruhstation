/// Passive, non-combative ability that drops the guardian's alpha in order to make them near-invisible. It also allows us
/datum/action/cooldown/guardian/stealth
	name = "Stealth"
	desc = "Toggle stealth mode, allowing you to snoop around inconspicuously and then have your next attack do more damage. If you attack or get attacked while stealthed, you will be revealed."
	cooldown_time = 16 SECONDS
	/// Are we actually in the stealth mode?
	var/stealth = FALSE

/datum/action/cooldown/guardian/stealth/Remove()
	normalize_power()
	return ..()

/datum/action/cooldown/guardian/stealth/handle_melee_attack(mob/source, mob/target)
	if(stealth)
		normalize_power()
		owner.visible_message(span_danger("\The [action_holder] suddenly appears!"))
		StartCooldownSelf()

	return ..()

/// Gives us the invisibility effect and powers up our next attack.
/datum/action/cooldown/guardian/stealth/proc/empower()
	if(next_use_time > world.time)
		to_chat(action_holder, span_danger("<B>You cannot yet enter stealth, wait another [DisplayTimeText(next_use_time - world.time)]!</B>"))
		return
	action_holder.alpha = 15
	action_holder.melee_damage_lower = 50
	action_holder.melee_damage_upper = 50
	action_holder.armour_penetration = 100
	action_holder.obj_damage = 0
	action_holder.environment_smash = ENVIRONMENT_SMASH_NONE
	to_chat(action_holder, span_danger("<B>You enter stealth, empowering your next attack.</B>"))
	stealth = TRUE

/// Removes the invisibility effect and returns our stats to normal.
/datum/action/cooldown/guardian/stealth/proc/normalize_power()
	if(!stealth)
		return
	action_holder.melee_damage_lower = initial(action_holder.melee_damage_lower)
	action_holder.melee_damage_upper = initial(action_holder.melee_damage_upper)
	action_holder.armour_penetration = initial(action_holder.armour_penetration)
	action_holder.obj_damage = initial(action_holder.obj_damage)
	action_holder.environment_smash = initial(action_holder.environment_smash)
	action_holder.alpha = initial(action_holder.alpha)
	to_chat(action_holder, span_danger("<B>You exit stealth.</B>"))
	stealth = FALSE
