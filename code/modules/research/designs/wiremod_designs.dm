/datum/design/integrated_circuit
	name = "glup shitto"
	desc = "The foundation of all circuits. All Circuitry go onto this."
	id = "integrated_circuit"
	build_path = /obj/item/integrated_circuit
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_CATEGORY_CIRCUITRY_CORE
	)
	materials = list(/datum/material/glass = 1000, /datum/material/iron = 1000)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/circuit_multitool
	name = "glup shitto"
	desc = "A circuit multitool to mark entities and load them into."
	id = "circuit_multitool"
	build_path = /obj/item/multitool/circuit
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_CATEGORY_CIRCUITRY_CORE
	)
	materials = list(/datum/material/glass = 1000, /datum/material/iron = 1000)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/usb_cable
	name = "glup shitto"
	desc = "A cable that allows certain shells to connect to nearby computers and machines."
	id = "usb_cable"
	build_path = /obj/item/usb_cable
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_CATEGORY_CIRCUITRY_CORE
	)
	// Yes, it would make sense to make them take plastic, but then less people would make them, and I think they're cool
	materials = list(/datum/material/iron = 2500)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE

/datum/design/component
	name = "glup shitto"
	desc = "A component that goes into an integrated circuit."
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 1000)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_COMPONENTS
	)

/datum/design/component/New()
	. = ..()
	if(build_path)
		var/obj/item/circuit_component/component_path = build_path
		desc = initial(component_path.desc)

/datum/design/component/arithmetic
	name = "glup shitto"
	id = "comp_arithmetic"
	build_path = /obj/item/circuit_component/arithmetic

/datum/design/component/trigonometry
	name = "glup shitto"
	id = "comp_trigonometry"
	build_path = /obj/item/circuit_component/trigonometry

/datum/design/component/clock
	name = "glup shitto"
	id = "comp_clock"
	build_path = /obj/item/circuit_component/clock

/datum/design/component/comparison
	name = "glup shitto"
	id = "comp_comparison"
	build_path = /obj/item/circuit_component/compare/comparison

/datum/design/component/logic
	name = "glup shitto"
	id = "comp_logic"
	build_path = /obj/item/circuit_component/compare/logic

/datum/design/component/delay
	name = "glup shitto"
	id = "comp_delay"
	build_path = /obj/item/circuit_component/delay

/datum/design/component/format
	name = "glup shitto"
	id = "comp_format"
	build_path = /obj/item/circuit_component/format

/datum/design/component/format_assoc
	name = "glup shitto"
	id = "comp_format_assoc"
	build_path = /obj/item/circuit_component/format/assoc

/datum/design/component/index
	name = "glup shitto"
	id = "comp_index"
	build_path = /obj/item/circuit_component/index

/datum/design/component/index_assoc
	name = "glup shitto"
	id = "comp_index_assoc"
	build_path = /obj/item/circuit_component/index/assoc_string

/datum/design/component/length
	name = "glup shitto"
	id = "comp_length"
	build_path = /obj/item/circuit_component/length

/datum/design/component/light
	name = "glup shitto"
	id = "comp_light"
	build_path = /obj/item/circuit_component/light

/datum/design/component/not
	name = "glup shitto"
	id = "comp_not"
	build_path = /obj/item/circuit_component/not

/datum/design/component/random
	name = "glup shitto"
	id = "comp_random"
	build_path = /obj/item/circuit_component/random

/datum/design/component/binary_conversion
	name = "glup shitto"
	id = "comp_binary_convert"
	build_path = /obj/item/circuit_component/binary_conversion

/datum/design/component/decimal_conversion
	name = "glup shitto"
	id = "comp_decimal_convert"
	build_path = /obj/item/circuit_component/decimal_conversion

/datum/design/component/species
	name = "glup shitto"
	id = "comp_species"
	build_path = /obj/item/circuit_component/species

/datum/design/component/speech
	name = "glup shitto"
	id = "comp_speech"
	build_path = /obj/item/circuit_component/speech

/datum/design/component/laserpointer
	name = "glup shitto"
	id = "comp_laserpointer"
	build_path = /obj/item/circuit_component/laserpointer

/datum/design/component/timepiece
	name = "glup shitto"
	id = "comp_timepiece"
	build_path = /obj/item/circuit_component/timepiece

/datum/design/component/tostring
	name = "glup shitto"
	id = "comp_tostring"
	build_path = /obj/item/circuit_component/tostring

