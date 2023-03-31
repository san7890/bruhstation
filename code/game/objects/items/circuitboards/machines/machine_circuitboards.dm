//Command

/obj/item/circuitboard/machine/bsa/back
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/bsa/back //No freebies!
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/capacitor/tier4 = 5,
		/obj/item/stack/cable_coil = 2)

/obj/item/circuitboard/machine/bsa/front
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/bsa/front
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/manipulator/tier4 = 5,
		/obj/item/stack/cable_coil = 2)

/obj/item/circuitboard/machine/bsa/middle
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/bsa/middle
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 20,
		/obj/item/stack/cable_coil = 2)

/obj/item/circuitboard/machine/dna_vault
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/dna_vault //No freebies!
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/capacitor/tier3 = 5,
		/datum/stock_part/manipulator/tier3 = 5,
		/obj/item/stack/cable_coil = 2)

//Engineering

/obj/item/circuitboard/machine/announcement_system
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/announcement_system
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/suit_storage_unit
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/suit_storage_unit
	req_components = list(
		/obj/item/stack/sheet/glass = 2,
		/obj/item/stack/cable_coil = 5,
		/datum/stock_part/capacitor = 1)

/obj/item/circuitboard/machine/autolathe
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/autolathe
	req_components = list(
		/datum/stock_part/matter_bin = 3,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/grounding_rod
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/energy_accumulator/grounding_rod
	req_components = list(/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE


/obj/item/circuitboard/machine/telecomms/broadcaster
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/broadcaster
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 1,
		/datum/stock_part/filter = 1,
		/datum/stock_part/crystal = 1,
		/datum/stock_part/micro_laser = 2)

/obj/item/circuitboard/machine/telecomms/bus
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/bus
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 1,
		/datum/stock_part/filter = 1)

/obj/item/circuitboard/machine/telecomms/hub
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/hub
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/filter = 2)

/obj/item/circuitboard/machine/telecomms/message_server
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/message_server
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 1,
		/datum/stock_part/filter = 3)

/obj/item/circuitboard/machine/telecomms/processor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/processor
	req_components = list(
		/datum/stock_part/manipulator = 3,
		/datum/stock_part/filter = 1,
		/datum/stock_part/treatment = 2,
		/datum/stock_part/analyzer = 1,
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/amplifier = 1)

/obj/item/circuitboard/machine/telecomms/receiver
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/receiver
	req_components = list(
		/datum/stock_part/ansible = 1,
		/datum/stock_part/filter = 1,
		/datum/stock_part/manipulator = 2,
		/datum/stock_part/micro_laser = 1)

/obj/item/circuitboard/machine/telecomms/relay
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/relay
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/filter = 2)

/obj/item/circuitboard/machine/telecomms/server
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/telecomms/server
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/obj/item/stack/cable_coil = 1,
		/datum/stock_part/filter = 1)

/obj/item/circuitboard/machine/tesla_coil
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	desc = "Does not let you shoot lightning from your hands."
	build_path = /obj/machinery/power/energy_accumulator/tesla_coil
	req_components = list(/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/cell_charger
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/cell_charger
	req_components = list(/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/circulator
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/binary/circulator
	req_components = list()

/obj/item/circuitboard/machine/emitter
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/emitter
	req_components = list(
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/generator
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/generator
	req_components = list()

/obj/item/circuitboard/machine/ntnet_relay
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/ntnet_relay
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/filter = 1)

/obj/item/circuitboard/machine/pacman
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/port_gen/pacman
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/sheet/iron = 5
	)
	needs_anchored = FALSE
	var/high_production_profile = FALSE

/obj/item/circuitboard/machine/pacman/examine(mob/user)
	. = ..()
	var/message = high_production_profile ? "high-power uranium mode" : "medium-power plasma mode"
	. += span_notice("It's set to [message].")
	. += span_notice("You can switch the mode by using a screwdriver on [src].")

/obj/item/circuitboard/machine/pacman/screwdriver_act(mob/living/user, obj/item/tool)
	high_production_profile = !high_production_profile
	var/message = high_production_profile ? "high-power uranium mode" : "medium-power plasma mode"
	to_chat(user, span_notice("You set the board for [message]"))

/obj/item/circuitboard/machine/turbine_compressor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/turbine/inlet_compressor/constructed
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/sheet/iron = 5)

