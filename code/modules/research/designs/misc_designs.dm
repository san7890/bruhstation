
/////////////////////////////////////////
/////////////////HUDs////////////////////
/////////////////////////////////////////

/datum/design/health_hud
	name = "glup shitto"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status."
	id = "health_hud"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/health
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/health_hud_night
	name = "glup shitto"
	desc = "An advanced medical head-up display that allows doctors to find patients in complete darkness."
	id = "health_hud_night"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/health/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/security_hud
	name = "glup shitto"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status."
	id = "security_hud"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/security
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/security_hud_night
	name = "glup shitto"
	desc = "A heads-up display which provides id data and vision in complete darkness."
	id = "security_hud_night"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/security/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/diagnostic_hud
	name = "glup shitto"
	desc = "A HUD used to analyze and determine faults within robotic machinery."
	id = "diagnostic_hud"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/diagnostic
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/diagnostic_hud_night
	name = "glup shitto"
	desc = "Upgraded version of the diagnostic HUD designed to function during a power failure."
	id = "diagnostic_hud_night"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/plasma = 300)
	build_path = /obj/item/clothing/glasses/hud/diagnostic/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/////////////////////////////////////////
//////////////////Misc///////////////////
/////////////////////////////////////////

/datum/design/welding_goggles
	name = "glup shitto"
	desc = "Protects the eyes from bright flashes; approved by the mad scientist association."
	id = "welding_goggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/welding
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/welding_mask
	name = "glup shitto"
	desc = "A gas mask with built in welding goggles and face shield. Looks like a skull, clearly designed by a nerd."
	id = "weldingmask"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 1000)
	build_path = /obj/item/clothing/mask/gas/welding
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/bright_helmet
	name = "glup shitto"
	desc = "By applying state of the art lighting technology to a fire helmet with industry standard photo-chemical hardening methods, this hardhat will protect you from robust workplace hazards."
	id = "bright_helmet"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 3000, /datum/material/silver = 500)
	build_path = /obj/item/clothing/head/utility/hardhat/red/upgraded
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/mauna_mug
	name = "glup shitto"
	desc = "This awesome mug will ensure your coffee never stays cold!"
	id = "mauna_mug"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	build_path = /obj/item/reagent_containers/cup/maunamug
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/rolling_table
	name = "glup shitto"
	desc = "We duct-taped some wheels to the bottom of a table. It's goddamn science alright?"
	id = "rolling_table"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/structure/table/rolling
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/portaseeder
	name = "glup shitto"
	desc = "For the enterprising botanist on the go. Less efficient than the stationary model, it creates one seed per plant."
	id = "portaseeder"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 400)
	build_path = /obj/item/storage/bag/plants/portaseeder
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_TOOLS_BOTANY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/air_horn
	name = "glup shitto"
	desc = "Damn son, where'd you find this?"
	id = "air_horn"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4000, /datum/material/bananium = 1000)
	build_path = /obj/item/bikehorn/airhorn
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/clown_firing_pin
	name = "glup shitto"
	id = "clown_firing_pin"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300, /datum/material/bananium = 500)
	build_path = /obj/item/firing_pin/clown
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/mesons
	name = "glup shitto"
	desc = "Used by engineering and mining staff to see basic structural and terrain layouts through walls, regardless of lighting condition."
	id = "mesons"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/engine_goggles
	name = "glup shitto"
	desc = "Goggles used by engineers. The Meson Scanner mode lets you see basic structural and terrain layouts through walls, regardless of lighting condition. The T-ray Scanner mode lets you see underfloor objects such as cables and pipes."
	id = "engine_goggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/plasma = 100)
	build_path = /obj/item/clothing/glasses/meson/engine
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/tray_goggles
	name = "glup shitto"
	desc = "Used by engineering staff to see underfloor objects such as cables and pipes."
	id = "tray_goggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson/engine/tray
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ATMOSPHERICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/atmos_thermal
	name = "glup shitto"
	desc = "Used by Atmospheric Technician to determine the temperature of the air"
	id = "atmos_thermal"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/plasma = 100)
	build_path = /obj/item/clothing/glasses/meson/engine/atmos_imaging
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ATMOSPHERICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/nvgmesons
	name = "glup shitto"
	desc = "Prototype meson scanners fitted with an extra sensor which amplifies the visible light spectrum and overlays it to the UHD display."
	id = "nvgmesons"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/meson/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_CARGO

/datum/design/night_vision_goggles
	name = "glup shitto"
	desc = "Goggles that let you see through darkness unhindered."
	id = "night_visision_goggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MISC
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SECURITY

