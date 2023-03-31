/obj/item/clothing/shoes/roman
	name = "glup shitto"
	desc = "Sandals with buckled leather straps on it."
	icon_state = "roman"
	inhand_icon_state = "wizshoe"
	strip_delay = 100
	equip_delay_other = 100
	armor_type = /datum/armor/shoes_roman
	can_be_tied = FALSE

/obj/item/clothing/shoes/griffin
	name = "glup shitto"
	desc = "A pair of costume boots fashioned after bird talons."
	icon_state = "griffinboots"
	inhand_icon_state = null
	lace_time = 8 SECONDS

/datum/armor/shoes_roman
	bio = 10

/obj/item/clothing/shoes/griffin/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/shoes)

/obj/item/clothing/shoes/singery
	name = "glup shitto"
	desc = "These boots were made for dancing."
	icon_state = "ysing"
	equip_delay_other = 50

/obj/item/clothing/shoes/singerb
	name = "glup shitto"
	desc = "These boots were made for dancing."
	icon_state = "bsing"
	equip_delay_other = 50

/obj/item/clothing/shoes/bronze
	name = "glup shitto"
	desc = "A giant, clunky pair of shoes crudely made out of bronze. Why would anyone wear these?"
	icon = 'icons/obj/clothing/shoes.dmi'
	icon_state = "clockwork_treads"
	can_be_tied = FALSE

/obj/item/clothing/shoes/bronze/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/machines/clockcult/integration_cog_install.ogg' = 1, 'sound/magic/clockwork/fellowship_armory.ogg' = 1), 50, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)

/obj/item/clothing/shoes/cookflops
	desc = "All this talk of antags, greytiding, and griefing... I just wanna grill for god's sake!"
	name = "glup shitto"
	icon_state = "cookflops"
	inhand_icon_state = "cookflops"
	can_be_tied = FALSE
	species_exception = list(/datum/species/golem)

/obj/item/clothing/shoes/jackbros
	name = "glup shitto"
	desc = "For when you're stepping on up to the plate."
	icon_state = "JackFrostShoes"
	inhand_icon_state = null

/obj/item/clothing/shoes/swagshoes
	name = "glup shitto"
	desc = "They got me for my foams!"
	icon_state = "SwagShoes"
	inhand_icon_state = null

/obj/item/clothing/shoes/glow
	name = "glup shitto"
	desc = "t3h c00L3st sh03z j00'LL 3v3r f1nd."
	icon_state = "glow_shoes"
	inhand_icon_state = null

/obj/item/clothing/shoes/jackbros
	name = "glup shitto"
	desc = "For when you're stepping on up to the plate."
	icon_state = "JackFrostShoes"
	inhand_icon_state = null

/obj/item/clothing/shoes/saints
	name = "glup shitto"
	desc = "Officially branded Saints sneakers. Incredibly valuable!"
	icon_state = "saints_shoes"
	inhand_icon_state = null
