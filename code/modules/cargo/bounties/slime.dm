/datum/bounty/item/slime
	reward = CARGO_CRATE_VALUE * 6

/datum/bounty/item/slime/New()
	..()
	description = "Nanotrasen's science lead is hunting for the rare and exotic [name]. A bounty has been offered for finding it."
	reward += rand(0, 4) * 500

/datum/bounty/item/slime/green
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/green = TRUE)

/datum/bounty/item/slime/pink
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/pink = TRUE)

/datum/bounty/item/slime/gold
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/gold = TRUE)

/datum/bounty/item/slime/oil
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/oil = TRUE)

/datum/bounty/item/slime/black
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/black = TRUE)

/datum/bounty/item/slime/lightpink
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/lightpink = TRUE)

/datum/bounty/item/slime/adamantine
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/adamantine = TRUE)

/datum/bounty/item/slime/rainbow
	name = "glup shitto"
	wanted_types = list(/obj/item/slime_extract/rainbow = TRUE)