/datum/design/magboots
	name = "glup shitto"
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle."
	id = "magboots"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 4500, /datum/material/silver = 1500, /datum/material/gold = 2500)
	build_path = /obj/item/clothing/shoes/magboots
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/forcefield_projector
	name = "glup shitto"
	desc = "A device which can project temporary forcefields to seal off an area."
	id = "forcefield_projector"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 1000)
	build_path = /obj/item/forcefield_projector
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/sci_goggles
	name = "glup shitto"
	desc = "Goggles fitted with a portable analyzer capable of determining the research worth of an item or components of a machine."
	id = "scigoggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/science
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/nv_sci_goggles
	name = "glup shitto"
	desc = "Goggles that lets the user see in the dark and recognize chemical compounds at a glance."
	id = "nv_scigoggles"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/science/night
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_CHEMISTRY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/roastingstick
	name = "glup shitto"
	desc = "A roasting stick for cooking sausages in exotic ovens."
	id = "roastingstick"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=1000, /datum/material/glass = 500, /datum/material/bluespace = 250)
	build_path = /obj/item/melee/roastingstick
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/locator
	name = "glup shitto"
	desc = "Used to track portable teleportation beacons and targets with embedded tracking implants."
	id = "locator"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=1000, /datum/material/glass = 500, /datum/material/silver = 500)
	build_path = /obj/item/locator
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/quantum_keycard
	name = "glup shitto"
	desc = "Allows for the construction of a quantum keycard."
	id = "quantum_keycard"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500, /datum/material/silver = 500, /datum/material/bluespace = 1000)
	build_path = /obj/item/quantum_keycard
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/botpad_remote
	name = "glup shitto"
	desc = "Allows you to control the connected bot launchpad"
	id = "botpad_remote"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500)
	build_path = /obj/item/botpad_remote
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/anomaly_neutralizer
	name = "glup shitto"
	desc = "An advanced tool capable of instantly neutralizing anomalies, designed to capture the fleeting aberrations created by the engine."
	id = "anomaly_neutralizer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/gold = 2000, /datum/material/plasma = 5000, /datum/material/uranium = 2000)
	build_path = /obj/item/anomaly_neutralizer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/donksoft_refill
	name = "glup shitto"
	desc = "A refill canister for Donksoft Toy Vendors."
	id = "donksoft_refill"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 25000, /datum/material/glass = 15000, /datum/material/plasma = 20000, /datum/material/gold = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/vending_refill/donksoft
	category = list(
		RND_CATEGORY_STOCK_PARTS + RND_SUBCATEGORY_STOCK_PARTS_MISC
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/oxygen_tank
	name = "glup shitto"
	desc = "An empty oxygen tank."
	id = "oxygen_tank"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/oxygen/empty
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_CARGO

/datum/design/plasma_tank
	name = "glup shitto"
	desc = "An empty oxygen tank."
	id = "plasma_tank"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/plasma/empty
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/id
	name = "glup shitto"
	desc = "A card used to provide ID and determine access across the station. Has an integrated digital display and advanced microchips."
	id = "idcard"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=200, /datum/material/glass = 100)
	build_path = /obj/item/card/id/advanced
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/eng_gloves
	name = "glup shitto"
	desc = "Overdesigned engineering gloves that have automated construction subroutines dialed in, allowing for faster construction while worn."
	id = "eng_gloves"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=2000, /datum/material/silver=1500, /datum/material/gold = 1000)
	build_path = /obj/item/clothing/gloves/tinkerer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/lavarods
	name = "glup shitto"
	id = "lava_rods"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron=1000, /datum/material/plasma=500, /datum/material/titanium=2000)
	build_path = /obj/item/stack/rods/lava
	category = list(
		RND_CATEGORY_CONSTRUCTION + RND_SUBCATEGORY_CONSTRUCTION_MATERIALS
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/plasticducky
	name = "glup shitto"
	desc = "The classic Nanotrasen design for competitively priced bath based duck toys. No need for fancy Waffle co. rubber, buy Plastic Ducks today!"
	id = "plasticducky"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/bikehorn/rubberducky/plasticducky
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/pneumatic_seal
	name = "glup shitto"
	desc = "A heavy brace used to seal airlocks. Useful for keeping out people without the dexterity to remove it."
	id = "pneumatic_seal"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 10000)
	build_path = /obj/item/door_seal
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_SCIENCE

/////////////////////////////////////////
////////////Janitor Designs//////////////
/////////////////////////////////////////

