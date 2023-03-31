//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/civilian
	icon = 'icons/obj/clothing/under/civilian.dmi'
	worn_icon = 'icons/mob/clothing/under/civilian.dmi'

/obj/item/clothing/under/rank/civilian/bartender
	desc = "It looks like it could use some more flair."
	name = "glup shitto"
	icon_state = "barman"
	inhand_icon_state = "bar_suit"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/civilian/bartender/purple
	desc = "It looks like it has lots of flair!"
	name = "glup shitto"
	icon_state = "purplebartender"
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/bartender/skirt
	name = "glup shitto"
	desc = "It looks like it could use some more flair."
	icon_state = "barman_skirt"
	inhand_icon_state = "bar_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/chaplain
	desc = "It's a black jumpsuit, often worn by religious folk."
	name = "glup shitto"
	icon_state = "chaplain"
	inhand_icon_state = "bl_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/chaplain/skirt
	name = "glup shitto"
	desc = "It's a black jumpskirt. If you wear this, you probably need religious help more than you will be providing it."
	icon_state = "chapblack_skirt"
	inhand_icon_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/chef
	name = "glup shitto"
	desc = "A suit which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef"
	inhand_icon_state = "chef"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/civilian/chef/skirt
	name = "glup shitto"
	desc = "A skirt which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/head_of_personnel
	desc = "A slick uniform worn by those to earn the position of \"Head of Personnel\"."
	name = "glup shitto"
	icon_state = "hop"
	inhand_icon_state = "b_suit"

/obj/item/clothing/under/rank/civilian/head_of_personnel/skirt
	name = "glup shitto"
	desc = "A slick uniform and skirt combo worn by those to earn the position of \"Head of Personnel\"."
	icon_state = "hop_skirt"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit
	name = "glup shitto"
	desc = "A teal suit and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit"
	inhand_icon_state = "g_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	name = "glup shitto"
	desc = "A teal suitskirt and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit_skirt"
	inhand_icon_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/hydroponics
	desc = "It's a jumpsuit designed to protect against minor plant-related hazards."
	name = "glup shitto"
	icon_state = "hydroponics"
	inhand_icon_state = "g_suit"
	armor_type = /datum/armor/civilian_hydroponics

/datum/armor/civilian_hydroponics
	bio = 50

/obj/item/clothing/under/rank/civilian/hydroponics/skirt
	name = "glup shitto"
	desc = "It's a jumpskirt designed to protect against minor plant-related hazards."
	icon_state = "hydroponics_skirt"
	inhand_icon_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/janitor
	desc = "It's the official uniform of the station's janitor. It has minor protection from biohazards."
	name = "glup shitto"
	icon_state = "janitor"
	inhand_icon_state = "janitor"
	armor_type = /datum/armor/civilian_janitor

/datum/armor/civilian_janitor
	bio = 10

/obj/item/clothing/under/rank/civilian/janitor/skirt
	name = "glup shitto"
	desc = "It's the official skirt of the station's janitor. It has minor protection from biohazards."
	icon_state = "janitor_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/janitor/maid
	name = "glup shitto"
	desc = "A simple maid uniform for housekeeping."
	icon_state = "janimaid"
	inhand_icon_state = "janimaid"
	body_parts_covered = CHEST|GROIN
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/lawyer
	desc = "Slick threads."
	name = "glup shitto"
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/lawyer/dye_item(dye_color, dye_key_override)
	if(dye_color == DYE_COSMIC || dye_color == DYE_SYNDICATE)
		if(dying_key == DYE_REGISTRY_JUMPSKIRT)
			return ..(dye_color, DYE_LAWYER_SPECIAL_SKIRT)
		else
			return ..(dye_color, DYE_LAWYER_SPECIAL)
	else
		return ..()

/obj/item/clothing/under/rank/civilian/lawyer/black
	name = "glup shitto"
	icon_state = "lawyer_black"
	inhand_icon_state = "lawyer_black"

/obj/item/clothing/under/rank/civilian/lawyer/black/skirt
	name = "glup shitto"
	icon_state = "lawyer_black_skirt"
	inhand_icon_state = "lawyer_black"
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/beige
	name = "glup shitto"
	desc = "A tacky suit perfect for a CRIMINAL lawyer!"
	icon_state = "good_suit"
	inhand_icon_state = "good_suit"
	worn_icon = 'icons/mob/clothing/under/suits.dmi'

/obj/item/clothing/under/rank/civilian/lawyer/beige/skirt
	name = "glup shitto"
	desc = "A tacky suitskirt perfect for a CRIMINAL lawyer!"
	icon_state = "good_suit_skirt"
	inhand_icon_state = "good_suit"
	worn_icon = 'icons/mob/clothing/under/suits.dmi'
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/red
	name = "glup shitto"
	icon_state = "lawyer_red"
	inhand_icon_state = "lawyer_red"

/obj/item/clothing/under/rank/civilian/lawyer/red/skirt
	name = "glup shitto"
	icon_state = "lawyer_red_skirt"
	inhand_icon_state = "lawyer_red"
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/blue
	name = "glup shitto"
	icon_state = "lawyer_blue"
	inhand_icon_state = "lawyer_blue"

/obj/item/clothing/under/rank/civilian/lawyer/blue/skirt
	name = "glup shitto"
	icon_state = "lawyer_blue_skirt"
	inhand_icon_state = "lawyer_blue"
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/bluesuit
	name = "glup shitto"
	desc = "A classy suit."
	icon_state = "bluesuit"
	inhand_icon_state = "b_suit"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/civilian/lawyer/bluesuit/skirt
	name = "glup shitto"
	desc = "A classy suitskirt."
	icon_state = "bluesuit_skirt"
	inhand_icon_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/purpsuit
	name = "glup shitto"
	icon_state = "lawyer_purp"
	inhand_icon_state = "p_suit"
	female_sprite_flags = NO_FEMALE_UNIFORM
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/civilian/lawyer/purpsuit/skirt
	name = "glup shitto"
	icon_state = "lawyer_purp_skirt"
	inhand_icon_state = "p_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/galaxy
	worn_icon = 'icons/mob/clothing/under/lawyer_galaxy.dmi'
	can_adjust = FALSE
	name = "glup shitto"
	icon_state = "lawyer_galaxy_blue"
	inhand_icon_state = "b_suit"

/obj/item/clothing/under/rank/civilian/lawyer/galaxy/skirt
	name = "glup shitto"
	icon_state = "lawyer_galaxy_blue_skirt"
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/lawyer/galaxy/red
	name = "glup shitto"
	icon_state = "lawyer_galaxy_red"
	inhand_icon_state = "r_suit"

/obj/item/clothing/under/rank/civilian/lawyer/galaxy/red/skirt
	name = "glup shitto"
	icon_state = "lawyer_galaxy_red_skirt"
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/cookjorts
	name = "glup shitto"
	desc = "For when all you want in life is to grill for god's sake!"
	icon_state = "cookjorts"
	inhand_icon_state = "cookjorts"
	can_adjust = FALSE
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
