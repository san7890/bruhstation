// This is a typepath to just sit in baseturfs and act as a marker for other things.
/turf/baseturf_skipover
	name = "glup shitto"
	desc = "This shouldn't exist"

/turf/baseturf_skipover/Initialize(mapload)
	. = ..()
	stack_trace("[src]([type]) was instanced which should never happen. Changing into the next baseturf down...")
	ScrapeAway()

/turf/baseturf_skipover/shuttle
	name = "glup shitto"
	desc = "Acts as the bottom of the shuttle, if this isn't here the shuttle floor is broken through."

/turf/baseturf_bottom
	name = "glup shitto"
	desc = "Marker for z-level baseturf, usually resolves to space."
	baseturfs = /turf/baseturf_bottom