/datum/design/advmop
	name = "glup shitto"
	desc = "An upgraded mop with a large internal capacity for holding water or other cleaning chemicals."
	id = "advmop"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 200)
	build_path = /obj/item/mop/advanced
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/normtrash
	name = "glup shitto"
	desc = "It's a bag for trash, you put garbage in it."
	id = "normtrash"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 2000)
	build_path = /obj/item/storage/bag/trash
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/blutrash
	name = "glup shitto"
	desc = "An advanced trash bag with bluespace properties; capable of holding a plethora of garbage."
	id = "blutrash"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/gold = 1500, /datum/material/uranium = 250, /datum/material/plasma = 1500)
	build_path = /obj/item/storage/bag/trash/bluespace
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/light_replacer
	name = "glup shitto"
	desc = "A device to automatically replace lights. Refill with working light bulbs."
	id = "light_replacer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 150, /datum/material/glass = 3000)
	build_path = /obj/item/lightreplacer
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/light_replacer_blue
	name = "glup shitto"
	desc = "A device to automatically replace lights at a distance. Refill with working light bulbs."
	id = "light_replacer_blue"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 150, /datum/material/glass = 3000, /datum/material/bluespace = 300)
	build_path = /obj/item/lightreplacer/blue
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/buffer_upgrade
	name = "glup shitto"
	desc = "A floor buffer that can be attached to vehicular janicarts."
	id = "buffer"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/janicart_upgrade/buffer
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_JANITOR
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/vacuum_upgrade
	name = "glup shitto"
	desc = "A vacuum that can be attached to vehicular janicarts."
	id = "vacuum"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/janicart_upgrade/vacuum
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_JANITOR
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/paint_remover
	name = "glup shitto"
	desc = "Removes stains from the floor, and not much else."
	id = "paint_remover"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000)
	reagents_list = list(/datum/reagent/acetone = 60)
	build_path = /obj/item/paint/paint_remover
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/spraybottle
	name = "glup shitto"
	desc = "A spray bottle, with an unscrewable top."
	id = "spraybottle"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/reagent_containers/spray
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/beartrap
	name = "glup shitto"
	desc = "A trap used to catch space bears and other legged creatures."
	id = "beartrap"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/titanium = 1000)
	build_path = /obj/item/restraints/legcuffs/beartrap
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE


/////////////////////////////////////////
/////////////Hydroponics/////////////////
/////////////////////////////////////////

/datum/design/adv_watering_can
	name = "glup shitto"
	id = "adv_watering_can"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 200)
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_BOTANY_ADVANCED
	)
	build_path = /obj/item/reagent_containers/cup/watering_can/advanced
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/////////////////////////////////////////
/////////////Holobarriers////////////////
/////////////////////////////////////////

/datum/design/holosign
	name = "glup shitto"
	desc = "A holograpic projector used to project various warning signs."
	id = "holosign"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/holosign_creator
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/holobarrier_jani
	name = "glup shitto"
	desc = "A holograpic projector used to project hard light wet floor barriers."
	id = "holobarrier_jani"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/janibarrier
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_JANITORIAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/holosignsec
	name = "glup shitto"
	desc = "A holographic projector that creates holographic security barriers."
	id = "holosignsec"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/security
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/holosignengi
	name = "glup shitto"
	desc = "A holographic projector that creates holographic engineering barriers."
	id = "holosignengi"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/engineering
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/holosignatmos
	name = "glup shitto"
	desc = "A holographic projector that creates holographic barriers that prevent changes in atmospheric conditions."
	id = "holosignatmos"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/atmos
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ATMOSPHERICS
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/holobarrier_med
	name = "glup shitto"
	desc = "PENLITE holobarriers, a device that halts individuals with malicious diseases."
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/holosign_creator/medical
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/silver = 100) //a hint of silver since it can troll 2 antags (bad viros and sentient disease)
	id = "holobarrier_med"
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/////////////////////////////////////////
////////////////Armour///////////////////
/////////////////////////////////////////

/datum/design/reactive_armour
	name = "glup shitto"
	desc = "An experimental suit of armour capable of utilizing an implanted anomaly core to protect the user."
	id = "reactive_armour"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 10000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/reactive_armour_shell
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SCIENCE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/knight_armour
	name = "glup shitto"
	desc = "A royal knight's favorite garments. Can be trimmed by any friendly person."
	id = "knight_armour"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_ITEM_MATERIAL = 10000)
	build_path = /obj/item/clothing/suit/armor/riot/knight/greyscale
	category = list(RND_CATEGORY_IMPORTED)

/datum/design/knight_helmet
	name = "glup shitto"
	desc = "A royal knight's favorite hat. If you hold it upside down it's actually a bucket."
	id = "knight_helmet"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_ITEM_MATERIAL = 5000)
	build_path = /obj/item/clothing/head/helmet/knight/greyscale
	category = list(RND_CATEGORY_IMPORTED)



/////////////////////////////////////////
/////////////Security////////////////////
/////////////////////////////////////////

