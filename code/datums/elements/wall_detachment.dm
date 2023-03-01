/// If the wall underneath us is broken, we should detach ourselves from the wall in some manner.
/// This element will assume best mapping practices, warranty void if you're doing some fucky shit.
/datum/element/wall_detachment
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2

	/// Weakref to the wall that we registered our signals on.
	var/datum/weakref/wall

	/// Callback to the proc we execute to remove ourselves from being hung on the wall.
	var/datum/callback/callable_proc

/datum/element/wall_detachment/Attach(datum/target, datum/callback/callable_proc)
	. = ..()

	if(!isobj(target))
		return ELEMENT_INCOMPATIBLE

	var/obj/object = target
	var/cached_relative_offset = abs(object.directional_mapping_offset) // just in case we get a negative value for some really silly reason

	if(cached_relative_offset == 0) // it's not a boolean i shant use a !
		// Why the fuck are we here? Error and get out fast so we don't eat up processing time.
		// We can get away with both the stack_trace and the mapping log here because there's no way a player can accomplish this, it's 100% a code-side error.
		var/message = "A wallmount object [object] at [AREACOORD(object)] was spawned without a directional mapping offset variable! Do not attempt to add the wall_detachment element onto it."
		stack_trace(message)
		log_mapping(message)
		return ELEMENT_INCOMPATIBLE

	// Some nomenclature. Our "Actual Position" is the turf we are placed on in the map, the turf that directly correlates to the turf we are placed on in the DMM file corresponding to our map.
	// Our "Visual Location" is the turf we visually appear to be on. This is the turf we are on if we were pixelshifted onto a wall from an open turf.
	// For the sake of this element, we will assume that the visual location *must* be a closed turf, anything else shouldn't be covered by this element as it is right now.
	// In an ideal scenario and assuming best mapping practices, these two turfs are different in a very clear and discernable way.
	// In the event that we actually aren't on the visual location due to mappers fucking us over, stuff's yonked. Just say the shockwave from one wall being deconstructed fucked up the other one?
	var/turf/actual_position
	var/turf/closed/visual_location

	if(object.spawned_by_directional_mapping_helper) // If this is true, our work is made so much easier (unless we got screwed over by mappers somehow). Just read our dir and get the turf in that direction, cool.
		visual_location = get_step(object, object.dir)
		handle_registration(object, visual_location, callable_proc)
		return

	// Alright, time for some nitty gritty work then.
	actual_position = get_turf(object)
	if(isclosedturf(actual_position))
		handle_registration(object, actual_position, callable_proc) // Alright, we were placed directly on a wall. This means that our visual location is equal to our actual position, which is silly, but let's just get outta here.
		return

	// Our actual position isn't on a wall, let's try and figure out if we were placed somewhere visually.
	// Basically, if we do not exceed the defined bounds of a turf for this wallmount item in particular, we are not on a wall (perhaps on the floor or a table or something like that, which isn't covered)
	// This is particularly nasty because we can't really trust the dir of the object here since it might be at the default SOUTH or something silly... so let's math it out.
	var/cached_pixel_x = object.pixel_x
	var/cached_pixel_y = object.pixel_y
	if(abs(cached_pixel_x) < cached_relative_offset && abs(cached_pixel_y) < cached_relative_offset) // early return since we aren't bilbo swaggin somewhere off our actual position
		return ELEMENT_INCOMPATIBLE

	// i couldn't find a helper or define that did this so
	var/worked_out_dir = NONE

	if(cached_pixel_x > cached_relative_offset)
		worked_out_dir |= EAST
	else if(cached_pixel_x < -cached_relative_offset)
		worked_out_dir |= WEST

	if(cached_pixel_y > cached_relative_offset)
		worked_out_dir |= NORTH
	else if(cached_pixel_y < -cached_relative_offset)
		worked_out_dir |= SOUTH

	visual_location = get_step(actual_position, worked_out_dir)
	if(isclosedturf(visual_location))
		handle_registration(object, visual_location, callable_proc)
		return

	// If all of that didn't work out... that means that we are somehow not on a wall at all. That's probably valid behavior somewhere, but it's not covered in the scope of our element.
	return ELEMENT_INCOMPATIBLE

/datum/element/wall_detachment/Detach()
	UnregisterSignal(wall.resolve(), COMSIG_PARENT_QDELETING) // we shouldn't have attached to an object if we didn't have a wall, so let's runtime in case some fucky shit happens.
	callable_proc = null
	return ..()

/// Where we actually register all of the signals onto our parent as well as the turf. If our turf is deleted, we should detach ourselves from the wall.
/datum/element/wall_detachment/proc/handle_registration(obj/object, turf/closed/registerable_wall, datum/callback/callable_proc)
	src.callable_proc = callable_proc
	wall = WEAKREF(registerable_wall)
	RegisterSignal(registerable_wall, COMSIG_PARENT_QDELETING, PROC_REF(handle_detachment))

/// Invoke any procs we need to detach ourselves from the wall, then detach the element.
/datum/element/wall_detachment/proc/handle_detachment()
	SIGNAL_HANDLER

	if(callable_proc)
		//INVOKE_ASYNC(parent, callable_proc)
		callable_proc.Invoke()

	Detach() // no longer on a wall, so no more element
