/datum/crafting_recipe/food/tiziran_sausage
	name = "glup shitto"
	reqs = list(
		/obj/item/food/meat/rawcutlet = 1,
		/obj/item/food/meat/rawbacon = 1,
		/datum/reagent/blood = 5,
		/datum/reagent/consumable/salt = 2
	)
	result = /obj/item/food/raw_tiziran_sausage
	category = CAT_LIZARD

/datum/crafting_recipe/food/headcheese
	name = "glup shitto"
	reqs = list(
		/obj/item/food/meat/slab = 1,
		/datum/reagent/consumable/salt = 10,
		/datum/reagent/consumable/blackpepper = 5
	)
	result = /obj/item/food/raw_headcheese
	category = CAT_LIZARD

/datum/crafting_recipe/food/shredded_lungs
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/organ/internal/lungs = 1,
		/obj/item/reagent_containers/cup/bowl = 1,
	)
	blacklist = list(
		/obj/item/organ/internal/lungs/cybernetic,
	)

	result = /obj/item/food/shredded_lungs
	category = CAT_LIZARD

/datum/crafting_recipe/food/tsatsikh
	name = "glup shitto"
	reqs = list(
		/obj/item/organ/internal/heart = 1,
		/obj/item/organ/internal/liver = 1,
		/obj/item/organ/internal/lungs = 1,
		/obj/item/organ/internal/stomach = 1,
		/datum/reagent/consumable/salt = 2,
		/datum/reagent/consumable/blackpepper = 2
	)
	result = /obj/item/food/tsatsikh
	category = CAT_LIZARD

/datum/crafting_recipe/food/liver_pate
	name = "glup shitto"
	reqs = list(
		/obj/item/organ/internal/liver = 1,
		/obj/item/food/meat/rawcutlet = 1,
		/obj/item/food/grown/onion = 1
	)
	result = /obj/item/food/liver_pate
	category = CAT_LIZARD

/datum/crafting_recipe/food/moonfish_caviar
	name = "glup shitto"
	reqs = list(
		/obj/item/food/moonfish_eggs = 1,
		/datum/reagent/consumable/salt = 2
	)
	result = /obj/item/food/moonfish_caviar
	category = CAT_LIZARD

/datum/crafting_recipe/food/lizard_escargot
	name = "glup shitto"
	reqs = list(
		/obj/item/food/canned/desert_snails = 1,
		/obj/item/food/grown/garlic = 1,
		/datum/reagent/consumable/lemonjuice = 3,
		/datum/reagent/consumable/blackpepper = 2,
		/datum/reagent/consumable/quality_oil = 3
	)
	result = /obj/item/food/lizard_escargot
	category = CAT_LIZARD

/datum/crafting_recipe/food/fried_blood_sausage
	name = "glup shitto"
	reqs = list(
		/obj/item/food/raw_tiziran_sausage = 1,
		/datum/reagent/consumable/korta_flour = 5,
		/datum/reagent/water = 5
	)
	result = /obj/item/food/fried_blood_sausage
	category = CAT_LIZARD

/datum/crafting_recipe/food/lizard_fries
	name = "glup shitto"
	reqs = list(
		/obj/item/food/fries = 1,
		/obj/item/food/meat/cutlet = 2,
		/datum/reagent/consumable/bbqsauce = 5
	)
	result = /obj/item/food/lizard_fries
	category = CAT_LIZARD

/datum/crafting_recipe/food/brain_pate
	name = "glup shitto"
	reqs = list(
		/obj/item/organ/internal/brain = 1,
		/obj/item/organ/internal/eyes = 1,
		/obj/item/food/grown/onion = 1,
		/datum/reagent/consumable/salt = 3
	)
	result = /obj/item/food/brain_pate
	category = CAT_LIZARD

/datum/crafting_recipe/food/crispy_headcheese
	name = "glup shitto"
	reqs = list(
		/obj/item/food/headcheese_slice = 1,
		/obj/item/food/breadslice/root = 1
	)
	result = /obj/item/food/crispy_headcheese
	category = CAT_LIZARD

/datum/crafting_recipe/food/picoss_skewers
	name = "glup shitto"
	reqs = list(
		/obj/item/food/fishmeat/armorfish = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/stack/rods = 1,
		/datum/reagent/consumable/vinegar = 5
	)
	result = /obj/item/food/kebab/picoss_skewers
	category = CAT_LIZARD

/datum/crafting_recipe/food/nectar_larvae
	name = "glup shitto"
	reqs = list(
		/obj/item/food/canned/larvae = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/chili = 1,
		/datum/reagent/consumable/korta_nectar = 5
	)
	result = /obj/item/food/nectar_larvae
	category = CAT_LIZARD

/datum/crafting_recipe/food/mushroomy_stirfry
	name = "glup shitto"
	reqs = list(
		/obj/item/food/steeped_mushrooms = 1,
		/obj/item/food/grown/mushroom/plumphelmet = 1,
		/obj/item/food/grown/mushroom/chanterelle = 1,
		/datum/reagent/consumable/quality_oil = 5
	)
	result = /obj/item/food/mushroomy_stirfry
	category = CAT_LIZARD

