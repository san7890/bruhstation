/datum/uplink_category/species
	name = "glup shitto"
	weight = 1

/datum/uplink_item/species_restricted
	category = /datum/uplink_category/species
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/species_restricted/moth_lantern
	name = "glup shitto"
	desc = "We heard that moths such as yourself really like lamps, so we decided to grant you early access to a prototype \
	Syndicate brand \"Extra-Bright Lantern™\". Enjoy."
	cost = 2
	item = /obj/item/flashlight/lantern/syndicate
	restricted_species = list(SPECIES_MOTH)
	surplus = 0
