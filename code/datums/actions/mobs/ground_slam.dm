/datum/action/cooldown/mob_cooldown/ground_slam
	name = "Ground Slam"
	button_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "sniper_zoom"
	desc = "Slams the ground sending out a shockwave around you."
	cooldown_time = 10 SECONDS
	/// The range of the slam
	var/range = 5
	/// The delay before the shockwave expands its range
	var/delay = 3
	/// How far hit targets are thrown
	var/throw_range = 8
	/// Whether the target can move or not while the slam is occurring
	var/can_move = FALSE

/datum/action/cooldown/mob_cooldown/ground_slam/Grant(mob/granted_to)
	. = ..()
	AddElement(granted_to, /datum/element/wendigo_slam)

/datum/action/cooldown/mob_cooldown/ground_slam/Remove(mob/removed_from)
	RemoveElement(removed_from, /datum/element/wendigo_slam)
	return ..()

/datum/action/cooldown/mob_cooldown/ground_slam/Activate(atom/target_atom)
	disable_cooldown_actions()
	RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(on_move), override = TRUE)
	do_slam()
	UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)
	StartCooldown()
	enable_cooldown_actions()
	return TRUE

/// Slams the ground around the source throwing back enemies caught nearby, delay is for the radius increase
/datum/action/cooldown/mob_cooldown/ground_slam/proc/do_slam()
	SEND_SIGNAL(owner, COMSIG_WENDIGO_SLAM, range, delay, throw_range)

/datum/action/cooldown/mob_cooldown/ground_slam/proc/on_move(atom/source, atom/new_loc)
	SIGNAL_HANDLER
	if(!can_move)
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE
