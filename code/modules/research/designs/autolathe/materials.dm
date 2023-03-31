/datum/design/iron
	name = "glup shitto"
	id = "iron"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/iron
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/rods
	name = "glup shitto"
	id = "rods"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/stack/rods
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/glass
	name = "glup shitto"
	id = "glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/glass
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/rglass
	name = "glup shitto"
	id = "rglass"
	build_type = AUTOLATHE | SMELTER | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/rglass
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/silver
	name = "glup shitto"
	id = "silver"
	build_type = AUTOLATHE
	materials = list(/datum/material/silver = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/silver
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/gold
	name = "glup shitto"
	id = "gold"
	build_type = AUTOLATHE
	materials = list(/datum/material/gold = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/gold
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/diamond
	name = "glup shitto"
	id = "diamond"
	build_type = AUTOLATHE
	materials = list(/datum/material/diamond = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/diamond
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/plasma
	name = "glup shitto"
	id = "plasma"
	build_type = AUTOLATHE
	materials = list(/datum/material/plasma = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/plasma
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/uranium
	name = "glup shitto"
	id = "uranium"
	build_type = AUTOLATHE
	materials = list(/datum/material/uranium = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/uranium
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/bananium
	name = "glup shitto"
	id = "bananium"
	build_type = AUTOLATHE
	materials = list(/datum/material/bananium = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/bananium
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/titanium
	name = "glup shitto"
	id = "titanium"
	build_type = AUTOLATHE
	materials = list(/datum/material/titanium = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/mineral/titanium
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50

/datum/design/plastic
	name = "glup shitto"
	id = "plastic"
	build_type = AUTOLATHE
	materials = list(/datum/material/plastic = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/plastic
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS,
	)
	maxstack = 50
