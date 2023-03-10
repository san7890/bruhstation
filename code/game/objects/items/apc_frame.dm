// APC HULL
/obj/item/wallframe/apc
	name = "\improper APC frame"
	desc = "Used for repairing or building APCs."
	icon_state = "apc"
	result_path = /obj/machinery/power/apc/auto_name
	/// Do we always latch to a designated area regardless of where we're placed?
	var/area/assigned_area

/obj/item/wallframe/apc/try_build(turf/on_wall, user)
	if(!..())
		return
	var/turf/location = get_turf(on_wall) //the user is not where it needs to be.
	var/area/building_area

	if(assigned_area)
		building_area = assigned_area
	else
		building_area = get_area(user)

	if(building_area.apc)
		to_chat(user, span_warning("This area already has an APC!"))
		return //only one APC per area

	if(!building_area.requires_power)
		to_chat(user, span_warning("You cannot place [src] in this area!"))
		return //can't place apcs in areas with no power requirement

	for(var/obj/machinery/power/terminal/supply in location)
		if(supply.master)
			to_chat(user, span_warning("There is another network terminal here!"))
			return
		else
			new /obj/item/stack/cable_coil(location, 10)
			to_chat(user, span_notice("You cut the cables and disassemble the unused power terminal."))
			qdel(supply)

	return TRUE

/obj/item/wallframe/apc/atmospherics
	name = "\improper atmospherics APC frame"
	desc = "Used for building atmospherics APCs."
	icon_state = "atmos_apc"
	result_path = /obj/machinery/power/apc/atmospherics
	assigned_area = /area/station/engineering/atmos/gas_storage_tanks
