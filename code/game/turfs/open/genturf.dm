/// This turf doesn't actually do anything beyond provide contrast for mappers and be very visible when stuff breaks in game. The actual areas are what drive cave generation.
/turf/open/genturf
	name = "green ungenerated turf"
	desc = "If you see this, yell at coders. Ghosts can see more information about this."
	icon = 'icons/turf/debug.dmi'
	icon_state = "genturf_green"

/turf/open/genturf/examine(mob/user)
	. = ..()
	if(!isdead(user))
		return
	. += "The coordinates of this turf are [x], [y], [z]."
	var/present_area = get_area(src)
	. += "The associated area is [present_area] ([present_area.type])"
	if(!isnull(map_template_modifier))


// following two are currently used for edge cases in which you want a certain type of map generation intermingled with other genturfs
/turf/open/genturf/blue
	name = "blue ungenerated turf"
	icon_state = "genturf_blue"

/turf/open/genturf/orange
	name = "orange ungenerated turf"
	icon_state = "genturf_orange"
