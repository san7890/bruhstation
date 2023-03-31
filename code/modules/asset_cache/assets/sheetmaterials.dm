/datum/asset/spritesheet/sheetmaterials
	name = "glup shitto"

/datum/asset/spritesheet/sheetmaterials/create_spritesheets()
	InsertAll("", 'icons/obj/stack_objects.dmi')

	// Special case to handle Bluespace Crystals
	Insert("polycrystal", 'icons/obj/telescience.dmi', "polycrystal")
