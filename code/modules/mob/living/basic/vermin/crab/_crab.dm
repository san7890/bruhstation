/**
 * ## Crabs
 *
 * Decapod crustaceans with big ol' claws and a tendency to scuttle around. Look sir, free crabs!
 */
/mob/living/basic/crab
	name = "crab"
	desc = "A little snipper-snapper."
	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"

	speak_emote = list("clicks")
	gold_core_spawnable = FRIENDLY_SPAWN
	butcher_results = list(/obj/item/food/meat/slab/rawcrab = 2)

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "stomps"
	response_harm_simple = "stomp"
	friendly_verb_continuous = "pinches"
	friendly_verb_simple = "pinch"
	attack_verb_continuous = "snips"
	attack_verb_simple = "snip"
	attack_sound = 'sound/weapons/bite.ogg'
	attack_vis_effect = ATTACK_EFFECT_BITE

	stop_automated_movement = 1

	ai_controller = /datum/ai_controller/basic_controller/crab

	/// The directions that crabs are allowed to move in.
	var/list/crab_directions

/mob/living/basic/crab/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	AddComponent(/datum/component/crab_movement)
