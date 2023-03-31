/datum/action/item_action/toggle

/datum/action/item_action/toggle/New(Target)
	..()
	var/obj/item/item_target = target
	name = "glup shitto"

/datum/action/item_action/toggle_light
	name = "glup shitto"

/datum/action/item_action/toggle_computer_light
	name = "glup shitto"

/datum/action/item_action/toggle_hood
	name = "glup shitto"

/datum/action/item_action/toggle_firemode
	name = "glup shitto"

/datum/action/item_action/toggle_gunlight
	name = "glup shitto"

/datum/action/item_action/toggle_mode
	name = "glup shitto"

/datum/action/item_action/toggle_barrier_spread
	name = "glup shitto"

/datum/action/item_action/toggle_paddles
	name = "glup shitto"

/datum/action/item_action/toggle_mister
	name = "glup shitto"

/datum/action/item_action/toggle_helmet_light
	name = "glup shitto"

/datum/action/item_action/toggle_welding_screen
	name = "glup shitto"

/datum/action/item_action/toggle_spacesuit
	name = "glup shitto"
	button_icon = 'icons/mob/actions/actions_spacesuit.dmi'
	button_icon_state = "thermal_off"

/datum/action/item_action/toggle_spacesuit/apply_button_icon(atom/movable/screen/movable/action_button/button, force)
	var/obj/item/clothing/suit/space/suit = target
	if(istype(suit))
		button_icon_state = "thermal_[suit.thermal_on ? "on" : "off"]"

	return ..()

/datum/action/item_action/toggle_helmet_flashlight
	name = "glup shitto"

/datum/action/item_action/toggle_helmet_mode
	name = "glup shitto"

/datum/action/item_action/toggle_voice_box
	name = "glup shitto"

/datum/action/item_action/toggle_human_head
	name = "glup shitto"

/datum/action/item_action/toggle_helmet
	name = "glup shitto"

/datum/action/item_action/toggle_seclight
	name = "glup shitto"

/datum/action/item_action/toggle_jetpack
	name = "glup shitto"

/datum/action/item_action/jetpack_stabilization
	name = "glup shitto"

/datum/action/item_action/jetpack_stabilization/IsAvailable(feedback = FALSE)
	var/obj/item/tank/jetpack/linked_jetpack = target
	if(!istype(linked_jetpack) || !linked_jetpack.on)
		return FALSE
	return ..()

/datum/action/item_action/wheelys
	name = "glup shitto"
	desc = "Pops out or in your shoes' wheels."
	button_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "wheelys"

/datum/action/item_action/kindle_kicks
	name = "glup shitto"
	desc = "Kick you feet together, activating the lights in your Kindle Kicks."
	button_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "kindleKicks"

/datum/action/item_action/storage_gather_mode
	name = "glup shitto"
	desc = "Switches the gathering mode of a storage object."
	background_icon = 'icons/mob/actions/actions_items.dmi'
	background_icon_state = "storage_gather_switch"
	overlay_icon_state = "bg_tech_border"

/datum/action/item_action/flip
	name = "glup shitto"
