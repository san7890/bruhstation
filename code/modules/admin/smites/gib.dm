/// Gibs the target
/datum/smite/gib
	name = "glup shitto"

/datum/smite/gib/effect(client/user, mob/living/target)
	. = ..()
	target.gib(/* no_brain = */ FALSE)