/datum/design/component/tonumber
	name = "glup shitto"
	id = "comp_tonumber"
	build_path = /obj/item/circuit_component/tonumber

/datum/design/component/typecheck
	name = "glup shitto"
	id = "comp_typecheck"
	build_path = /obj/item/circuit_component/compare/typecheck

/datum/design/component/concat
	name = "glup shitto"
	id = "comp_concat"
	build_path = /obj/item/circuit_component/concat

/datum/design/component/textcase
	name = "glup shitto"
	id = "comp_textcase"
	build_path = /obj/item/circuit_component/textcase

/datum/design/component/hear
	name = "glup shitto"
	id = "comp_hear"
	build_path = /obj/item/circuit_component/hear

/datum/design/component/contains
	name = "glup shitto"
	id = "comp_string_contains"
	build_path = /obj/item/circuit_component/compare/contains

/datum/design/component/self
	name = "glup shitto"
	id = "comp_self"
	build_path = /obj/item/circuit_component/self

/datum/design/component/radio
	name = "glup shitto"
	id = "comp_radio"
	build_path = /obj/item/circuit_component/radio

/datum/design/component/gps
	name = "glup shitto"
	id = "comp_gps"
	build_path = /obj/item/circuit_component/gps

/datum/design/component/direction
	name = "glup shitto"
	id = "comp_direction"
	build_path = /obj/item/circuit_component/direction

/datum/design/component/reagentscanner
	name = "glup shitto"
	id = "comp_reagents"
	build_path = /obj/item/circuit_component/reagentscanner

/datum/design/component/health
	name = "glup shitto"
	id = "comp_health"
	build_path = /obj/item/circuit_component/health

/datum/design/component/matscanner
	name = "glup shitto"
	id = "comp_matscanner"
	build_path = /obj/item/circuit_component/matscanner

/datum/design/component/split
	name = "glup shitto"
	id = "comp_split"
	build_path = /obj/item/circuit_component/split

/datum/design/component/pull
	name = "glup shitto"
	id = "comp_pull"
	build_path = /obj/item/circuit_component/pull

/datum/design/component/soundemitter
	name = "glup shitto"
	id = "comp_soundemitter"
	build_path = /obj/item/circuit_component/soundemitter

/datum/design/component/mmi
	name = "glup shitto"
	id = "comp_mmi"
	build_path = /obj/item/circuit_component/mmi

/datum/design/component/router
	name = "glup shitto"
	id = "comp_router"
	build_path = /obj/item/circuit_component/router

/datum/design/component/multiplexer
	name = "glup shitto"
	id = "comp_multiplexer"
	build_path = /obj/item/circuit_component/router/multiplexer

/datum/design/component/get_column
	name = "glup shitto"
	id = "comp_get_column"
	build_path = /obj/item/circuit_component/get_column

/datum/design/component/index_table
	name = "glup shitto"
	id = "comp_index_table"
	build_path = /obj/item/circuit_component/index_table

/datum/design/component/concat_list
	name = "glup shitto"
	id = "comp_concat_list"
	build_path = /obj/item/circuit_component/concat_list

/datum/design/component/list_add
	name = "glup shitto"
	id = "comp_list_add"
	build_path = /obj/item/circuit_component/variable/list/listadd

/datum/design/component/list_remove
	name = "glup shitto"
	id = "comp_list_remove"
	build_path = /obj/item/circuit_component/variable/list/listremove

/datum/design/component/list_clear
	name = "glup shitto"
	id = "comp_list_clear"
	build_path = /obj/item/circuit_component/variable/list/listclear

/datum/design/component/element_find
	name = "glup shitto"
	id = "comp_element_find"
	build_path = /obj/item/circuit_component/listin

/datum/design/component/select_query
	name = "glup shitto"
	id = "comp_select_query"
	build_path = /obj/item/circuit_component/select

/datum/design/component/pathfind
	name = "glup shitto"
	id = "comp_pathfind"
	build_path = /obj/item/circuit_component/pathfind

/datum/design/component/tempsensor
	name = "glup shitto"
	id = "comp_tempsensor"
	build_path = /obj/item/circuit_component/tempsensor

/datum/design/component/pressuresensor
	name = "glup shitto"
	id = "comp_pressuresensor"
	build_path = /obj/item/circuit_component/pressuresensor

/datum/design/component/module
	name = "glup shitto"
	id = "comp_module"
	build_path = /obj/item/circuit_component/module