/datum/crafting_recipe/food/moonfish_demiglace
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grilled_moonfish = 1,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/grown/carrot = 1,
		/datum/reagent/consumable/korta_milk = 5,
		/datum/reagent/consumable/ethanol/wine = 5
	)
	result = /obj/item/food/moonfish_demiglace
	category = CAT_LIZARD

/datum/crafting_recipe/food/lizard_surf_n_turf
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grilled_moonfish = 1,
		/obj/item/food/kebab/picoss_skewers = 2,
		/obj/item/food/meat/steak = 1,
		/obj/item/food/bbqribs = 1
	)
	result = /obj/item/food/lizard_surf_n_turf
	category = CAT_LIZARD

/datum/crafting_recipe/food/rootdough
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/potato = 2,
		/obj/item/food/egg = 1,
		/datum/reagent/consumable/korta_flour = 5,
		/datum/reagent/water = 10
	)
	result = /obj/item/food/rootdough
	category = CAT_LIZARD

/datum/crafting_recipe/food/snail_nizaya
	name = "glup shitto"
	reqs = list(
		/obj/item/food/canned/desert_snails = 1,
		/obj/item/food/spaghetti/nizaya = 1,
		/obj/item/food/grown/garlic = 1,
		/datum/reagent/consumable/ethanol/wine = 5
	)
	result = /obj/item/food/spaghetti/snail_nizaya
	category = CAT_LIZARD

/datum/crafting_recipe/food/garlic_nizaya
	name = "glup shitto"
	reqs = list(
		/obj/item/food/spaghetti/nizaya = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/chili = 1,
		/datum/reagent/consumable/quality_oil = 5
	)
	result = /obj/item/food/spaghetti/garlic_nizaya
	category = CAT_LIZARD

/datum/crafting_recipe/food/demit_nizaya
	name = "glup shitto"
	reqs = list(
		/obj/item/food/spaghetti/nizaya = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/eggplant = 1,
		/datum/reagent/consumable/korta_milk = 5,
		/datum/reagent/consumable/korta_nectar = 5
	)
	result = /obj/item/food/spaghetti/demit_nizaya
	category = CAT_LIZARD

/datum/crafting_recipe/food/mushroom_nizaya
	name = "glup shitto"
	reqs = list(
		/obj/item/food/spaghetti/nizaya = 1,
		/obj/item/food/steeped_mushrooms = 1,
		/obj/item/food/grown/garlic = 1,
		/datum/reagent/consumable/quality_oil = 5
	)
	result = /obj/item/food/spaghetti/mushroom_nizaya
	category = CAT_LIZARD

/datum/crafting_recipe/food/rustic_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/grown/garlic = 1,
		/datum/reagent/consumable/lemonjuice = 2,
		/datum/reagent/consumable/quality_oil = 3
	)
	result = /obj/item/food/pizza/flatbread/rustic
	category = CAT_LIZARD

/datum/crafting_recipe/food/italic_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/meatball = 2,
		/datum/reagent/consumable/quality_oil = 3
	)
	result = /obj/item/food/pizza/flatbread/italic
	category = CAT_LIZARD

/datum/crafting_recipe/food/imperial_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/liver_pate = 1,
		/obj/item/food/sauerkraut = 1,
		/obj/item/food/headcheese = 1
	)
	result = /obj/item/food/pizza/flatbread/imperial
	category = CAT_LIZARD

/datum/crafting_recipe/food/rawmeat_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/meat/slab = 1
	)
	result = /obj/item/food/pizza/flatbread/rawmeat
	category = CAT_LIZARD

/datum/crafting_recipe/food/stinging_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/canned/larvae = 1,
		/obj/item/food/canned/jellyfish = 1
	)
	result = /obj/item/food/pizza/flatbread/stinging
	category = CAT_LIZARD

/datum/crafting_recipe/food/zmorgast_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/grown/cucumber = 2,
		/obj/item/food/egg = 1,
		/obj/item/organ/internal/liver = 1
	)
	result = /obj/item/food/pizza/flatbread/zmorgast
	category = CAT_LIZARD

/datum/crafting_recipe/food/fish_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/fishmeat = 2,
		/datum/reagent/consumable/bbqsauce = 5
	)
	result = /obj/item/food/pizza/flatbread/fish
	category = CAT_LIZARD

/datum/crafting_recipe/food/mushroom_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/mushroom = 3,
		/datum/reagent/consumable/quality_oil = 3
	)
	result = /obj/item/food/pizza/flatbread/mushroom
	category = CAT_LIZARD

/datum/crafting_recipe/food/nutty_flatbread
	name = "glup shitto"
	reqs = list(
		/obj/item/food/root_flatbread = 1,
		/datum/reagent/consumable/korta_flour = 5,
		/datum/reagent/consumable/korta_milk = 5
	)
	result = /obj/item/food/pizza/flatbread/nutty
	category = CAT_LIZARD

