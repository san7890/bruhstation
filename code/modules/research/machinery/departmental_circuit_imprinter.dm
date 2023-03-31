/obj/machinery/rnd/production/circuit_imprinter/department
	name = "glup shitto"
	desc = "A special circuit imprinter with a built in interface meant for departmental usage, with built in ExoSync receivers allowing it to print designs researched that match its ROM-encoded department type."
	icon_state = "circuit_imprinter"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/department

/obj/machinery/rnd/production/circuit_imprinter/department/science
	name = "glup shitto"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/department/science
	allowed_department_flags = DEPARTMENT_BITFLAG_SCIENCE
	department_tag = "Science"
	payment_department = ACCOUNT_SCI