/obj/item/circuitboard/machine/turbine_rotor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/turbine/core_rotor/constructed
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/sheet/iron = 5)

/obj/item/circuitboard/machine/turbine_stator
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/turbine/turbine_outlet/constructed
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/sheet/iron = 5)

/obj/item/circuitboard/machine/protolathe/department/engineering
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/rnd/production/protolathe/department/engineering

/obj/item/circuitboard/machine/protolathe/department/engineering/no_tax
	build_path = /obj/machinery/rnd/production/protolathe/department/engineering/no_tax

/obj/item/circuitboard/machine/rtg
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/rtg
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/datum/stock_part/capacitor = 1,
		/obj/item/stack/sheet/mineral/uranium = 10) // We have no Pu-238, and this is the closest thing to it.

/obj/item/circuitboard/machine/rtg/advanced
	name = "glup shitto"
	build_path = /obj/machinery/power/rtg/advanced
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/sheet/mineral/uranium = 10,
		/obj/item/stack/sheet/mineral/plasma = 5)

/obj/item/circuitboard/machine/scanner_gate
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/scanner_gate
	req_components = list(
		/datum/stock_part/scanning_module = 3)

/obj/item/circuitboard/machine/smes
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/smes
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stock_parts/cell = 5,
		/datum/stock_part/capacitor = 1)
	def_components = list(/obj/item/stock_parts/cell = /obj/item/stock_parts/cell/high/empty)

/obj/item/circuitboard/machine/techfab/department/engineering
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/rnd/production/techfab/department/engineering

/obj/item/circuitboard/machine/thermomachine
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/thermomachine/freezer
	var/pipe_layer = PIPING_LAYER_DEFAULT
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/micro_laser = 2,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/thermomachine/multitool_act(mob/living/user, obj/item/multitool/multitool)
	. = ..()
	pipe_layer = (pipe_layer >= PIPING_LAYER_MAX) ? PIPING_LAYER_MIN : (pipe_layer + 1)
	to_chat(user, span_notice("You change the circuitboard to layer [pipe_layer]."))

/obj/item/circuitboard/machine/thermomachine/examine()
	. = ..()
	. += span_notice("It is set to layer [pipe_layer].")

/obj/item/circuitboard/machine/HFR_fuel_input
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/hypertorus/fuel_input
	req_components = list(
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/HFR_waste_output
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/hypertorus/waste_output
	req_components = list(
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/HFR_moderator_input
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/hypertorus/moderator_input
	req_components = list(
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/HFR_core
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/hypertorus/core
	req_components = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/sheet/plasteel = 10)

/obj/item/circuitboard/machine/HFR_corner
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/hypertorus/corner
	req_components = list(
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/HFR_interface
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/hypertorus/interface
	req_components = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/crystallizer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/binary/crystallizer
	req_components = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/sheet/plasteel = 5)

/obj/item/circuitboard/machine/bluespace_sender
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/atmospherics/components/unary/bluespace_sender
	req_components = list(
		/obj/item/stack/cable_coil = 10,
		/obj/item/stack/sheet/glass = 10,
		/obj/item/stack/sheet/plasteel = 5)

//Generic
/obj/item/circuitboard/machine/component_printer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/component_printer
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 2,
	)

/obj/item/circuitboard/machine/module_duplicator
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/module_duplicator
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 2,
	)

/obj/item/circuitboard/machine/circuit_imprinter
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/rnd/production/circuit_imprinter
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/reagent_containers/cup/beaker = 2)

/obj/item/circuitboard/machine/circuit_imprinter/offstation
	name = "glup shitto"
	build_path = /obj/machinery/rnd/production/circuit_imprinter/offstation

/obj/item/circuitboard/machine/circuit_imprinter/department
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/rnd/production/circuit_imprinter/department

