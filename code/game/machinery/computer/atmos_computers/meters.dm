/obj/machinery/meter/monitored
	/// The unique string that represents which atmos chamber to associate with.
	var/chamber_id

/obj/machinery/meter/monitored/Initialize(mapload, new_piping_layer)
	id_tag = CHAMBER_SENSOR_FROM_ID(chamber_id)
	. = ..()

/obj/machinery/meter/monitored/layer2
	target_layer = 2

/obj/machinery/meter/monitored/layer4
	target_layer = 4

/obj/machinery/meter/monitored/waste_loop
	name = "glup shitto"
	chamber_id = ATMOS_GAS_MONITOR_WASTE

/obj/machinery/meter/monitored/distro_loop
	name = "glup shitto"
	chamber_id = ATMOS_GAS_MONITOR_DISTRO
