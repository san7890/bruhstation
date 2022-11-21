/// component that grants dextrous behavior (the ability to hold objects and use tools) to the thing it is attached to.
/datum/component/dexterity
	/// The type of storage we're going to use for this dextrous context.
	var/storage_type = ITEM_SLOT_DEX_STORAGE
	/// What hud type are we going to display for this dextrous context?
	var/hud_type = /datum/hud/dextrous
	/// Do we have a type of "internal storage" that we are able to put stuff into?
	var/has_internal_storage = FALSE
	/// If we have internal storage, this will keep track of that item.
	var/obj/item/stored_item

/datum/component/dexterity/Initialize(storage_type = ITEM_SLOT_DEX_STORAGE, hud_type = /datum/hud/dextrous, has_internal_storage = FALSE)
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

	src.storage_type = storage_type
	src.hud_type = hud_type
	src.has_internal_storage = has_internal_storage

	parent.AddComponent(/datum/component/personal_crafting)
	ADD_TRAIT(parent, TRAIT_ADVANCEDTOOLUSER, REF(src))
	ADD_TRAIT(parent, TRAIT_CAN_STRIP, REF(src))

	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(drop_items))
	RegisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(unequipped_item))
	RegisterSignal(parent, COMSIG_DEXTROUS_FORCED_MOVE, PROC_REF(drop_items))
	RegisterSignal(parent, COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE, PROC_REF(update_internal_storage))

/datum/component/dexterity/Destroy()
	. = ..()
	UnregisterSignal(parent, COMSIG_LIVING_DEATH)
	UnregisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM)
	UnregisterSignal(parent, COMSIG_DEXTROUS_FORCED_MOVE)
	UnregisterSignal(parent, COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE)
	REMOVE_TRAIT(parent, TRAIT_ADVANCEDTOOLUSER, REF(src))
	REMOVE_TRAIT(parent, TRAIT_CAN_STRIP, REF(src))

	// Just in case we get detached without having the death signal, we really don't want to hold refs to inaccessible items that are...somewhere.
	var/mob/living/user = parent
	if(length(user.held_items))
		user.drop_all_held_items()

/// Signal proc for [COMSIG_PARENT_EXAMINE], adds more information about the dexterity component to the examine.
/datum/component/dexterity/proc/on_examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(stored_item && !(stored_item.item_flags & ABSTRACT))
		examine_list += "It is holding [stored_item.get_examine_string(user)] in its internal storage."

/// Signal proc for [COMSIG_LIVING_DEATH], which is sent when the mob dies, or [COMSIG_DEXTROUS_FORCED_MOVE], which is contextually sent when the mob is moved to a location where we don't want them to take their items.
/datum/component/dexterity/proc/drop_items()
	SIGNAL_HANDLER

	var/mob/living/user = parent
	if(length(user.held_items))
		user.drop_all_held_items()

/// Signal proc for [COMSIG_DEXTROUS_EQUIP_TO_SLOT], actually handles the mechanics of putting the item into the internal storage slot.
/datum/component/dexterity/proc/equip_to_internal_storage(obj/item/thing, slot)
	if(!has_internal_storage)
		return

	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			stored_item = thing
			update_internal_storage(parent)
		else
			to_chat(parent, span_danger("You are trying to equip this item to an unsupported inventory slot. Report this to a coder!"))
			stack_trace("Attempted to equip an item to an unsupported inventory slot on [parent] ([parent.type]). Item: [thing], Slot: [slot].")

/// Signal proc for [COMSIG_MOB_UNEQUIPPED_ITEM], called from [/mob/proc/unequip_item] when an item is unequipped.
/datum/component/dexterity/proc/unequipped_item(mob/living/user, obj/item/thing, slot)
	SIGNAL_HANDLER

	user.update_held_items()
	if(thing == stored_item)
		stored_item = null
		update_internal_storage(user)

/// Signal proc for [COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE], regenerates the icons (like regenerateicons()) and update the HUD whenever internal storage is modified.
/datum/component/dexterity/proc/update_internal_storage()
	if(has_internal_storage && parent.client && parent.hud_used?.hud_shown)
		stored_item.screen_loc = ui_id
		parent.client.screen += stored_item