/obj/item/circuitboard/machine/holopad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/holopad
	req_components = list(/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE //wew lad
	var/secure = FALSE

/obj/item/circuitboard/machine/holopad/multitool_act(mob/living/user, obj/item/tool)
	if(secure)
		build_path = /obj/machinery/holopad
		secure = FALSE
	else
		build_path = /obj/machinery/holopad/secure
		secure = TRUE
	to_chat(user, span_notice("You [secure? "en" : "dis"]able the security on [src]"))
	return TRUE

/obj/item/circuitboard/machine/holopad/examine(mob/user)
	. = ..()
	. += "There is a connection port on this board that could be <b>pulsed</b>"
	if(secure)
		. += "There is a red light flashing next to the word \"secure\""

/obj/item/circuitboard/machine/launchpad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/launchpad
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 1,
		/datum/stock_part/manipulator = 1)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)

/obj/item/circuitboard/machine/protolathe
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/rnd/production/protolathe
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 2,
		/obj/item/reagent_containers/cup/beaker = 2)

/obj/item/circuitboard/machine/protolathe/offstation
	name = "glup shitto"
	build_path = /obj/machinery/rnd/production/protolathe/offstation

/obj/item/circuitboard/machine/protolathe/department
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/rnd/production/protolathe/department

/obj/item/circuitboard/machine/reagentgrinder
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/reagentgrinder/constructed
	req_components = list(
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/smartfridge
	name = "glup shitto"
	build_path = /obj/machinery/smartfridge
	req_components = list(/datum/stock_part/matter_bin = 1)
	var/static/list/fridges_name_paths = list(/obj/machinery/smartfridge = "plant produce",
		/obj/machinery/smartfridge/food = "food",
		/obj/machinery/smartfridge/drinks = "drinks",
		/obj/machinery/smartfridge/extract = "slimes",
		/obj/machinery/smartfridge/petri = "petri",
		/obj/machinery/smartfridge/organ = "organs",
		/obj/machinery/smartfridge/chemistry = "chems",
		/obj/machinery/smartfridge/chemistry/virology = "viruses",
		/obj/machinery/smartfridge/disks = "disks")
	needs_anchored = FALSE
	var/is_special_type = FALSE

/obj/item/circuitboard/machine/smartfridge/apply_default_parts(obj/machinery/smartfridge/smartfridge)
	build_path = smartfridge.base_build_path
	if(!fridges_name_paths.Find(build_path, fridges_name_paths))
		name = "[initial(smartfridge.name)]" //if it's a unique type, give it a unique name.
		is_special_type = TRUE
	return ..()

/obj/item/circuitboard/machine/smartfridge/screwdriver_act(mob/living/user, obj/item/tool)
	if (is_special_type)
		return FALSE
	var/position = fridges_name_paths.Find(build_path, fridges_name_paths)
	position = (position == length(fridges_name_paths)) ? 1 : (position + 1)
	build_path = fridges_name_paths[position]
	to_chat(user, span_notice("You set the board to [fridges_name_paths[build_path]]."))
	return TRUE

/obj/item/circuitboard/machine/smartfridge/examine(mob/user)
	. = ..()
	if(is_special_type)
		return
	. += span_info("[src] is set to [fridges_name_paths[build_path]]. You can use a screwdriver to reconfigure it.")


/obj/item/circuitboard/machine/space_heater
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/space_heater/constructed
	req_components = list(
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/capacitor = 1,
		/obj/item/stack/cable_coil = 3)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/electrolyzer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/electrolyzer
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/datum/stock_part/capacitor = 2,
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/sheet/glass = 1)

	needs_anchored = FALSE


/obj/item/circuitboard/machine/techfab
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/rnd/production/techfab
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 2,
		/obj/item/reagent_containers/cup/beaker = 2)

/obj/item/circuitboard/machine/techfab/department
	name = "glup shitto"
	build_path = /obj/machinery/rnd/production/techfab/department