/datum/design/component/ntnet_receive
	name = "glup shitto"
	id = "comp_ntnet_receive"
	build_path = /obj/item/circuit_component/ntnet_receive

/datum/design/component/ntnet_send
	name = "glup shitto"
	id = "comp_ntnet_send"
	build_path = /obj/item/circuit_component/ntnet_send

/datum/design/component/list_literal
	name = "glup shitto"
	id = "comp_list_literal"
	build_path = /obj/item/circuit_component/list_literal

/datum/design/component/list_assoc_literal
	name = "glup shitto"
	id = "comp_list_assoc_literal"
	build_path = /obj/item/circuit_component/assoc_literal

/datum/design/component/typecast
	name = "glup shitto"
	id = "comp_typecast"
	build_path = /obj/item/circuit_component/typecast

/datum/design/component/pinpointer
	name = "glup shitto"
	id = "comp_pinpointer"
	build_path = /obj/item/circuit_component/pinpointer

/datum/design/component/bci
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_BCI_COMPONENTS
	)

/datum/design/component/bci/bci_action
	name = "glup shitto"
	id = "comp_bci_action"
	build_path = /obj/item/circuit_component/equipment_action/bci

/datum/design/component/bci/object_overlay
	name = "glup shitto"
	id = "comp_object_overlay"
	build_path = /obj/item/circuit_component/object_overlay

/datum/design/component/bci/bar_overlay
	name = "glup shitto"
	id = "comp_bar_overlay"
	build_path = /obj/item/circuit_component/object_overlay/bar

/datum/design/component/bci/vox
	name = "glup shitto"
	id = "comp_vox"
	build_path = /obj/item/circuit_component/vox

/datum/design/component/bci/thought_listener
	name = "glup shitto"
	id = "comp_thought_listener"
	build_path = /obj/item/circuit_component/thought_listener

/datum/design/component/bci/target_intercept
	name = "glup shitto"
	id = "comp_target_intercept"
	build_path = /obj/item/circuit_component/target_intercept

/datum/design/component/bci/counter_overlay
	name = "glup shitto"
	id = "comp_counter_overlay"
	build_path = /obj/item/circuit_component/counter_overlay

/datum/design/component/bci/reagent_injector
	name = "glup shitto"
	id = "comp_reagent_injector"
	build_path = /obj/item/circuit_component/reagent_injector

/datum/design/component/bci/install_detector
	name = "glup shitto"
	id = "comp_install_detector"
	build_path = /obj/item/circuit_component/install_detector

/datum/design/component/foreach
	name = "glup shitto"
	id = "comp_foreach"
	build_path = /obj/item/circuit_component/foreach

/datum/design/component/filter_list
	name = "glup shitto"
	id = "comp_filter_list"
	build_path = /obj/item/circuit_component/filter_list

/datum/design/component/mod_action
	name = "glup shitto"
	id = "comp_mod_action"
	build_path = /obj/item/circuit_component/equipment_action/mod

/datum/design/component/id_getter
	name = "glup shitto"
	id = "comp_id_getter"
	build_path = /obj/item/circuit_component/id_getter

/datum/design/component/id_info_reader
	name = "glup shitto"
	id = "comp_id_info_reader"
	build_path = /obj/item/circuit_component/id_info_reader

/datum/design/component/id_access_reader
	name = "glup shitto"
	id = "comp_id_access_reader"
	build_path = /obj/item/circuit_component/id_access_reader

/datum/design/component/setter_trigger
	name = "glup shitto"
	id = "comp_set_variable_trigger"
	build_path = /obj/item/circuit_component/variable/setter/trigger

/datum/design/component/view_sensor
	name = "glup shitto"
	id = "comp_view_sensor"
	build_path = /obj/item/circuit_component/view_sensor

/datum/design/component/access_checker
	name = "glup shitto"
	id = "comp_access_checker"
	build_path = /obj/item/circuit_component/compare/access

/datum/design/component/list_pick
	name = "glup shitto"
	id = "comp_list_pick"
	build_path = /obj/item/circuit_component/list_pick

/datum/design/component/list_pick_assoc
	name = "glup shitto"
	id = "comp_assoc_list_pick"
	build_path = /obj/item/circuit_component/list_pick/assoc

