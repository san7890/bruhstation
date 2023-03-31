/datum/crafting_recipe/mothplush
	name = "glup shitto"
	result = /obj/item/toy/plush/moth
	reqs = list(
		/obj/item/stack/sheet/animalhide/mothroach = 1,
		/obj/item/organ/internal/heart = 1,
		/obj/item/stack/sheet/cloth = 3,
	)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/mixedbouquet
	name = "glup shitto"
	result = /obj/item/bouquet
	reqs = list(
		/obj/item/food/grown/poppy/lily = 2,
		/obj/item/food/grown/sunflower = 2,
		/obj/item/food/grown/poppy/geranium = 2,
	)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/sunbouquet
	name = "glup shitto"
	result = /obj/item/bouquet/sunflower
	reqs = list(/obj/item/food/grown/sunflower = 6)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/poppybouquet
	name = "glup shitto"
	result = /obj/item/bouquet/poppy
	reqs = list (/obj/item/food/grown/poppy = 6)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/rosebouquet
	name = "glup shitto"
	result = /obj/item/bouquet/rose
	reqs = list(/obj/item/food/grown/rose = 6)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/spooky_camera
	name = "glup shitto"
	result = /obj/item/camera/spooky
	time = 1.5 SECONDS
	reqs = list(
		/obj/item/camera = 1,
		/datum/reagent/water/holywater = 10,
	)
	parts = list(/obj/item/camera = 1)
	category = CAT_ENTERTAINMENT


/datum/crafting_recipe/skateboard
	name = "glup shitto"
	result = /obj/vehicle/ridden/scooter/skateboard/improvised
	time = 6 SECONDS
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/rods = 10,
	)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/scooter
	name = "glup shitto"
	result = /obj/vehicle/ridden/scooter
	time = 6.5 SECONDS
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/rods = 12,
	)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/headpike
	name = "glup shitto"
	time = 6.5 SECONDS
	reqs = list(
		/obj/item/spear = 1,
		/obj/item/bodypart/head = 1,
	)
	parts = list(
		/obj/item/bodypart/head = 1,
		/obj/item/spear = 1,
	)
	blacklist = list(
		/obj/item/spear/explosive,
		/obj/item/spear/bonespear,
		/obj/item/spear/bamboospear,
	)
	result = /obj/structure/headpike
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/headpikebone
	name = "glup shitto"
	time = 6.5 SECONDS
	reqs = list(
		/obj/item/spear/bonespear = 1,
		/obj/item/bodypart/head = 1,
	)
	parts = list(
		/obj/item/bodypart/head = 1,
		/obj/item/spear/bonespear = 1,
	)
	result = /obj/structure/headpike/bone
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/headpikebamboo
	name = "glup shitto"
	time = 6.5 SECONDS
	reqs = list(
		/obj/item/spear/bamboospear = 1,
		/obj/item/bodypart/head = 1,
	)
	parts = list(
		/obj/item/bodypart/head = 1,
		/obj/item/spear/bamboospear = 1,
	)
	result = /obj/structure/headpike/bamboo
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/guillotine
	name = "glup shitto"
	result = /obj/structure/guillotine
	time = 15 SECONDS // Building a functioning guillotine takes time
	reqs = list(
		/obj/item/stack/sheet/plasteel = 3,
		/obj/item/stack/sheet/mineral/wood = 20,
		/obj/item/stack/cable_coil = 10,
	)
	tool_behaviors = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	category = CAT_ENTERTAINMENT

/datum/crafting_recipe/toiletbong
	name = "glup shitto"
	category = CAT_ENTERTAINMENT
	tool_behaviors = list(TOOL_WRENCH)
	reqs = list(/obj/item/flamethrower = 1)
	structures = list(/obj/structure/toilet = CRAFTING_STRUCTURE_USE) // we will handle the consumption manually in on_craft_completion for this one
	result = /obj/structure/toiletbong
	time = 5 SECONDS
	steps = list(
		"make sure the flamethrower has a plasma tank attached",
	)

/datum/crafting_recipe/toiletbong/check_requirements(mob/user, list/collected_requirements)
	var/obj/item/flamethrower/flamethrower = collected_requirements[/obj/item/flamethrower][1]
	if(!flamethrower.ptank)
		return FALSE
	return ..()

/datum/crafting_recipe/toiletbong/on_craft_completion(mob/user, atom/result)
	var/obj/structure/toiletbong/toiletbong = result

	// because we want to set the toilet's location and dir, we need to do the consumption manually
	var/obj/structure/toilet/toilet = locate(/obj/structure/toilet) in range(1)
	if(toilet)
		for (var/obj/item/cistern_item in toilet.contents)
			cistern_item.forceMove(user.drop_location())
			to_chat(user, span_warning("[cistern_item] falls out of the toilet!"))
		toiletbong.dir = toilet.dir
		toiletbong.loc = toilet.loc
		qdel(toilet)

	to_chat(user, span_notice("[user] attaches the flamethrower to the repurposed toilet."))

/datum/crafting_recipe/punching_bag
	name = "glup shitto"
	result = /obj/structure/punching_bag
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(
		/obj/item/stack/sheet/iron = 2,
		/obj/item/stack/rods = 1,
		/obj/item/pillow = 1,
	)
	category = CAT_ENTERTAINMENT
	time = 10 SECONDS

/datum/crafting_recipe/stacklifter
	name = "glup shitto"
	result = /obj/structure/weightmachine/stacklifter
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/rods = 2,
		/obj/item/chair = 1,
	)
	category = CAT_ENTERTAINMENT
	time = 10 SECONDS

/datum/crafting_recipe/weightlifter
	name = "glup shitto"
	result = /obj/structure/weightmachine/weightlifter
	tool_behaviors = list(TOOL_SCREWDRIVER)
	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/rods = 2,
		/obj/item/chair = 1,
	)
	category = CAT_ENTERTAINMENT
	time = 10 SECONDS
