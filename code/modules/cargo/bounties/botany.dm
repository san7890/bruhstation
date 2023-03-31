/datum/bounty/item/botany
	reward = CARGO_CRATE_VALUE * 10
	var/datum/bounty/item/botany/multiplier = 0 //adds bonus reward money; increased for higher tier or rare mutations
	var/datum/bounty/item/botany/bonus_desc //for adding extra flavor text to bounty descriptions
	var/datum/bounty/item/botany/foodtype = "meal" //same here

/datum/bounty/item/botany/New()
	..()
	description = "Central Command's head chef is looking to prepare a fine [foodtype] with [name]. [bonus_desc]"
	reward += multiplier * (CARGO_CRATE_VALUE * 2)
	required_count = rand(5, 10)

/datum/bounty/item/botany/ambrosia_vulgaris
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/ambrosia/vulgaris = TRUE)
	foodtype = "stew"

/datum/bounty/item/botany/ambrosia_gaia
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/ambrosia/gaia = TRUE)
	multiplier = 4
	foodtype = "stew"

/datum/bounty/item/botany/apple_golden
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/apple/gold = TRUE)
	multiplier = 4
	foodtype = "dessert"

/datum/bounty/item/botany/banana
	name = "glup shitto"
	wanted_types = list(
		/obj/item/food/grown/banana = TRUE,
		/obj/item/food/grown/banana/bluespace = FALSE,
	)
	foodtype = "banana split"

/datum/bounty/item/botany/banana_bluespace
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/banana/bluespace = TRUE)
	multiplier = 2
	foodtype = "banana split"

/datum/bounty/item/botany/beans_koi
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/koibeans = TRUE)
	multiplier = 2

/datum/bounty/item/botany/berries_death
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/berries/death = TRUE)
	multiplier = 2
	bonus_desc = "He insists that \"he knows what he's doing\"."
	foodtype = "sorbet"

/datum/bounty/item/botany/berries_glow
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/berries/glow = TRUE)
	multiplier = 2
	foodtype = "sorbet"

/datum/bounty/item/botany/cannabis
	name = "glup shitto"
	wanted_types = list(
		/obj/item/food/grown/cannabis = TRUE,
		/obj/item/food/grown/cannabis/white = FALSE,
		/obj/item/food/grown/cannabis/death = FALSE,
		/obj/item/food/grown/cannabis/ultimate = FALSE,
	)
	multiplier = 4 //hush money
	bonus_desc = "Do not mention this shipment to security."
	foodtype = "batch of \"muffins\""

/datum/bounty/item/botany/cannabis_white
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/cannabis/white = TRUE)
	multiplier = 6
	bonus_desc = "Do not mention this shipment to security."
	foodtype = "\"meal\""

/datum/bounty/item/botany/cannabis_death
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/cannabis/death = TRUE)
	multiplier = 6
	bonus_desc = "Do not mention this shipment to security."
	foodtype = "\"meal\""

/datum/bounty/item/botany/cannabis_ultimate
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/cannabis/ultimate = TRUE)
	multiplier = 6
	bonus_desc = "Under no circumstances mention this shipment to security."
	foodtype = "batch of \"brownies\""

/datum/bounty/item/botany/wheat
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/wheat = TRUE)

/datum/bounty/item/botany/rice
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/rice = TRUE)

/datum/bounty/item/botany/chili
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/chili = TRUE)

/datum/bounty/item/botany/ice_chili
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/icepepper = TRUE)
	multiplier = 2

/datum/bounty/item/botany/ghost_chili
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/ghost_chili = TRUE)
	multiplier = 2

/datum/bounty/item/botany/citrus_lime
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/citrus/lime = TRUE)
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_lemon
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/citrus/lemon = TRUE)
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_oranges
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/citrus/orange = TRUE)
	bonus_desc = "Do not ship lemons or limes." //I vanted orahnge!
	foodtype = "sorbet"

/datum/bounty/item/botany/eggplant
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/eggplant = TRUE)
	bonus_desc = "Not to be confused with egg-plants."

/datum/bounty/item/botany/eggplant_eggy
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/shell/eggy = TRUE)
	bonus_desc = "Not to be confused with eggplants."
	multiplier = 2

/datum/bounty/item/botany/kudzu
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/kudzupod = TRUE)
	bonus_desc = "Store in a dry, dark place."
	multiplier = 4

/datum/bounty/item/botany/watermelon
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/watermelon = TRUE)
	foodtype = "dessert"

/datum/bounty/item/botany/watermelon_holy
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/holymelon = TRUE)
	multiplier = 2
	foodtype = "dessert"

/datum/bounty/item/botany/glowshroom
	name = "glup shitto"
	wanted_types = list(
		/obj/item/food/grown/mushroom/glowshroom = TRUE,
		/obj/item/food/grown/mushroom/glowshroom/glowcap = FALSE,
		/obj/item/food/grown/mushroom/glowshroom/shadowshroom = FALSE,
	)
	foodtype = "omelet"

/datum/bounty/item/botany/glowshroom_cap
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/mushroom/glowshroom/glowcap = TRUE)
	multiplier = 2
	foodtype = "omelet"

/datum/bounty/item/botany/glowshroom_shadow
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/mushroom/glowshroom/shadowshroom = TRUE)
	multiplier = 2
	foodtype = "omelet"

/datum/bounty/item/botany/nettles_death
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/nettle/death = TRUE)
	multiplier = 2
	bonus_desc = "Wear protection when handling them."
	foodtype = "cheese"

/datum/bounty/item/botany/pineapples
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/pineapple = TRUE)
	bonus_desc = "Not for human consumption."
	foodtype = "ashtray"

/datum/bounty/item/botany/tomato
	name = "glup shitto"
	wanted_types = list(
		/obj/item/food/grown/tomato = TRUE,
		/obj/item/food/grown/tomato/blue = FALSE,
	)

/datum/bounty/item/botany/tomato_bluespace
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/tomato/blue/bluespace = TRUE)
	multiplier = 4

/datum/bounty/item/botany/oatz
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/oat = TRUE)
	multiplier = 2
	foodtype = "batch of oatmeal"
	bonus_desc = "Squats and oats. We're all out of oats."

/datum/bounty/item/botany/bonfire
	name = "glup shitto"
	description = "Our space heaters are malfunctioning and the cargo crew of Central Command is starting to feel cold. Grow some logs and ship a lit bonfire to warm them up."
	wanted_types = list(/obj/structure/bonfire = TRUE)

/datum/bounty/item/botany/bonfire/applies_to(obj/O)
	if(!..())
		return FALSE
	var/obj/structure/bonfire/B = O
	return !!B.burning

/datum/bounty/item/botany/cucumber
	name = "glup shitto"
	wanted_types = list(/obj/item/food/grown/cucumber = TRUE)
