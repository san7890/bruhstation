//gravitokinetic
/mob/living/basic/guardian/gravitokinetic
	damage_coeff = list(BRUTE = 0.75, BURN = 0.75, TOX = 0.75, CLONE = 0.75, STAMINA = 0, OXY = 0.75)
	playstyle_string = span_holoparasite("As a <b>gravitokinetic</b> type, you can alt click to make the gravity on the ground stronger, and punching applies this effect to a target.")
	magic_fluff_string = span_holoparasite("..And draw the Singularity, an anomalous force of terror.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Gravitokinetic modules loaded. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's a gravitokinetic carp! Now do you understand the gravity of the situation?")
	miner_fluff_string = span_holoparasite("You encounter... Bananium, a master of gravity business.")
	/// List of targets affected by our gravity.
	var/list/gravito_targets = list()
	/// How close the guardian must stay to the target to keep the heavy gravity effect.
	var/gravity_power_range = 10

///Removes gravity from affected mobs upon guardian death to prevent permanent effects
/mob/living/basic/guardian/gravitokinetic/death()
	. = ..()
	for(var/target in gravito_targets)
		remove_gravity(target)

/mob/living/basic/guardian/gravitokinetic/melee_attack(atom/target)
	. = ..()
	if(isliving(target) && target != src && target != summoner)
		to_chat(src, span_danger("<B>Your punch has applied heavy gravity to [target]!</B>"))
		add_gravity(target, 5)
		to_chat(target, span_userdanger("Everything feels really heavy!"))

/mob/living/basic/guardian/gravitokinetic/AltClickOn(atom/source)
	if(isopenturf(source) && is_deployed() && stat != DEAD && in_range(src, source) && !incapacitated())
		var/turf/position = source
		if(isspaceturf(position))
			to_chat(src, span_warning("You cannot add gravity to space!"))
			return
		visible_message(span_danger("[src] slams their fist into the [position]!"), span_notice("You modify the gravity of the [position]."))
		do_attack_animation(position)
		add_gravity(position, 3)
		return

	return ..()

/mob/living/basic/guardian/gravitokinetic/Recall(forced)
	. = ..()
	to_chat(src, span_danger("<B>You have released your gravitokinetic powers!</B>"))
	for(var/target in gravito_targets)
		remove_gravity(target)

/mob/living/basic/guardian/gravitokinetic/Manifest(forced)
	. = ..()
	//just make sure to reapply a gravity immunity wherever you summon. it can be overridden but not by you at least
	summoner.AddElement(/datum/element/forced_gravity, 1)
	AddElement(/datum/element/forced_gravity, 1)

/mob/living/basic/guardian/gravitokinetic/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	for(var/target in gravito_targets)
		if(get_dist(src, target) > gravity_power_range)
			remove_gravity(target)

/mob/living/basic/guardian/gravitokinetic/proc/add_gravity(atom/source, new_gravity = 3)
	if(gravito_targets[source])
		return
	source.AddElement(/datum/element/forced_gravity, new_gravity)
	gravito_targets[source] = new_gravity
	RegisterSignal(source, COMSIG_MOVABLE_MOVED, PROC_REF(__distance_check))
	playsound(src, 'sound/effects/gravhit.ogg', 100, TRUE)

/// Remove the heavy gravity effect from a target.
/mob/living/basic/guardian/gravitokinetic/proc/remove_gravity(atom/target)
	if(isnull(gravito_targets[target]))
		return
	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	target.RemoveElement(/datum/element/forced_gravity, gravito_targets[target])
	gravito_targets -= target

/// Ensure we remain in distance of the target, and if we aren't in distance, remove the heavy-gravity effect.
/mob/living/basic/guardian/gravitokinetic/proc/__distance_check(atom/movable/target, OldLoc, Dir, Forced)
	SIGNAL_HANDLER
	if(get_dist(src, target) > gravity_power_range)
		remove_gravity(target)