/obj/item/circuitboard/machine/vendor
	name = "glup shitto"
	desc = "You can turn the \"brand selection\" dial using a screwdriver."
	custom_premium_price = PAYCHECK_CREW * 1.5
	build_path = /obj/machinery/vending/custom
	req_components = list(/obj/item/vending_refill/custom = 1)

	var/static/list/vending_names_paths = list(
		/obj/machinery/vending/boozeomat = "Booze-O-Mat",
		/obj/machinery/vending/coffee = "Solar's Best Hot Drinks",
		/obj/machinery/vending/snack = "Getmore Chocolate Corp",
		/obj/machinery/vending/cola = "Robust Softdrinks",
		/obj/machinery/vending/cigarette = "ShadyCigs Deluxe",
		/obj/machinery/vending/games = "\improper Good Clean Fun",
		/obj/machinery/vending/autodrobe = "AutoDrobe",
		/obj/machinery/vending/wardrobe/sec_wardrobe = "SecDrobe",
		/obj/machinery/vending/wardrobe/det_wardrobe = "DetDrobe",
		/obj/machinery/vending/wardrobe/medi_wardrobe = "MediDrobe",
		/obj/machinery/vending/wardrobe/engi_wardrobe = "EngiDrobe",
		/obj/machinery/vending/wardrobe/atmos_wardrobe = "AtmosDrobe",
		/obj/machinery/vending/wardrobe/cargo_wardrobe = "CargoDrobe",
		/obj/machinery/vending/wardrobe/robo_wardrobe = "RoboDrobe",
		/obj/machinery/vending/wardrobe/science_wardrobe = "SciDrobe",
		/obj/machinery/vending/wardrobe/hydro_wardrobe = "HyDrobe",
		/obj/machinery/vending/wardrobe/curator_wardrobe = "CuraDrobe",
		/obj/machinery/vending/wardrobe/bar_wardrobe = "BarDrobe",
		/obj/machinery/vending/wardrobe/chef_wardrobe = "ChefDrobe",
		/obj/machinery/vending/wardrobe/jani_wardrobe = "JaniDrobe",
		/obj/machinery/vending/wardrobe/law_wardrobe = "LawDrobe",
		/obj/machinery/vending/wardrobe/chap_wardrobe = "ChapDrobe",
		/obj/machinery/vending/wardrobe/chem_wardrobe = "ChemDrobe",
		/obj/machinery/vending/wardrobe/gene_wardrobe = "GeneDrobe",
		/obj/machinery/vending/wardrobe/viro_wardrobe = "ViroDrobe",
		/obj/machinery/vending/clothing = "ClothesMate",
		/obj/machinery/vending/medical = "NanoMed Plus",
		/obj/machinery/vending/drugs = "NanoDrug Plus",
		/obj/machinery/vending/wallmed = "NanoMed",
		/obj/machinery/vending/assist = "Part-Mart",
		/obj/machinery/vending/engivend = "Engi-Vend",
		/obj/machinery/vending/hydronutrients = "NutriMax",
		/obj/machinery/vending/hydroseeds = "MegaSeed Servitor",
		/obj/machinery/vending/sustenance = "Sustenance Vendor",
		/obj/machinery/vending/dinnerware = "Plasteel Chef's Dinnerware Vendor",
		/obj/machinery/vending/cart = "PTech",
		/obj/machinery/vending/robotics = "Robotech Deluxe",
		/obj/machinery/vending/engineering = "Robco Tool Maker",
		/obj/machinery/vending/sovietsoda = "BODA",
		/obj/machinery/vending/security = "SecTech",
		/obj/machinery/vending/modularpc = "Deluxe Silicate Selections",
		/obj/machinery/vending/tool = "YouTool",
		/obj/machinery/vending/custom = "Custom Vendor")

/obj/item/circuitboard/machine/vendor/screwdriver_act(mob/living/user, obj/item/tool)
	var/static/list/display_vending_names_paths
	if(!display_vending_names_paths)
		display_vending_names_paths = list()
		for(var/path in vending_names_paths)
			display_vending_names_paths[vending_names_paths[path]] = path
	var/choice = tgui_input_list(user, "Choose a new brand", "Select an Item", sort_list(display_vending_names_paths))
	if(isnull(choice))
		return
	if(isnull(display_vending_names_paths[choice]))
		return
	set_type(display_vending_names_paths[choice])
	return TRUE

/obj/item/circuitboard/machine/vendor/proc/set_type(obj/machinery/vending/typepath)
	build_path = typepath
	name = "glup shitto"
	req_components = list(initial(typepath.refill_canister) = 1)

/obj/item/circuitboard/machine/vendor/apply_default_parts(obj/machinery/machine)
	for(var/typepath in vending_names_paths)
		if(istype(machine, typepath))
			set_type(typepath)
			break
	return ..()

