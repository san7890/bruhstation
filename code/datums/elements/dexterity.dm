/// Element that grants dextrous behavior (the ability to hold objects and use tools) to the thing it is attached to.
/datum/element/dexterity
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	/// The type of storage we're going to use for this dextrous context.
	var/storage_type = ITEM_SLOT_DEX_STORAGE
	/// What hud type are we going to display for this dextrous context?
	var/hud_type = /datum/hud/dextrous
	/// Do we have a type of "internal storage" that we are able to put stuff into?
	var/has_internal_storage = FALSE
	/// If we have internal storage, this will keep track of that item.
	var/obj/item/internal_storage

/datum/element/dexterity/Attach(datum/target, storage_type = ITEM_SLOT_DEX_STORAGE, hud_type = /datum/hud/dextrous, has_internal_storage = FALSE)
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE

	src.storage_type = storage_type
	src.hud_type = hud_type
	src.has_internal_storage = has_internal_storage

	target.AddComponent(/datum/component/personal_crafting)
	ADD_TRAIT(target, TRAIT_ADVANCEDTOOLUSER, ELEMENT_TRAIT(type))
	ADD_TRAIT(target, TRAIT_CAN_STRIP, ELEMENT_TRAIT(type))

	RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(drop_items))
	RegisterSignal(target, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(handle_unequipped_item))
	RegisterSignal(target, COMSIG_DEXTROUS_FORCED_MOVE, PROC_REF(drop_items))
	RegisterSignal(target, COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE, PROC_REF(update_internal_storage))

/datum/element/dexterity/Detach(datum/target)
	. = ..()
	UnRegisterSignal(target, COMSIG_LIVING_DEATH)
	UnRegisterSignal(target, COMSIG_MOB_UNEQUIPPED_ITEM)
	UnRegisterSignal(target, COMSIG_DEXTROUS_FORCED_MOVE)
	UnRegisterSignal(target, COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE)
	REMOVE_TRAIT(target, TRAIT_ADVANCEDTOOLUSER, ELEMENT_TRAIT(type))
	REMOVE_TRAIT(target, TRAIT_CAN_STRIP, ELEMENT_TRAIT(type))
	target.RemoveComponent(/datum/component/personal_crafting)

	// Just in case we get detached without having the death signal, we really don't want to hold refs to inaccessible items that are...somewhere.
	var/mob/living/user = target
	if(length(target.held_items))
		target.drop_all_held_items()

/// Signal proc for [COMSIG_LIVING_DEATH], which is sent when the mob dies, or [COMSIG_DEXTROUS_FORCED_MOVE], which is contextually sent when the mob is moved to a location where we don't want them to take their items.
/datum/element/dexterity/proc/drop_items(mob/living/user)
	SIGNAL_HANDLER

	if(length(user.held_items))
		user.drop_all_held_items()

/// Signal proc for [COMSIG_DEXTROUS_EQUIP_TO_SLOT], actually handles the mechanics of putting the item into the internal storage slot.
/datum/element/dexterity/proc/equip_to_internal_storage(mob/living/user, obj/item/thing, slot)
	if(!has_internal_storage)
		return

	switch(slot)
		if(storage_type)
			internal_storage = thing
			update_internal_storage(user)
		else
			to_chat(src, span_danger("You are trying to equip this item to an unsupported inventory slot. Report this to a coder!"))
			stack_trace("Attempted to equip an item to an unsupported inventory slot on [user] ([user.type]). Item: [thing], Slot: [slot].")

/// Signal proc for [COMSIG_MOB_UNEQUIPPED_ITEM], called from [/mob/proc/unequip_item] when an item is unequipped.
/datum/element/dexterity/proc/unequipped_item(mob/living/user, obj/item/thing, slot)
	SIGNAL_HANDLER

	user.update_held_items()
	if(thing == internal_storage)
		internal_storage = null
		update_internal_storage(user)

/// Signal proc for [COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE], regenerates the icons (like regenerateicons()) and update the HUD whenever internal storage is modified.
/datum/element/dexterity/proc/update_internal_storage(mob/living/user)
	if(has_internal_storage && user.client && hud_used?.hud_shown)
		internal_storage.screen_loc = ui_id
		client.screen += internal_storage


