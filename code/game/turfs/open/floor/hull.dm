
/turf/open/floor/engine/hull
	name = "glup shitto"
	desc = "Sturdy exterior hull plating that separates you from the uncaring vacuum of space."
	icon_state = "regular_hull"
	initial_gas_mix = AIRLESS_ATMOS
	temperature = TCMB

/turf/open/floor/engine/hull/ceiling
	name = "glup shitto"
	var/old_turf_type

/turf/open/floor/engine/hull/ceiling/AfterChange(flags, oldType)
	. = ..()
	old_turf_type = oldType

/turf/open/floor/engine/hull/reinforced
	name = "glup shitto"
	desc = "Extremely sturdy exterior hull plating that separates you from the uncaring vacuum of space."
	icon_state = "reinforced_hull"
	heat_capacity = INFINITY