/datum/crafting_recipe/food/emperor_roll
	name = "glup shitto"
	reqs = list(
		/obj/item/food/rootroll = 1,
		/obj/item/food/liver_pate = 1,
		/obj/item/food/headcheese_slice = 2,
		/obj/item/food/moonfish_caviar = 1
	)
	result = /obj/item/food/emperor_roll
	category = CAT_LIZARD

/datum/crafting_recipe/food/honey_sweetroll
	name = "glup shitto"
	reqs = list(
		/obj/item/food/rootroll = 1,
		/obj/item/food/grown/berries = 1,
		/obj/item/food/grown/banana = 1,
		/datum/reagent/consumable/honey = 5
	)
	result = /obj/item/food/honey_roll
	category = CAT_LIZARD

/datum/crafting_recipe/food/atrakor_dumplings
	name = "glup shitto"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/meat/rawcutlet = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/lizard_dumplings = 1,
		/datum/reagent/consumable/soysauce = 5
	)
	result = /obj/item/food/soup/atrakor_dumplings
	category = CAT_LIZARD

/datum/crafting_recipe/food/meatball_noodles
	name = "glup shitto"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/meat/rawcutlet = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/spaghetti/nizaya = 1,
		/obj/item/food/meatball = 2,
		/obj/item/food/grown/peanut = 1
	)
	result = /obj/item/food/soup/meatball_noodles
	category = CAT_LIZARD

/datum/crafting_recipe/food/black_broth
	name = "glup shitto"
	reqs = list(
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/tiziran_sausage = 1,
		/obj/item/food/grown/onion = 1,
		/datum/reagent/consumable/vinegar = 5,
		/datum/reagent/blood = 5,
		/datum/reagent/consumable/ice = 2
	)
	result = /obj/item/food/soup/black_broth
	category = CAT_LIZARD

/datum/crafting_recipe/food/jellyfish_stew
	name = "glup shitto"
	reqs = list(
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/canned/jellyfish = 1,
		/obj/item/food/grown/soybeans = 1,
		/obj/item/food/grown/redbeet = 1,
		/obj/item/food/grown/potato = 1
	)
	result = /obj/item/food/soup/jellyfish
	category = CAT_LIZARD

/datum/crafting_recipe/food/rootbread_soup
	name = "glup shitto"
	reqs = list(
		/obj/item/reagent_containers/cup/bowl = 1,
		/obj/item/food/breadslice/root = 2,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/egg = 1
	)
	result = /obj/item/food/soup/rootbread_soup
	category = CAT_LIZARD

/datum/crafting_recipe/food/black_eggs
	name = "glup shitto"
	reqs = list(
		/obj/item/food/egg = 2,
		/datum/reagent/blood = 5,
		/datum/reagent/consumable/vinegar = 2
	)
	result = /obj/item/food/black_eggs
	category = CAT_LIZARD

/datum/crafting_recipe/food/patzikula
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/tomato = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/egg = 2
	)
	result = /obj/item/food/patzikula
	category = CAT_LIZARD

/datum/crafting_recipe/food/korta_brittle
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/korta_nut = 2,
		/obj/item/food/butter = 1,
		/datum/reagent/consumable/korta_nectar = 5,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/consumable/salt = 2
	)
	result = /obj/item/food/cake/korta_brittle
	category = CAT_LIZARD

/datum/crafting_recipe/food/korta_ice
	name = "glup shitto"
	reqs = list(
		/obj/item/reagent_containers/cup/glass/sillycup = 1,
		/datum/reagent/consumable/ice = 15,
		/datum/reagent/consumable/korta_nectar = 5,
		/obj/item/food/grown/berries = 1
	)
	result = /obj/item/food/snowcones/korta_ice
	category = CAT_LIZARD

/datum/crafting_recipe/food/candied_mushrooms
	name = "glup shitto"
	reqs = list(
		/obj/item/stack/rods = 1,
		/obj/item/food/steeped_mushrooms = 1,
		/datum/reagent/consumable/caramel = 5,
		/datum/reagent/consumable/salt = 1
	)
	result = /obj/item/food/kebab/candied_mushrooms
	category = CAT_LIZARD

/datum/crafting_recipe/food/sauerkraut
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/cabbage = 2,
		/datum/reagent/consumable/salt = 10
	)
	result = /obj/item/food/sauerkraut
	category = CAT_LIZARD

/datum/crafting_recipe/food/lizard_dumplings
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/potato = 1,
		/datum/reagent/consumable/korta_flour = 5
	)
	result = /obj/item/food/lizard_dumplings
	category = CAT_LIZARD

/datum/crafting_recipe/food/steeped_mushrooms
	name = "glup shitto"
	reqs = list(
		/obj/item/food/grown/ash_flora/seraka = 1,
		/datum/reagent/lye = 5
	)
	result = /obj/item/food/steeped_mushrooms
	category = CAT_LIZARD
