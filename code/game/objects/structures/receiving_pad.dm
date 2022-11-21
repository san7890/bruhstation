/// Structure used by the Healer Guardian in order to quickly teleport itself/others to a location.
/obj/structure/receiving_pad
	name = "bluespace receiving pad"
	icon = 'icons/turf/floors.dmi'
	desc = "A receiving zone for bluespace teleportations."
	icon_state = "light_on-8"
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	density = FALSE
	anchored = TRUE
	layer = ABOVE_OPEN_TURF_LAYER

/// Set our color to the color of the guardian that summoned us, when applicable.
/obj/structure/receiving_pad/proc/set_color(mob/living/basic/guardian/healer/stand)
	if(stand?.guardian_color)
		add_atom_colour(stand.guardian_color, FIXED_COLOUR_PRIORITY)

/// If the guardian sets up a new beacon/teleporter elsewhere, we gotta get rid of ourselves. Can only have one at a time!
/obj/structure/receiving_pad/proc/disappear()
	visible_message(span_notice("[src] vanishes!"))
	qdel(src)
