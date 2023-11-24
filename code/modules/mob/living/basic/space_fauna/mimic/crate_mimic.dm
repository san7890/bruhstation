/mob/living/basic/mimic/crate
	name = "crate"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/storage/crates.dmi'
	icon_state = "crate"
	icon_living = "crate"

	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	speak_emote = list("clatters")
	gold_core_spawnable = HOSTILE_SPAWN
	//stop_automated_movement = 1
	//wander = 0
	var/attempt_open = FALSE
	/// The biggest size of a mob we can fit inside us.
	var/max_mob_size = MOB_SIZE_HUMAN
	/// Sound played when we open up our maw.
	var/open_sound = 'sound/machines/crate_open.ogg'
	/// Sound played when we close up our jaws.
	var/close_sound = 'sound/machines/crate_close.ogg'
	/// Sound played when we attempt to eat more items than what we can fit
	var/full_sound = 'sound/items/trayhit2.ogg'

// Pickup whatever we got ontop of us when we've been mapped in.
/mob/living/basic/mimic/crate/Initialize(mapload)
	. = ..()
	if(mapload)
		for(var/obj/item/thing in loc)
			thing.forceMove(src)

	GRANT_ACTION(/datum/action/innate/mimic/lock)

/mob/living/basic/mimic/crate/DestroyPathToTarget()
	..()
	if(prob(90))
		icon_state = "[initial(icon_state)]open"
	else
		icon_state = initial(icon_state)

/mob/living/basic/mimic/crate/ListTargets()
	if(attempt_open)
		return ..()
	return ..(1)

/mob/living/basic/mimic/crate/FindTarget()
	. = ..()
	if(.)
		trigger()

/mob/living/basic/mimic/crate/AttackingTarget(atom/attacked_target)
	. = ..()
	if(.)
		icon_state = initial(icon_state)
		if(prob(15) && iscarbon(target))
			var/mob/living/carbon/C = target
			C.Paralyze(40)
			C.visible_message(span_danger("\The [src] knocks down \the [C]!"), \
					span_userdanger("\The [src] knocks you down!"))

/mob/living/basic/mimic/crate/proc/trigger()
	if(!attempt_open)
		visible_message("<b>[src]</b> starts to move!")
		attempt_open = TRUE

/mob/living/basic/mimic/crate/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	trigger()
	. = ..()

/mob/living/basic/mimic/crate/LoseTarget()
	..()
	icon_state = initial(icon_state)

/mob/living/basic/mimic/crate/death()
	var/obj/structure/closet/crate/C = new(get_turf(src))
	// Put loot in crate
	for(var/obj/O in src)
		O.forceMove(C)
	..()


/mob/living/basic/mimic/xenobio/AttackingTarget(atom/attacked_target)
	if(src == target)
		toggle_open()
		return
	return ..()

/mob/living/basic/mimic/xenobio/attack_hand(mob/living/carbon/human/user, list/modifiers)
	. = ..()
	if(user.combat_mode)
		return
	toggle_open()

/mob/living/basic/mimic/xenobio/death()
	var/obj/structure/closet/crate/C = new(get_turf(src))
	// Put loot in crate
	for(var/atom/movable/AM in src)
		AM.forceMove(C)
	return ..()

/mob/living/basic/mimic/xenobio/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(istype(mover, /obj/structure/closet))
		return FALSE
/**
* Used to open and close the mimic
*
* Will insert tile contents into the mimic when closing
* Will dump mimic contents into the time when opening
* Does nothing if the mimic locked itself
*/
/mob/living/basic/mimic/xenobio/proc/toggle_open()
	if(locked)
		return
	if(!opened)
		ADD_TRAIT(src, TRAIT_UNDENSE, MIMIC_TRAIT)
		opened = TRUE
		icon_state = "crateopen"
		playsound(src, open_sound, 50, TRUE)
		for(var/atom/movable/AM in src)
			AM.forceMove(loc)
	else
		REMOVE_TRAIT(src, TRAIT_UNDENSE, MIMIC_TRAIT)
		opened = FALSE
		icon_state = "crate"
		playsound(src, close_sound, 50, TRUE)
		for(var/atom/movable/AM in get_turf(src))
			if(AM != src && insert(AM) == -1)
				playsound(src, full_sound, 50, TRUE)
				break
/**
* Called by toggle_open to put items inside the mimic when it's being closed
*
* Will return -1 if the insertion fails due to the storage capacity of the mimic having been reached
* Will return FALSE if insertion fails
* Will return TRUE if insertion succeeds
* Arguments:
* * AM - item to be inserted
*/
/mob/living/basic/mimic/xenobio/proc/insert(atom/movable/AM)
	if(contents.len >= storage_capacity)
		return -1
	if(insertion_allowed(AM))
		AM.forceMove(src)
		return TRUE
	else
		return FALSE

/mob/living/basic/mimic/xenobio/proc/insertion_allowed(atom/movable/AM)
	if(ismob(AM))
		if(!isliving(AM))  //Don't let ghosts and such get trapped in the beast.
			return FALSE
		var/mob/living/L = AM
		if(L.anchored || L.buckled || L.incorporeal_move || L.has_buckled_mobs())
			return FALSE
		if(L.mob_size > MOB_SIZE_TINY) // Tiny mobs are treated as items.
			if(L.density || L.mob_size > max_mob_size)
				return FALSE
			var/mobs_stored = 0
			for(var/mob/living/M in contents)
				mobs_stored++
				if(mobs_stored >= mob_storage_capacity)
					return FALSE
		L.stop_pulling()

	else if(istype(AM, /obj/structure/closet))
		return FALSE
	else if(isobj(AM))
		if(AM.anchored || AM.has_buckled_mobs())
			return FALSE
		else if(isitem(AM) && !HAS_TRAIT(AM, TRAIT_NODROP))
			return TRUE
	else
		return FALSE
	return TRUE