/obj/item/circuitboard/machine/vending/donksofttoyvendor
	name = "glup shitto"
	build_path = /obj/machinery/vending/donksofttoyvendor
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/vending_refill/donksoft = 1)

/obj/item/circuitboard/machine/vending/syndicatedonksofttoyvendor
	name = "glup shitto"
	build_path = /obj/machinery/vending/toyliberationstation
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/vending_refill/donksoft = 1)

/obj/item/circuitboard/machine/bountypad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/piratepad/civilian
	req_components = list(
		/datum/stock_part/card_reader = 1,
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/micro_laser = 1
	)

/obj/item/circuitboard/machine/fax
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/fax
	req_components = list(
		/datum/stock_part/crystal = 1,
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/manipulator = 1,)

//Medical

/obj/item/circuitboard/machine/chem_dispenser
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/chem_dispenser
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell = 1)
	def_components = list(/obj/item/stock_parts/cell = /obj/item/stock_parts/cell/high)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/chem_dispenser/fullupgrade
	build_path = /obj/machinery/chem_dispenser/fullupgrade
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 2,
		/datum/stock_part/capacitor/tier4 = 2,
		/datum/stock_part/manipulator/tier4 = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell/bluespace = 1,
	)

/obj/item/circuitboard/machine/chem_dispenser/mutagensaltpeter
	build_path = /obj/machinery/chem_dispenser/mutagensaltpeter
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 2,
		/datum/stock_part/capacitor/tier4 = 2,
		/datum/stock_part/manipulator/tier4 = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell/bluespace = 1,
	)

