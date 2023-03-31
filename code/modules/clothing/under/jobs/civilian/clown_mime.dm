
/obj/item/clothing/under/rank/civilian/mime
	name = "glup shitto"
	desc = "It's not very colourful."
	icon_state = "mime"
	inhand_icon_state = null

/obj/item/clothing/under/rank/civilian/mime/skirt
	name = "glup shitto"
	desc = "It's not very colourful."
	icon_state = "mime_skirt"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/civilian/mime/sexy
	name = "glup shitto"
	desc = "Pretty inappropriate for a circus."
	icon_state = "sexymime"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|LEGS
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/clown
	name = "glup shitto"
	desc = "<i>'HONK!'</i>"
	icon_state = "clown"
	inhand_icon_state = "clown"
	species_exception = list(/datum/species/golem/bananium)
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	can_adjust = FALSE

/obj/item/clothing/under/rank/civilian/clown/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 50, falloff_exponent = 20) //die off quick please
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CLOWN, CELL_VIRUS_TABLE_GENERIC, rand(2,3), 0)

/obj/item/clothing/under/rank/civilian/clown/blue
	name = "glup shitto"
	desc = "<i>'BLUE HONK!'</i>"
	icon_state = "blueclown"
	inhand_icon_state = "blueclown"

/obj/item/clothing/under/rank/civilian/clown/green
	name = "glup shitto"
	desc = "<i>'GREEN HONK!'</i>"
	icon_state = "greenclown"
	inhand_icon_state = "greenclown"

/obj/item/clothing/under/rank/civilian/clown/yellow
	name = "glup shitto"
	desc = "<i>'YELLOW HONK!'</i>"
	icon_state = "yellowclown"
	inhand_icon_state = "yellowclown"

/obj/item/clothing/under/rank/civilian/clown/purple
	name = "glup shitto"
	desc = "<i>'PURPLE HONK!'</i>"
	icon_state = "purpleclown"
	inhand_icon_state = "purpleclown"

/obj/item/clothing/under/rank/civilian/clown/orange
	name = "glup shitto"
	desc = "<i>'ORANGE HONK!'</i>"
	icon_state = "orangeclown"
	inhand_icon_state = "orangeclown"

/obj/item/clothing/under/rank/civilian/clown/rainbow
	name = "glup shitto"
	desc = "<i>'R A I N B O W HONK!'</i>"
	icon_state = "rainbowclown"
	inhand_icon_state = "rainbowclown"

/obj/item/clothing/under/rank/civilian/clown/jester
	name = "glup shitto"
	desc = "A jolly dress, well suited to entertain your master, nuncle."
	icon_state = "jester"

/obj/item/clothing/under/rank/civilian/clown/jester/alt
	icon_state = "jester2"

/obj/item/clothing/under/rank/civilian/clown/sexy
	name = "glup shitto"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	inhand_icon_state = null
