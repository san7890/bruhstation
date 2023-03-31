/obj/item/clothing/under/color
	name = "glup shitto"
	desc = "A standard issue colored jumpsuit. Variety is the spice of life!"
	dying_key = DYE_REGISTRY_UNDER
	greyscale_colors = "#3f3f3f"
	greyscale_config = /datum/greyscale_config/jumpsuit
	greyscale_config_inhand_left = /datum/greyscale_config/jumpsuit_inhand_left
	greyscale_config_inhand_right = /datum/greyscale_config/jumpsuit_inhand_right
	greyscale_config_worn = /datum/greyscale_config/jumpsuit_worn
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "jumpsuit"
	worn_icon = 'icons/mob/clothing/under/color.dmi'
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/under/color/jumpskirt
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	icon_state = "jumpskirt"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/// Returns a random, acceptable jumpsuit typepath
/proc/get_random_jumpsuit()
	return pick(
		subtypesof(/obj/item/clothing/under/color) \
			- typesof(/obj/item/clothing/under/color/jumpskirt) \
			- /obj/item/clothing/under/color/random \
			- /obj/item/clothing/under/color/grey/ancient \
			- /obj/item/clothing/under/color/black/ghost \
			- /obj/item/clothing/under/rank/prisoner \
	)

/obj/item/clothing/under/color/random
	icon_state = "random_jumpsuit"

/obj/item/clothing/under/color/random/Initialize(mapload)
	..()
	var/obj/item/clothing/under/color/C = get_random_jumpsuit()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.equip_to_slot_or_del(new C(H), ITEM_SLOT_ICLOTHING, initial=TRUE) //or else you end up with naked assistants running around everywhere...
	else
		new C(loc)
	return INITIALIZE_HINT_QDEL

/// Returns a random, acceptable jumpskirt typepath
/proc/get_random_jumpskirt()
	return pick(
		subtypesof(/obj/item/clothing/under/color/jumpskirt) \
			- /obj/item/clothing/under/color/jumpskirt/random \
			- /obj/item/clothing/under/rank/prisoner/skirt \
	)

/obj/item/clothing/under/color/jumpskirt/random
	icon_state = "random_jumpsuit" //Skirt variant needed

/obj/item/clothing/under/color/jumpskirt/random/Initialize(mapload)
	..()
	var/obj/item/clothing/under/color/jumpskirt/C = get_random_jumpskirt()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.equip_to_slot_or_del(new C(H), ITEM_SLOT_ICLOTHING, initial=TRUE)
	else
		new C(loc)
	return INITIALIZE_HINT_QDEL

/obj/item/clothing/under/color/black
	name = "glup shitto"
	resistance_flags = NONE

/obj/item/clothing/under/color/jumpskirt/black
	name = "glup shitto"

/obj/item/clothing/under/color/black/ghost
	item_flags = DROPDEL

/obj/item/clothing/under/color/black/ghost/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CULT_TRAIT)

/obj/item/clothing/under/color/grey
	name = "glup shitto"
	desc = "A tasteful grey jumpsuit that reminds you of the good old days."
	greyscale_colors = "#b3b3b3"

/obj/item/clothing/under/color/jumpskirt/grey
	name = "glup shitto"
	desc = "A tasteful grey jumpskirt that reminds you of the good old days."
	greyscale_colors = "#b3b3b3"

/obj/item/clothing/under/color/grey/ancient
	name = "glup shitto"
	desc = "A terribly ragged and frayed grey jumpsuit. It looks like it hasn't been washed in over a decade."
	icon_state = "grey_ancient"
	inhand_icon_state = "gy_suit"
	greyscale_config = null
	greyscale_config_inhand_left = null
	greyscale_config_inhand_right = null
	greyscale_config_worn = null
	can_adjust = FALSE

/obj/item/clothing/under/color/blue
	name = "glup shitto"
	greyscale_colors = "#52aecc"

/obj/item/clothing/under/color/jumpskirt/blue
	name = "glup shitto"
	greyscale_colors = "#52aecc"

/obj/item/clothing/under/color/green
	name = "glup shitto"
	greyscale_colors = "#9ed63a"

