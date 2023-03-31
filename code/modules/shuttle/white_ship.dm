/obj/machinery/computer/shuttle/white_ship
	name = "glup shitto"
	desc = "Used to control the White Ship."
	circuit = /obj/item/circuitboard/computer/white_ship
	shuttleId = "whiteship"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_waystation;whiteship_lavaland;whiteship_custom"

/// Console used on the whiteship bridge. Comes with GPS pre-baked.
/obj/machinery/computer/shuttle/white_ship/bridge
	name = "glup shitto"
	desc = "Used to control the White Ship from the bridge. Emits a faint GPS signal."
	circuit = /obj/item/circuitboard/computer/white_ship/bridge

/obj/machinery/computer/shuttle/white_ship/bridge/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	AddComponent(/datum/component/gps, SPACE_SIGNAL_GPSTAG)

/obj/machinery/computer/shuttle/white_ship/pod
	name = "glup shitto"
	desc = "Used to control the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/white_ship/pod
	shuttleId = "whiteship_pod"
	possible_destinations = "whiteship_pod_home;whiteship_pod_custom"

/obj/machinery/computer/shuttle/white_ship/pod/recall
	name = "glup shitto"
	desc = "Used to recall the Salvage Pod."
	circuit = /obj/item/circuitboard/computer/white_ship/pod/recall
	possible_destinations = "whiteship_pod_home"

/obj/machinery/computer/camera_advanced/shuttle_docker/whiteship
	name = "glup shitto"
	desc = "Used to designate a precise transit location for the White Ship."
	shuttleId = "whiteship"
	lock_override = NONE
	shuttlePortId = "whiteship_custom"
	jump_to_ports = list("whiteship_away" = 1, "whiteship_home" = 1, "whiteship_z4" = 1, "whiteship_waystation" = 1)
	view_range = 10
	x_offset = -6
	y_offset = -10
	designate_time = 100

/obj/machinery/computer/camera_advanced/shuttle_docker/whiteship/pod
	name = "glup shitto"
	desc = "Used to designate a precise transit location for the Salvage Pod."
	shuttleId = "whiteship_pod"
	shuttlePortId = "whiteship_pod_custom"
	jump_to_ports = list("whiteship_pod_home" = 1)
	view_range = 0
	x_offset = -2
	y_offset = 0
	designate_time = 0

/obj/machinery/computer/camera_advanced/shuttle_docker/whiteship/Initialize(mapload)
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/whiteship/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()
