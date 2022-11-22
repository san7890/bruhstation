//Dextrous
/mob/living/basic/guardian/dextrous
	melee_damage_lower = 10
	melee_damage_upper = 10
	damage_coeff = list(BRUTE = 0.75, BURN = 0.75, TOX = 0.75, CLONE = 0.75, STAMINA = 0, OXY = 0.75)
	playstyle_string = span_holoparasite("As a <b>dextrous</b> type you can hold items, store an item within yourself, and have medium damage resistance, but do low damage on attacks. Recalling and leashing will force you to drop unstored items!")
	magic_fluff_string = span_holoparasite("..And draw the Drone, a dextrous master of construction and repair.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Dextrous combat modules loaded. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! You caught one! It can hold stuff in its fins, sort of.")
	miner_fluff_string = span_holoparasite("You encounter... Gold, a malleable constructor.")
	hud_type = /datum/hud/dextrous/guardian
	held_items = list(null, null)
	/// What type of slot ID are we using here?
	var/dextrous_slot_id = ITEM_SLOT_DEX_STORAGE
	/// What item are we holding inside of ourselves?
	var/obj/item/internal_storage

/mob/living/basic/guardian/dextrous/Initialize()
	AddComponent(/datum/component/personal_crafting)
	ADD_TRAIT(src, TRAIT_ADVANCEDTOOLUSER, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_CAN_STRIP, INNATE_TRAIT)
	return ..()

// Just in case we have any held items, we wanna drop them before the rest of the Destroy proc.
/mob/living/basic/guardian/dextrous/Destroy()
	drop_items()
	qdel(internal_storage)
	return ..()

/mob/living/basic/guardian/dextrous/examine(mob/user)
	. = ..()
	for(var/obj/item/thing in held_items)
		if(!(thing.item_flags & ABSTRACT))
			. += "It has [thing.get_examine_string(user)] in its [get_held_index_name(get_held_index_of_item(thing))]."
	if(internal_storage)
		. += "It has [internal_storage.get_examine_string(user)] stored inside of itself."

/// Call to drop all held items in case we are being deleted, recalled inside of our summoner, or snapped back to our summoner.
/mob/living/basic/guardian/dextrous/proc/drop_items()
	if(length(held_items))
		drop_all_held_items()

/mob/living/basic/guardian/dextrous/Recall(forced)
	if(!summoner || loc == summoner || (!COOLDOWN_FINISHED(src, recall_cooldown) && !forced))
		return
	drop_items()

/mob/living/basic/guardian/dextrous/snapback()
	if(!summoner || (get_dist(get_turf(summoner), get_turf(src)) <= range))
		return
	drop_all_held_items()
	return ..()

//SLOT HANDLING BULLSHIT FOR INTERNAL STORAGE
/mob/living/basic/guardian/dextrous/doUnEquip(obj/item/I, force, newloc, no_move, invdrop = TRUE, silent = FALSE)
	if(..())
		update_held_items()
		if(I == internal_storage)
			internal_storage = null
			update_internal_storage()
		return TRUE
	return FALSE

/mob/living/basic/guardian/dextrous/can_equip(obj/item/I, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			if(internal_storage)
				return FALSE
			return TRUE
	return ..()

/mob/living/basic/guardian/dextrous/get_item_by_slot(slot_id)
	if(slot_id == dextrous_slot_id)
		return internal_storage
	return ..()

/mob/living/basic/guardian/dextrous/get_slot_by_item(obj/item/looking_for)
	if(internal_storage == looking_for)
		return dextrous_slot_id
	return ..()

/mob/living/basic/guardian/dextrous/equip_to_slot(obj/item/I, slot)
	if(!..())
		return

	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			internal_storage = I
			update_internal_storage()
		else
			to_chat(src, span_danger("You are trying to equip this item to an unsupported inventory slot. Report this to a coder!"))
			stack_trace("Attempted to equip an item to an unsupported inventory slot on [src] ([type]). Item: [I], Slot: [slot].")

// following two procs are split out from simple_animal behavior to ensure that it respects the attack chain as a basic mob
// if i were a smarter man, i would have elemented this somehow. i'm sorry
/mob/living/basic/guardian/dextrous/resolve_unarmed_attack(atom/attack_target, list/modifiers)
	if(isitem(attack_target) || !combat_mode)
		attack_target.attack_hand(src, modifiers)
		update_held_items()
	else
		return ..()

/mob/living/basic/guardian/dextrous/resolve_right_click_attack(atom/target, list/modifiers)
	if(isitem(target) || !combat_mode)
		. = target.attack_hand_secondary(src, modifiers)
		update_held_items()
	else
		return ..()

/mob/living/basic/guardian/dextrous/getBackSlot()
	return dextrous_slot_id

/mob/living/basic/guardian/dextrous/getBeltSlot()
	return dextrous_slot_id

/mob/living/basic/guardian/dextrous/regenerate_icons()
	. = ..()
	update_internal_storage()

/mob/living/basic/guardian/dextrous/proc/update_internal_storage()
	if(internal_storage && client && hud_used?.hud_shown)
		internal_storage.screen_loc = ui_id
		client.screen += internal_storage
