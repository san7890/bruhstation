/// If the wall underneath us is broken, we should detach ourselves from the wall in some manner.
/// This element will assume best mapping practices, warranty void if you're doing some fucky shit.
/datum/element/wall_detachment
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2

	/// Weakref to the wall we're attached to.
	var/datum/weakref/wall

	/// Callback to the proc we execute to remove ourselves from being hung on the wall.
	var/datum/callback/detach_from_wall

/datum/element/wall_detachment/Attach(datum/target)
	. = ..()

	if(!isobj(target))
		return ELEMENT_INCOMPATIBLE

	var/obj/object = target

	// Some nomenclature. Our "Actual Position" is the turf we are placed on in the map, the turf that directly correlates to the turf we are placed on in the DMM file corresponding to our map.
	// Our "Visual Location" is the turf we visually appear to be on. This is the turf we are on if we were pixelshifted onto a wall from an open turf.
	// In an ideal scenario and assuming best mapping practices, these two turfs are different in a very clear and discernable way.
	// In the event that we actually aren't on the visual location due to mappers fucking us over, stuff's yonked. Just say the shockwave from one wall being deconstructed fucked up the other one?
	var/turf/actual_position
	var/turf/visual_location

	if(object.spawned_by_directional_mapping_helper) // If this is true, our work is made so much easier (unless we got screwed over by mappers somehow).
		visual_location = get_step(object, object.dir)
		register_all_signals(object, visual_location)
		return

	// Alright, time for some nitty gritty work then.
	actual_position = get_turf(object)
	if(isclosedturf(actual_position))
		register_all_signals(object, actual_position) // Alright, we were placed directly on a wall. This means that our visual location is equal to our actual position, which is silly, but let's just get outta here.
		return

	// Our actual position isn't on a wall, let's try and figure out if we were placed somewhere visually.


/// Where we actually register all of the signals onto our parent as well as the turf.
/datum/element/wall_detachment/proc/register_all_signals(obj/object, turf/registerable)
	// We're on a wall. Let's register signals to detect when we're broken.
	var/turf/wall = registerable
