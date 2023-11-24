/// Mimics, monsters that disguise themselves as objects.
/// This is the abstract base type, which needs more work to be useful
/mob/living/basic/mimic
	name = "debug mimic"
	desc = "this fella should not exist"
	icon = 'icons/obj/storage/crates.dmi'
	icon_state = "crate"
	icon_living = "crate"

	response_help_continuous = "touches"
	response_help_simple = "touch"
	response_disarm_continuous = "pushes"
	response_disarm_simple = "push"
	speed = 0
	maxHealth = 250
	health = 250
	gender = NEUTER
	mob_biotypes = NONE
	pass_flags = PASSFLAPS

	harm_intent_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 12
	attack_sound = 'sound/weapons/punch1.ogg'
	emote_taunt = list("growls")
	speak_emote = list("creaks")
	taunt_chance = 30

	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	faction = list(FACTION_MIMIC)
	move_to_delay = 9
	basic_mob_flags = DEL_ON_DEATH
	///A cap for items in the mimic. Prevents the mimic from eating enough stuff to cause lag when opened.
	var/storage_capacity = 50
	///A cap for mobs. Mobs count towards the item cap. Same purpose as above.
	var/mob_storage_capacity = 10

/mob/living/basic/mimic/Initialize(mapload)
	. = ..()
	if(type == /mob/living/basic/mimic)
		message_admins("Attempted to spawn in a generic mimic, this isn't supported. Please try using the 'spawn_objasmob' verb instead to spawn mimic-esque objects.")
		return INITIALIZE_HINT_QDEL



