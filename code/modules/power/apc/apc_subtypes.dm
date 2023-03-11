/// A specialized APC meant to control the power for the gas storage tanks in atmospherics. Not for the actual room itself.
/obj/machinery/power/apc/atmospherics
	name = "atmospherics area power controller"
	desc = "A specialized control terminal for the electrical systems within all of the gas storage tanks."
	icon = 'icons/obj/atmospherics_apc.dmi' // different suite of icon_states
	area = /area/station/engineering/atmos/gas_storage_tanks // we do it like this so that we can just place it anywhere to have it work.

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/atmospherics, APC_PIXEL_OFFSET)

// No need to assign an area to this APC, it's already declared in our type- just got to add ourselves to to the area.
/obj/machinery/power/apc/atmospherics/assign_area(mapload)
	if(!isnull(area.apc) && mapload)
		var/message = "An Atmospherics APC already exists for [area] ([area.type])! [src] will not be assigned to it."
		stack_trace(message)
		log_mapping(message)
		return

	area.apc = src

/obj/machinery/power/apc/atmospherics/handle_board_insertion(mob/user, obj/item/electronics/apc/board)
	. = ..()
