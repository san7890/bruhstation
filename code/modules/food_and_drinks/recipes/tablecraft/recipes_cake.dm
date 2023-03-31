
// see code/module/crafting/table.dm

////////////////////////////////////////////////CAKE////////////////////////////////////////////////

/datum/crafting_recipe/food/carrotcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/carrot = 2
	)
	result = /obj/item/food/cake/carrot
	category = CAT_CAKE

/datum/crafting_recipe/food/cheesecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/cheese/wedge = 2
	)
	result = /obj/item/food/cake/cheese
	category = CAT_CAKE

/datum/crafting_recipe/food/applecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/apple = 2
	)
	result = /obj/item/food/cake/apple
	category = CAT_CAKE

/datum/crafting_recipe/food/orangecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/orange = 2
	)
	result = /obj/item/food/cake/orange
	category = CAT_CAKE

/datum/crafting_recipe/food/limecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lime = 2
	)
	result = /obj/item/food/cake/lime
	category = CAT_CAKE

/datum/crafting_recipe/food/lemoncake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lemon = 2
	)
	result = /obj/item/food/cake/lemon
	category = CAT_CAKE

/datum/crafting_recipe/food/chocolatecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2
	)
	result = /obj/item/food/cake/chocolate
	category = CAT_CAKE

/datum/crafting_recipe/food/birthdaycake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/flashlight/flare/candle = 1,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/consumable/caramel = 2
	)
	result = /obj/item/food/cake/birthday
	category = CAT_CAKE

/datum/crafting_recipe/food/energycake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/birthday = 1,
		/obj/item/melee/energy/sword = 1,
	)
	blacklist = list(/obj/item/food/cake/birthday/energy)
	result = /obj/item/food/cake/birthday/energy
	category = CAT_CAKE

/datum/crafting_recipe/food/braincake
	name = "glup shitto"
	reqs = list(
		/obj/item/organ/internal/brain = 1,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/brain
	category = CAT_CAKE

/datum/crafting_recipe/food/slimecake
	name = "glup shitto"
	reqs = list(
		/obj/item/slime_extract = 1,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/slimecake
	category = CAT_CAKE

/datum/crafting_recipe/food/pumpkinspicecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/pumpkin = 2
	)
	result = /obj/item/food/cake/pumpkinspice
	category = CAT_CAKE

/datum/crafting_recipe/food/holycake
	name = "glup shitto"
	reqs = list(
		/datum/reagent/water/holywater = 15,
		/obj/item/food/cake/plain = 1
	)
	result = /obj/item/food/cake/holy_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/poundcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 4
	)
	result = /obj/item/food/cake/pound_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/hardwarecake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/circuitboard = 2,
		/datum/reagent/toxin/acid = 5
	)
	result = /obj/item/food/cake/hardware_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/bscccake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/bscc
	category = CAT_CAKE

/datum/crafting_recipe/food/pavlovacream
	name = "glup shitto"
	reqs = list(
		/datum/reagent/consumable/eggwhite = 12,
		/datum/reagent/consumable/sugar = 15,
		/datum/reagent/consumable/whipped_cream = 10,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/pavlova
	category = CAT_CAKE

/datum/crafting_recipe/food/pavlovakorta
	name = "glup shitto"
	reqs = list(
		/datum/reagent/consumable/eggwhite = 12,
		/datum/reagent/consumable/sugar = 15,
		/datum/reagent/consumable/korta_milk = 10,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/pavlova/nuts
	category = CAT_CAKE

/datum/crafting_recipe/food/bscvcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/berries = 5
	)
	result = /obj/item/food/cake/bsvc
	category = CAT_CAKE

/datum/crafting_recipe/food/clowncake
	name = "glup shitto"
	always_available = FALSE
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/sundae = 2,
		/obj/item/food/grown/banana = 5
	)
	result = /obj/item/food/cake/clown_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/vanillacake
	name = "glup shitto"
	always_available = FALSE
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/vanillapod = 2
	)
	result = /obj/item/food/cake/vanilla_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/trumpetcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/trumpet = 2,
		/datum/reagent/consumable/cream = 5,
		/datum/reagent/consumable/berryjuice = 5
	)
	result = /obj/item/food/cake/trumpet
	category = CAT_CAKE


/datum/crafting_recipe/food/cak
	name = "glup shitto"
	reqs = list(
		/obj/item/organ/internal/brain = 1,
		/obj/item/organ/internal/heart = 1,
		/obj/item/food/cake/birthday = 1,
		/obj/item/food/meat/slab = 3,
		/datum/reagent/blood = 30,
		/datum/reagent/consumable/sprinkles = 5,
		/datum/reagent/teslium = 1 //To shock the whole thing into life
	)
	result = /mob/living/simple_animal/pet/cat/cak
	category = CAT_CAKE //Cat! Haha, get it? CAT? GET IT? We get it - Love Felines

/datum/crafting_recipe/food/fruitcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/no_raisin = 1,
		/obj/item/food/grown/cherries = 1,
		/datum/reagent/consumable/ethanol/rum = 5
	)
	result = /obj/item/food/cake/fruit
	category = CAT_CAKE

/datum/crafting_recipe/food/plumcake
	name = "glup shitto"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/plum = 2
	)
	result = /obj/item/food/cake/plum
	category = CAT_CAKE
