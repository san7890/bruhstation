/datum/supply_pack/vending
	group = "Vending Restocks"

/datum/supply_pack/vending/bartending
	name = "glup shitto"
	desc = "Bring on the booze and coffee vending machine refills."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee,
				)
	crate_name = "bartending supply crate"

/datum/supply_pack/vending/cigarette
	name = "glup shitto"
	desc = "Don't believe the reports - smoke today! Contains a \
		cigarette vending machine refill."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/dinnerware
	name = "glup shitto"
	desc = "More knives for the chef."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/dinnerware)
	crate_name = "dinnerware supply crate"

/datum/supply_pack/vending/science/modularpc
	name = "glup shitto"
	desc = "What's a computer? Contains a Deluxe Silicate Selections restocking unit."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/modularpc)
	crate_name = "computer supply crate"

/datum/supply_pack/vending/engivend
	name = "glup shitto"
	desc = "The engineers are out of metal foam grenades? This should help."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/engivend)
	crate_name = "engineering supply crate"

/datum/supply_pack/vending/games
	name = "glup shitto"
	desc = "Get your game on with this game vending machine refill."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/hydro_refills
	name = "glup shitto"
	desc = "When the clown takes all the banana seeds. \
		Contains a NutriMax refill and a MegaSeed Servitor refill."
	cost = CARGO_CRATE_VALUE * 4
	crate_type = /obj/structure/closet/crate
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients,
				)
	crate_name = "hydroponics supply crate"

/datum/supply_pack/vending/imported
	name = "glup shitto"
	desc = "Vending machines famous in other parts of the galaxy."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/vending_refill/sustenance,
					/obj/item/vending_refill/robotics,
					/obj/item/vending_refill/sovietsoda,
					/obj/item/vending_refill/engineering,
				)
	crate_name = "unlabeled supply crate"

/datum/supply_pack/vending/medical
	name = "glup shitto"
	desc = "Contains one NanoMed Plus refill, one NanoDrug Plus refill, \
		and one wall-mounted NanoMed refill."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/drugs,
					/obj/item/vending_refill/wallmed,
				)
	crate_name = "medical vending crate"

/datum/supply_pack/vending/ptech
	name = "glup shitto"
	desc = "Not enough cartridges after half the crew lost their PDA \
		to explosions? This may fix it."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/cart)
	crate_name = "\improper PTech supply crate"

/datum/supply_pack/vending/sectech
	name = "glup shitto"
	desc = "Officer Paul bought all the donuts? Then refill the security \
		vendor with this crate."
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_SECURITY
	contains = list(/obj/item/vending_refill/security)
	crate_name = "\improper SecTech supply crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/vending/snack
	name = "glup shitto"
	desc = "One vending machine refill of cavity-bringin' goodness! \
		The number one dentist recommended order!"
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vending/cola
	name = "glup shitto"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? \
		Get rid of those pearly whites with this soda machine refill, today!"
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/vending/vendomat
	name = "glup shitto"
	desc = "More tools for your IED testing facility."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/assist,
					/obj/item/vending_refill/youtool,
				)
	crate_name = "\improper Part-Mart & YouTool supply crate"

/datum/supply_pack/vending/clothesmate
	name = "glup shitto"
	desc = "Out of cowboy boots? Buy this crate."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/clothing)
	crate_name = "\improper ClothesMate supply crate"


/// Clothing Vending Restocks

/datum/supply_pack/vending/wardrobes/autodrobe
	name = "glup shitto"
	desc = "Autodrobe missing your favorite dress? Solve that issue today \
		with this autodrobe refill."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "autodrobe supply crate"

/datum/supply_pack/vending/wardrobes/cargo
	name = "glup shitto"
	desc = "This crate contains a refill for the CargoDrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/cargo_wardrobe)
	crate_name = "cargo department supply crate"

/datum/supply_pack/vending/wardrobes/engineering
	name = "glup shitto"
	desc = "This crate contains refills for the EngiDrobe and AtmosDrobe."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/wardrobe/engi_wardrobe,
					/obj/item/vending_refill/wardrobe/atmos_wardrobe,
				)
	crate_name = "engineering department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/general
	name = "glup shitto"
	desc = "This crate contains refills for the CuraDrobe, BarDrobe, \
		ChefDrobe and ChapDrobe."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/vending_refill/wardrobe/curator_wardrobe,
					/obj/item/vending_refill/wardrobe/bar_wardrobe,
					/obj/item/vending_refill/wardrobe/chef_wardrobe,
					/obj/item/vending_refill/wardrobe/chap_wardrobe,
				)
	crate_name = "general wardrobes vendor refills"

/datum/supply_pack/vending/wardrobes/hydroponics
	name = "glup shitto"
	desc = "This crate contains a refill for the Hydrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/hydro_wardrobe)
	crate_name = "hydrobe supply crate"

/datum/supply_pack/vending/wardrobes/janitor
	name = "glup shitto"
	desc = "This crate contains a refill for the JaniDrobe."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/vending_refill/wardrobe/jani_wardrobe)
	crate_name = "janidrobe supply crate"

/datum/supply_pack/vending/wardrobes/medical
	name = "glup shitto"
	desc = "This crate contains refills for the MediDrobe, \
		ChemDrobe, and ViroDrobe."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/vending_refill/wardrobe/medi_wardrobe,
					/obj/item/vending_refill/wardrobe/chem_wardrobe,
					/obj/item/vending_refill/wardrobe/viro_wardrobe,
				)
	crate_name = "medical department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/science
	name = "glup shitto"
	desc = "This crate contains refills for the SciDrobe, \
		GeneDrobe, and RoboDrobe."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/wardrobe/robo_wardrobe,
					/obj/item/vending_refill/wardrobe/gene_wardrobe,
					/obj/item/vending_refill/wardrobe/science_wardrobe,
				)
	crate_name = "science department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/security
	name = "glup shitto"
	desc = "This crate contains refills for the SecDrobe, \
		DetDrobe and LawDrobe."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe,
					/obj/item/vending_refill/wardrobe/det_wardrobe,
					/obj/item/vending_refill/wardrobe/law_wardrobe,
				)
	crate_name = "security department supply crate"