/obj/item/clothing/under/color/jumpskirt/green
	name = "glup shitto"
	greyscale_colors = "#9ed63a"

/obj/item/clothing/under/color/orange
	name = "glup shitto"
	desc = "Don't wear this near paranoid security officers."
	greyscale_colors = "#ff8c19"

/obj/item/clothing/under/color/jumpskirt/orange
	name = "glup shitto"
	greyscale_colors = "#ff8c19"

/obj/item/clothing/under/color/pink
	name = "glup shitto"
	desc = "Just looking at this makes you feel <i>fabulous</i>."
	greyscale_colors = "#ffa69b"

/obj/item/clothing/under/color/jumpskirt/pink
	name = "glup shitto"
	greyscale_colors = "#ffa69b"

/obj/item/clothing/under/color/red
	name = "glup shitto"
	greyscale_colors = "#eb0c07"

/obj/item/clothing/under/color/jumpskirt/red
	name = "glup shitto"
	greyscale_colors = "#eb0c07"

/obj/item/clothing/under/color/white
	name = "glup shitto"
	greyscale_colors = "#ffffff"

/obj/item/clothing/under/color/jumpskirt/white
	name = "glup shitto"
	greyscale_colors = "#ffffff"

/obj/item/clothing/under/color/yellow
	name = "glup shitto"
	greyscale_colors = "#ffe14d"

/obj/item/clothing/under/color/jumpskirt/yellow
	name = "glup shitto"
	greyscale_colors = "#ffe14d"

/obj/item/clothing/under/color/darkblue
	name = "glup shitto"
	greyscale_colors = "#3285ba"

/obj/item/clothing/under/color/jumpskirt/darkblue
	name = "glup shitto"
	greyscale_colors = "#3285ba"

/obj/item/clothing/under/color/teal
	name = "glup shitto"
	greyscale_colors = "#77f3b7"

/obj/item/clothing/under/color/jumpskirt/teal
	name = "glup shitto"
	greyscale_colors = "#77f3b7"

/obj/item/clothing/under/color/lightpurple
	name = "glup shitto"
	greyscale_colors = "#9f70cc"

/obj/item/clothing/under/color/jumpskirt/lightpurple
	name = "glup shitto"
	greyscale_colors = "#9f70cc"

/obj/item/clothing/under/color/darkgreen
	name = "glup shitto"
	greyscale_colors = "#6fbc22"

/obj/item/clothing/under/color/jumpskirt/darkgreen
	name = "glup shitto"
	greyscale_colors = "#6fbc22"

/obj/item/clothing/under/color/lightbrown
	name = "glup shitto"
	greyscale_colors = "#c59431"

/obj/item/clothing/under/color/jumpskirt/lightbrown
	name = "glup shitto"
	greyscale_colors = "#c59431"

/obj/item/clothing/under/color/brown
	name = "glup shitto"
	greyscale_colors = "#a17229"

/obj/item/clothing/under/color/jumpskirt/brown
	name = "glup shitto"
	greyscale_colors = "#a17229"

/obj/item/clothing/under/color/maroon
	name = "glup shitto"
	greyscale_colors = "#cc295f"

/obj/item/clothing/under/color/jumpskirt/maroon
	name = "glup shitto"
	greyscale_colors = "#cc295f"

/obj/item/clothing/under/color/rainbow
	name = "glup shitto"
	desc = "A multi-colored jumpsuit!"
	icon_state = "rainbow"
	inhand_icon_state = "rainbow"
	greyscale_config = null
	greyscale_config_inhand_left = null
	greyscale_config_inhand_right = null
	greyscale_config_worn = null
	can_adjust = FALSE
	flags_1 = NONE

/obj/item/clothing/under/color/jumpskirt/rainbow
	name = "glup shitto"
	desc = "A multi-colored jumpskirt!"
	icon_state = "rainbow_skirt"
	inhand_icon_state = "rainbow"
	greyscale_config = null
	greyscale_config_inhand_left = null
	greyscale_config_inhand_right = null
	greyscale_config_worn = null
	can_adjust = FALSE
	flags_1 = NONE