/datum/design/compact_remote_shell
	name = "glup shitto"
	desc = "A handheld shell with one big button."
	id = "compact_remote_shell"
	build_path = /obj/item/compact_remote
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 5000)
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/controller_shell
	name = "glup shitto"
	desc = "A handheld shell with several buttons."
	id = "controller_shell"
	build_path = /obj/item/controller
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 7000)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/scanner_shell
	name = "glup shitto"
	desc = "A handheld scanner shell that can scan entities."
	id = "scanner_shell"
	build_path = /obj/item/wiremod_scanner
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 7000)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/keyboard_shell
	name = "glup shitto"
	desc = "A handheld shell that allows the user to input a string"
	id = "keyboard_shell"
	build_path = /obj/item/keyboard_shell
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 10000)
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/gun_shell
	name = "glup shitto"
	desc = "A handheld shell that can fire projectiles to output entities."
	id = "gun_shell"
	build_path = /obj/item/gun/energy/wiremod_gun
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 10000, /datum/material/plasma = 100)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/bot_shell
	name = "glup shitto"
	desc = "An immobile shell that can store more components. Has a USB port to be able to connect to computers and machines."
	id = "bot_shell"
	build_path = /obj/item/shell/bot
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 10000)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/money_bot_shell
	name = "glup shitto"
	desc = "An immobile shell that is similar to a regular bot shell, but accepts monetary inputs and can also dispense money."
	id = "money_bot_shell"
	build_path = /obj/item/shell/money_bot
	build_type = COMPONENT_PRINTER
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 10000, /datum/material/gold = 50)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/drone_shell
	name = "glup shitto"
	desc = "A shell with the ability to move itself around."
	id = "drone_shell"
	build_path = /obj/item/shell/drone
	build_type = COMPONENT_PRINTER
	materials = list(
		/datum/material/glass = 2000,
		/datum/material/iron = 11000,
		/datum/material/gold = 500,
	)
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/server_shell
	name = "glup shitto"
	desc = "A very large shell that cannot be moved around. Stores the most components."
	id = "server_shell"
	materials = list(
		/datum/material/glass = 5000,
		/datum/material/iron = 15000,
		/datum/material/gold = 1500,
	)
	build_path = /obj/item/shell/server
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/airlock_shell
	name = "glup shitto"
	desc = "A door shell that cannot be moved around when assembled."
	id = "door_shell"
	materials = list(
		/datum/material/glass = 5000,
		/datum/material/iron = 15000,
	)
	build_path = /obj/item/shell/airlock
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/dispenser_shell
	name = "glup shitto"
	desc = "A dispenser shell that can dispense items."
	id = "dispenser_shell"
	materials = list(
		/datum/material/glass = 5000,
		/datum/material/iron = 15000,
	)
	build_path = /obj/item/shell/dispenser
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/bci_shell
	name = "glup shitto"
	desc = "An implant that can be placed in a user's head to control circuits using their brain."
	id = "bci_shell"
	materials = list(
		/datum/material/glass = 2000,
		/datum/material/iron = 8000,
	)
	build_path = /obj/item/shell/bci
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/scanner_gate_shell
	name = "glup shitto"
	desc = "A scanner gate shell that performs mid-depth scans on people when they pass through it."
	id = "scanner_gate_shell"
	materials = list(
		/datum/material/glass = 4000,
		/datum/material/iron = 12000,
	)
	build_path = /obj/item/shell/scanner_gate
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/board/bci_implanter
	name = "glup shitto"
	desc = "A machine that, when given a brain-computer interface, will implant it into an occupant. Otherwise, will remove any brain-computer interfaces they already have."
	id = "bci_implanter"
	build_path = /obj/item/circuitboard/machine/bci_implanter
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_CATEGORY_CIRCUITRY_CORE
	)

/datum/design/assembly_shell
	name = "glup shitto"
	desc = "An assembly shell that can be attached to wires and other assemblies."
	id = "assembly_shell"
	materials = list(/datum/material/glass = 2000, /datum/material/iron = 5000)
	build_path = /obj/item/assembly/wiremod
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)

/datum/design/mod_module_shell
	name = "glup shitto"
	desc = "A module shell that allows a circuit to be inserted into, and interface with, a MODsuit."
	id = "module_shell"
	materials = list(/datum/material/glass = 2000)
	build_path = /obj/item/mod/module/circuit
	build_type = COMPONENT_PRINTER
	category = list(
		RND_CATEGORY_CIRCUITRY + RND_SUBCATEGORY_CIRCUITRY_SHELLS
	)
