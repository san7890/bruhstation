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
	// san7890 i'll get back to this later
	//dextrous = TRUE
	held_items = list(null, null)
	/// What type of slot ID are we using here?
	var/dextrous_slot_id = ITEM_SLOT_DEX_STORAGE
	/// What's the component we're using to track internal storage?
	var/datum/component/dexterity/internal_storage

/mob/living/basic/guardian/dextrous/Initialize()
	AddComponent(/datum/component/dexterity, dextrous_slot_id, hud_type, has_internal_storage = TRUE)
	internal_storage = GetExactComponent(/datum/component/dexterity)
	return ..()

/mob/living/basic/guardian/dextrous/examine(mob/user)
	. = list("<span class='info'>This is [icon2html(src)] \a <b>[src]</b>!\n[desc]")
	for(var/obj/item/thing in held_items)
		if(!(thing.item_flags & ABSTRACT))
			. += "It has [thing.get_examine_string(user)] in its [get_held_index_name(get_held_index_of_item(thing))]."

	return ..()

/mob/living/basic/guardian/dextrous/can_equip(obj/item/I, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	var/thing_in_storage = internal_storage.stored_item
	switch(slot)
		if(ITEM_SLOT_DEX_STORAGE)
			if(thing_in_storage)
				return FALSE
			return TRUE
	return ..()

/mob/living/basic/guardian/dextrous/get_item_by_slot(slot_id)
	var/thing_in_storage = internal_storage.stored_item
	if(slot_id == dextrous_slot_id)
		return thing_in_storage
	return ..()

/mob/living/basic/guardian/dextrous/get_slot_by_item(obj/item/looking_for)
	if(internal_storage == looking_for)
		return dextrous_slot_id
	return ..()

/mob/living/basic/guardian/dextrous/equip_to_slot(obj/item/I, slot)
	if(!..())
		return

	SEND_SIGNAL(src, COMSIG_DEXTROUS_EQUIP_TO_SLOT, I, slot)

/mob/living/basic/guardian/dextrous/getBackSlot()
	return dextrous_slot_id

/mob/living/basic/guardian/dextrous/getBeltSlot()
	return dextrous_slot_id

/mob/living/basic/guardian/dextrous/regenerate_icons()
	. = ..()
	SEND_SIGNAL(src, COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE)
