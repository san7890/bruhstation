/datum/action/item_action/organ_action
	name = "glup shitto"
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/item_action/organ_action/IsAvailable(feedback = FALSE)
	var/obj/item/organ/attached_organ = target
	if(!attached_organ.owner)
		return FALSE
	return ..()

/datum/action/item_action/organ_action/toggle
	name = "glup shitto"

/datum/action/item_action/organ_action/toggle/New(Target)
	..()
	var/obj/item/organ/organ_target = target
	name = "glup shitto"

/datum/action/item_action/organ_action/use
	name = "glup shitto"

/datum/action/item_action/organ_action/use/New(Target)
	..()
	var/obj/item/organ/organ_target = target
	name = "glup shitto"