/obj/item/circuitboard/machine/chem_dispenser/abductor
	name = "glup shitto"
	name_extension = "(Abductor Machine Board)"
	icon_state = "abductor_mod"
	build_path = /obj/machinery/chem_dispenser/abductor
	specific_parts = TRUE
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 2,
		/datum/stock_part/capacitor/tier4 = 2,
		/datum/stock_part/manipulator/tier4 = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell/bluespace = 1,
	)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/chem_heater
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/chem_heater
	req_components = list(
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/chem_mass_spec
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/chem_mass_spec
	req_components = list(
	/datum/stock_part/micro_laser = 1,
	/obj/item/stack/cable_coil = 5)

/obj/item/circuitboard/machine/chem_master
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/chem_master
	desc = "You can turn the \"mode selection\" dial using a screwdriver."
	req_components = list(
		/obj/item/reagent_containers/cup/beaker = 2,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/sheet/glass = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/chem_master/screwdriver_act(mob/living/user, obj/item/tool)
	var/new_name = "ChemMaster"
	var/new_path = /obj/machinery/chem_master

	if(build_path == /obj/machinery/chem_master)
		new_name = "CondiMaster"
		new_path = /obj/machinery/chem_master/condimaster

	build_path = new_path
	name = "glup shitto"
	to_chat(user, span_notice("You change the circuit board setting to \"[new_name]\"."))
	return TRUE

/obj/item/circuitboard/machine/cryo_tube
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/atmospherics/components/unary/cryo_cell
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 4)

/obj/item/circuitboard/machine/fat_sucker
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/fat_sucker
	req_components = list(/datum/stock_part/micro_laser = 1,
		/obj/item/kitchen/fork = 1)

/obj/item/circuitboard/machine/harvester
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/harvester
	req_components = list(/datum/stock_part/micro_laser = 4)

/obj/item/circuitboard/machine/medical_kiosk
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/medical_kiosk
	var/custom_cost = 10
	req_components = list(
		/obj/item/healthanalyzer = 1,
		/datum/stock_part/scanning_module = 1)

/obj/item/circuitboard/machine/medical_kiosk/multitool_act(mob/living/user)
	. = ..()
	var/new_cost = tgui_input_number(user, "New cost for using this medical kiosk", "Pricing", custom_cost, 1000, 10)
	if(!new_cost || QDELETED(user) || QDELETED(src) || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return
	if(loc != user)
		to_chat(user, span_warning("You must hold the circuitboard to change its cost!"))
		return
	custom_cost = new_cost
	to_chat(user, span_notice("The cost is now set to [custom_cost]."))

/obj/item/circuitboard/machine/medical_kiosk/examine(mob/user)
	. = ..()
	. += "The cost to use this kiosk is set to [custom_cost]."

/obj/item/circuitboard/machine/limbgrower
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/limbgrower
	req_components = list(
		/datum/stock_part/manipulator = 1,
		/obj/item/reagent_containers/cup/beaker = 2,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/limbgrower/fullupgrade
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/limbgrower
	req_components = list(
		/datum/stock_part/manipulator/tier4  = 1,
		/obj/item/reagent_containers/cup/beaker/bluespace = 2,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/protolathe/department/medical
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/rnd/production/protolathe/department/medical

/obj/item/circuitboard/machine/sleeper
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/sleeper
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 2)

/obj/item/circuitboard/machine/sleeper/fullupgrade
	build_path = /obj/machinery/sleeper/syndie/fullupgrade
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 1,
		/datum/stock_part/manipulator/tier4 = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 2)

/obj/item/circuitboard/machine/sleeper/party
	name = "glup shitto"
	build_path = /obj/machinery/sleeper/party

/obj/item/circuitboard/machine/smoke_machine
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/smoke_machine
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/stasis
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/stasis
	req_components = list(
		/obj/item/stack/cable_coil = 3,
		/datum/stock_part/manipulator = 1,
		/datum/stock_part/capacitor = 1)

/obj/item/circuitboard/machine/medipen_refiller
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/medipen_refiller
	req_components = list(
		/datum/stock_part/matter_bin = 1)

/obj/item/circuitboard/machine/techfab/department/medical
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/rnd/production/techfab/department/medical

//Science

/obj/item/circuitboard/machine/circuit_imprinter/department/science
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/production/circuit_imprinter/department/science

/obj/item/circuitboard/machine/cyborgrecharger
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/recharge_station
	req_components = list(
		/datum/stock_part/capacitor = 2,
		/obj/item/stock_parts/cell = 1,
		/datum/stock_part/manipulator = 1)
	def_components = list(/obj/item/stock_parts/cell = /obj/item/stock_parts/cell/high)

/obj/item/circuitboard/machine/destructive_analyzer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/destructive_analyzer
	req_components = list(
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/manipulator = 1,
		/datum/stock_part/micro_laser = 1)

/obj/item/circuitboard/machine/experimentor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/experimentor
	req_components = list(
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/manipulator = 2,
		/datum/stock_part/micro_laser = 2)

/obj/item/circuitboard/machine/mech_recharger
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/mech_bay_recharge_port
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/capacitor = 5)

/obj/item/circuitboard/machine/mechfab
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/mecha_part_fabricator
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/monkey_recycler
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/monkey_recycler
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/processor/slime
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/processor/slime

/obj/item/circuitboard/machine/protolathe/department/science
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/production/protolathe/department/science

/obj/item/circuitboard/machine/quantumpad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/quantumpad
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 1,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/cable_coil = 1)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)

/obj/item/circuitboard/machine/rdserver
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/server
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/datum/stock_part/scanning_module = 1)

/obj/item/circuitboard/machine/techfab/department/science
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/rnd/production/techfab/department/science

/obj/item/circuitboard/machine/teleporter_hub
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/teleport/hub
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 3,
		/datum/stock_part/matter_bin = 1)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)

/obj/item/circuitboard/machine/teleporter_station
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/teleport/station
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 2,
		/datum/stock_part/capacitor = 2,
		/obj/item/stack/sheet/glass = 1)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)

/obj/item/circuitboard/machine/dnascanner
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/dna_scannernew
	req_components = list(
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stack/cable_coil = 2)


/obj/item/circuitboard/machine/dna_infuser
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/dna_infuser
	req_components = list(
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
	)

/obj/item/circuitboard/machine/mechpad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/mechpad
	req_components = list()

/obj/item/circuitboard/machine/botpad
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/botpad
	req_components = list()

//Security

/obj/item/circuitboard/machine/protolathe/department/security
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/rnd/production/protolathe/department/security

/obj/item/circuitboard/machine/recharger
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/recharger
	req_components = list(/datum/stock_part/capacitor = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/techfab/department/security
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/rnd/production/techfab/department/security

//Service

/obj/item/circuitboard/machine/biogenerator
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/biogenerator
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stack/sheet/glass = 1)

