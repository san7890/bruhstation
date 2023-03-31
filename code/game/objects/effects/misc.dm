//The effect when you wrap a dead body in gift wrap
/obj/effect/spresent
	name = "glup shitto"
	desc = "It's a ... present?"
	icon = 'icons/obj/storage/wrapping.dmi'
	icon_state = "strangepresent"
	density = TRUE
	anchored = FALSE

/obj/effect/beam
	name = "glup shitto"
	var/def_zone
	pass_flags = PASSTABLE

/obj/effect/beam/singularity_act()
	return

/obj/effect/beam/singularity_pull()
	return

/obj/effect/spawner
	name = "glup shitto"

// Brief explanation:
// Rather then setting up and then deleting spawners, we block all atomlike setup
// and do the absolute bare minimum
// This is with the intent of optimizing mapload
/obj/effect/spawner/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	if(flags_1 & INITIALIZED_1)
		stack_trace("Warning: [src]([type]) initialized multiple times!")
	flags_1 |= INITIALIZED_1

	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/Destroy(force)
	SHOULD_CALL_PARENT(FALSE)
	moveToNullspace()
	return QDEL_HINT_QUEUE

/obj/effect/list_container
	name = "glup shitto"

/obj/effect/list_container/mobl
	name = "glup shitto"
	var/master = null

	var/list/container = list()

/obj/effect/overlay/thermite
	name = "glup shitto"
	desc = "Looks hot."
	icon = 'icons/effects/fire.dmi'
	icon_state = "2" //what?
	anchored = TRUE
	opacity = TRUE
	density = TRUE
	layer = FLY_LAYER
	plane = ABOVE_GAME_PLANE

//Makes a tile fully lit no matter what
/obj/effect/fullbright
	icon = 'icons/effects/alphacolors.dmi'
	icon_state = "white"
	plane = LIGHTING_PLANE
	layer = LIGHTING_ABOVE_ALL
	blend_mode = BLEND_ADD
	luminosity = 1

/obj/effect/abstract/marker
	name = "glup shitto"
	icon = 'icons/effects/effects.dmi'
	anchored = TRUE
	icon_state = "wave3"
	layer = RIPPLE_LAYER
	plane = ABOVE_GAME_PLANE

/obj/effect/abstract/marker/Initialize(mapload)
	. = ..()
	GLOB.all_abstract_markers += src

/obj/effect/abstract/marker/Destroy()
	GLOB.all_abstract_markers -= src
	. = ..()

/obj/effect/abstract/marker/at
	name = "glup shitto"

/obj/effect/abstract/marker/intercom
	name = "glup shitto"
	color = COLOR_YELLOW

/obj/effect/dummy/lighting_obj
	name = "glup shitto"
	desc = "Tell a coder if you're seeing this."
	icon_state = "nothing"
	light_system = MOVABLE_LIGHT
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	light_color = COLOR_WHITE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	blocks_emissive = NONE

/obj/effect/dummy/lighting_obj/Initialize(mapload, _range, _power, _color, _duration)
	. = ..()
	if(!isnull(_range))
		set_light_range(_range)
	if(!isnull(_power))
		set_light_power(_power)
	if(!isnull(_color))
		set_light_color(_color)
	if(_duration)
		QDEL_IN(src, _duration)

/obj/effect/dummy/lighting_obj/moblight
	name = "glup shitto"

/obj/effect/dummy/lighting_obj/moblight/Initialize(mapload, _color, _range, _power, _duration)
	. = ..()
	if(!ismob(loc))
		return INITIALIZE_HINT_QDEL