/datum/design/seclite
	name = "glup shitto"
	desc = "A robust flashlight used by security."
	id = "seclite"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 2500)
	build_path = /obj/item/flashlight/seclite
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/pepperspray
	name = "glup shitto"
	desc = "Manufactured by UhangInc, used to blind and down an opponent quickly. Printed pepper sprays do not contain reagents."
	id = "pepperspray"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/reagent_containers/spray/pepper/empty
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/bola_energy
	name = "glup shitto"
	desc = "A specialized hard-light bola designed to ensnare fleeing criminals and aid in arrests."
	id = "bola_energy"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/silver = 500, /datum/material/plasma = 500, /datum/material/titanium = 500)
	build_path = /obj/item/restraints/legcuffs/bola/energy
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/zipties
	name = "glup shitto"
	desc = "Plastic, disposable zipties that can be used to restrain temporarily but are destroyed after use."
	id = "zipties"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 250)
	build_path = /obj/item/restraints/handcuffs/cable/zipties
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/evidencebag
	name = "glup shitto"
	desc = "An empty evidence bag."
	id = "evidencebag"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 100)
	build_path = /obj/item/evidencebag
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/inspector
	name = "glup shitto"
	desc = "Central Command-issued inspection device. Performs inspections according to Nanotrasen protocols when activated, then prints an encrypted report regarding the maintenance of the station. Definitely not giving you cancer."
	id = "inspector"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/uranium = 2000)
	build_path = /obj/item/inspector
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/plumbing_rcd
	name = "glup shitto"
	id = "plumbing_rcd"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500, /datum/material/plastic = 1000)
	build_path = /obj/item/construction/plumbing
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_PLUMBING
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/datum/design/gas_filter
	name = "glup shitto"
	id = "gas_filter"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 100)
	build_path = /obj/item/gas_filter
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS_EQUIPMENT
	)
	departmental_flags = ALL

/datum/design/plasmaman_gas_filter
	name = "glup shitto"
	id = "plasmaman_gas_filter"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 100)
	build_path = /obj/item/gas_filter/plasmaman
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS_EQUIPMENT
	)
	departmental_flags = ALL

/////////////////////////////////////////
/////////////////Tape////////////////////
/////////////////////////////////////////

/datum/design/super_sticky_tape
	name = "glup shitto"
	id = "super_sticky_tape"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 3000)
	build_path = /obj/item/stack/sticky_tape/super
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/pointy_tape
	name = "glup shitto"
	id = "pointy_tape"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1500, /datum/material/plastic = 1000)
	build_path = /obj/item/stack/sticky_tape/pointy
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/super_pointy_tape
	name = "glup shitto"
	id = "super_pointy_tape"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 3000, /datum/material/plastic = 2000)
	build_path = /obj/item/stack/sticky_tape/pointy/super
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/////////////////////////////////////////
////////////Tackle Gloves////////////////
/////////////////////////////////////////

/datum/design/tackle_dolphin
	name = "glup shitto"
	id = "tackle_dolphin"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 2500)
	build_path = /obj/item/clothing/gloves/tackler/dolphin
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/tackle_rocket
	name = "glup shitto"
	id = "tackle_rocket"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plasma = 1000, /datum/material/plastic = 2000)
	build_path = /obj/item/clothing/gloves/tackler/rocket
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY



/////////////////////////////////////////
/////////Restaurant Equipment////////////
/////////////////////////////////////////

/datum/design/holosign/restaurant
	name = "glup shitto"
	desc = "A holographic projector that creates seating designation for restaurants."
	id = "holosignrestaurant"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/holosign_creator/robot_seat/restaurant
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/holosign/bar
	name = "glup shitto"
	desc = "A holographic projector that creates seating designation for bars."
	id = "holosignbar"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/holosign_creator/robot_seat/bar
	category = list(
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/oven_tray
	name = "glup shitto"
	desc = "Gotta shove something in!"
	id = "oven_tray"
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 500)
	build_path = /obj/item/plate/oven_tray
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/////////////////////////////////////////
/////////Fishing Equipment///////////////
/////////////////////////////////////////

/datum/design/fishing_rod_tech
	name = "glup shitto"
	id = "fishing_rod_tech"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/uranium = 1000, /datum/material/plastic = 2000)
	build_path = /obj/item/fishing_rod/tech
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SERVICE
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/////////////////////////////////////////
/////////Coffeemaker Stuff///////////////
/////////////////////////////////////////

/datum/design/coffeepot
	name = "glup shitto"
	id = "coffeepot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = 500, /datum/material/plastic = 500)
	build_path = /obj/item/reagent_containers/cup/coffeepot
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/coffeepot_bluespace
	name = "glup shitto"
	id = "bluespace_coffeepot"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/plastic = 500, /datum/material/bluespace = 500)
	build_path = /obj/item/reagent_containers/cup/coffeepot/bluespace
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/coffee_cartridge
	name = "glup shitto"
	id = "coffee_cartridge"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/blank_coffee_cartridge
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE

/datum/design/syrup_bottle
	name = "glup shitto"
	id = "syrup_bottle"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/plastic = 1000)
	build_path = /obj/item/reagent_containers/cup/bottle/syrup_bottle
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_KITCHEN
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