/obj/item/circuitboard/machine/chem_dispenser/drinks
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/chem_dispenser/drinks

/obj/item/circuitboard/machine/chem_dispenser/drinks/fullupgrade
	build_path = /obj/machinery/chem_dispenser/drinks/fullupgrade
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 2,
		/datum/stock_part/capacitor/tier4 = 2,
		/datum/stock_part/manipulator/tier4 = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell/bluespace = 1,
	)

/obj/item/circuitboard/machine/chem_dispenser/drinks/beer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/chem_dispenser/drinks/beer

/obj/item/circuitboard/machine/chem_dispenser/drinks/beer/fullupgrade
	build_path = /obj/machinery/chem_dispenser/drinks/beer/fullupgrade
	req_components = list(
		/datum/stock_part/matter_bin/tier4 = 2,
		/datum/stock_part/capacitor/tier4 = 2,
		/datum/stock_part/manipulator/tier4 = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/cell/bluespace = 1,
	)

/obj/item/circuitboard/machine/chem_master/condi
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/chem_master/condimaster

/obj/item/circuitboard/machine/deep_fryer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/deepfryer
	req_components = list(/datum/stock_part/micro_laser = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/griddle
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/griddle
	req_components = list(/datum/stock_part/micro_laser = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/oven
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/oven
	req_components = list(/datum/stock_part/micro_laser = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/dish_drive
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/dish_drive
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/datum/stock_part/manipulator = 1,
		/datum/stock_part/matter_bin = 2)
	var/suction = TRUE
	var/transmit = TRUE
	needs_anchored = FALSE

/obj/item/circuitboard/machine/dish_drive/examine(mob/user)
	. = ..()
	. += span_notice("Its suction function is [suction ? "enabled" : "disabled"]. Use it in-hand to switch.")
	. += span_notice("Its disposal auto-transmit function is [transmit ? "enabled" : "disabled"]. Alt-click it to switch.")

/obj/item/circuitboard/machine/dish_drive/attack_self(mob/living/user)
	suction = !suction
	to_chat(user, span_notice("You [suction ? "enable" : "disable"] the board's suction function."))

/obj/item/circuitboard/machine/dish_drive/AltClick(mob/living/user)
	if(!user.Adjacent(src))
		return
	transmit = !transmit
	to_chat(user, span_notice("You [transmit ? "enable" : "disable"] the board's automatic disposal transmission."))

/obj/item/circuitboard/machine/gibber
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/gibber
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/hydroponics
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/hydroponics/constructable
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/manipulator = 1,
		/obj/item/stack/sheet/glass = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/microwave
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/microwave
	req_components = list(
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/matter_bin = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stack/sheet/glass = 2)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/processor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/processor
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/processor/screwdriver_act(mob/living/user, obj/item/tool)
	if(build_path == /obj/machinery/processor)
		name = "Slime Processor"
		build_path = /obj/machinery/processor/slime
		to_chat(user, span_notice("Name protocols successfully updated."))
	else
		name = "Food Processor"
		build_path = /obj/machinery/processor
		to_chat(user, span_notice("Defaulting name protocols."))
	return TRUE

/obj/item/circuitboard/machine/protolathe/department/service
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/rnd/production/protolathe/department/service

/obj/item/circuitboard/machine/recycler
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/recycler
	req_components = list(
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/seed_extractor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/seed_extractor
	req_components = list(
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/techfab/department/service
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/rnd/production/techfab/department/service

/obj/item/circuitboard/machine/vendatray
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/structure/displaycase/forsale
	req_components = list(
		/datum/stock_part/card_reader = 1)

//Supply
/obj/item/circuitboard/machine/ore_redemption
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/mineral/ore_redemption
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/manipulator = 1,
		/obj/item/assembly/igniter = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/ore_silo
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/ore_silo
	req_components = list()

/obj/item/circuitboard/machine/protolathe/department/cargo
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/rnd/production/protolathe/department/cargo

/obj/item/circuitboard/machine/stacking_machine
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/mineral/stacking_machine
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/datum/stock_part/matter_bin = 2)

/obj/item/circuitboard/machine/stacking_unit_console
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/mineral/stacking_unit_console
	req_components = list(
		/obj/item/stack/sheet/glass = 2,
		/obj/item/stack/cable_coil = 5)

/obj/item/circuitboard/machine/techfab/department/cargo
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/rnd/production/techfab/department/cargo

/obj/item/circuitboard/machine/bepis
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/rnd/bepis
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/manipulator = 1,
		/datum/stock_part/micro_laser = 1,
		/datum/stock_part/scanning_module = 1)

//Misc
/obj/item/circuitboard/machine/sheetifier
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SUPPLY
	build_path = /obj/machinery/sheetifier
	req_components = list(
		/datum/stock_part/manipulator = 2,
		/datum/stock_part/matter_bin = 2)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/restaurant_portal
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/restaurant_portal
	needs_anchored = TRUE

/obj/item/circuitboard/machine/abductor
	name = "glup shitto"
	icon_state = "abductor_mod"

/obj/item/circuitboard/machine/abductor/core
	name = "glup shitto"
	name_extension = "(Void Core)"
	build_path = /obj/machinery/power/rtg/abductor
	req_components = list(
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/micro_laser = 1,
		/obj/item/stock_parts/cell/infinite/abductor = 1)
	def_components = list(
		/datum/stock_part/capacitor = /datum/stock_part/capacitor/tier4,
		/datum/stock_part/micro_laser = /datum/stock_part/micro_laser/tier4)

/obj/item/circuitboard/machine/hypnochair
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/hypnochair
	req_components = list(
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/scanning_module = 2
	)

/obj/item/circuitboard/machine/plumbing_receiver
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_MEDICAL
	build_path = /obj/machinery/plumbing/receiver
	req_components = list(
		/obj/item/stack/ore/bluespace_crystal = 1,
		/datum/stock_part/capacitor = 2,
		/obj/item/stack/sheet/glass = 1)
	def_components = list(/obj/item/stack/ore/bluespace_crystal = /obj/item/stack/ore/bluespace_crystal/artificial)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/skill_station
	name = "glup shitto"
	build_path = /obj/machinery/skill_station
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/scanning_module = 2
	)

/obj/item/circuitboard/machine/destructive_scanner
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/destructive_scanner
	req_components = list(
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/matter_bin = 1,
		/datum/stock_part/manipulator = 2)

/obj/item/circuitboard/machine/doppler_array
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/doppler_array
	req_components = list(
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/scanning_module = 4)

/obj/item/circuitboard/machine/exoscanner
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/exoscanner
	req_components = list(
		/datum/stock_part/micro_laser = 4,
		/datum/stock_part/scanning_module = 4)

/obj/item/circuitboard/machine/exodrone_launcher
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/exodrone_launcher
	req_components = list(
		/datum/stock_part/micro_laser = 4,
		/datum/stock_part/scanning_module = 4)

/obj/item/circuitboard/machine/ecto_sniffer
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/ecto_sniffer
	req_components = list(
		/datum/stock_part/scanning_module = 1)

/obj/item/circuitboard/machine/anomaly_refinery
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/research/anomaly_refinery
	req_components = list(
		/obj/item/stack/sheet/plasteel = 15,
		/datum/stock_part/scanning_module = 1,
		/datum/stock_part/manipulator = 1,
		)

/obj/item/circuitboard/machine/tank_compressor
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SCIENCE
	build_path = /obj/machinery/atmospherics/components/binary/tank_compressor
	req_components = list(
		/obj/item/stack/sheet/plasteel = 5,
		/datum/stock_part/scanning_module = 4,
		)

/obj/item/circuitboard/machine/coffeemaker
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/coffeemaker
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/reagent_containers/cup/beaker = 2,
		/datum/stock_part/water_recycler = 1,
		/datum/stock_part/capacitor = 1,
		/datum/stock_part/micro_laser = 1,
	)

/obj/item/circuitboard/machine/coffeemaker/impressa
	name = "glup shitto"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/coffeemaker/impressa
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/reagent_containers/cup/beaker = 2,
		/datum/stock_part/water_recycler = 1,
		/datum/stock_part/capacitor/tier2 = 1,
		/datum/stock_part/micro_laser/tier2 = 2,
	)
