/obj/item/dnainjector
	name = "glup shitto"
	desc = "A cheap single use autoinjector that injects the user with DNA."
	icon = 'icons/obj/medical/syringe.dmi'
	icon_state = "dnainjector"
	inhand_icon_state = "dnainjector"
	worn_icon_state = "pen"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY

	var/damage_coeff = 1
	var/list/fields
	var/list/add_mutations = list()
	var/list/remove_mutations = list()

	var/used = FALSE

/obj/item/dnainjector/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	if(used)
		update_appearance()

/obj/item/dnainjector/vv_edit_var(vname, vval)
	. = ..()
	if(vname == NAMEOF(src, used))
		update_appearance()

/obj/item/dnainjector/update_icon_state()
	. = ..()
	icon_state = inhand_icon_state = "[initial(icon_state)][used ? "0" : null]"

/obj/item/dnainjector/update_desc(updates)
	. = ..()
	desc = "[initial(desc)][used ? "This one is used up." : null]"

/obj/item/dnainjector/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/obj/item/dnainjector/proc/inject(mob/living/carbon/target, mob/user)
	if(!target.can_mutate())
		return FALSE
	for(var/removed_mutation in remove_mutations)
		target.dna.remove_mutation(removed_mutation)
	for(var/added_mutation in add_mutations)
		if(added_mutation == /datum/mutation/human/race)
			message_admins("[ADMIN_LOOKUPFLW(user)] injected [key_name_admin(target)] with the [name] [span_danger("(MONKEY)")]")
		if(target.dna.mutation_in_sequence(added_mutation))
			target.dna.activate_mutation(added_mutation)
		else
			target.dna.add_mutation(added_mutation, MUT_EXTRA)
	if(fields)
		if(fields["name"] && fields["UE"] && fields["blood_type"])
			target.real_name = fields["name"]
			target.dna.unique_enzymes = fields["UE"]
			target.name = target.real_name
			target.dna.blood_type = fields["blood_type"]
		if(fields["UI"]) //UI+UE
			target.dna.unique_identity = merge_text(target.dna.unique_identity, fields["UI"])
		if(fields["UF"])
			target.dna.unique_features = merge_text(target.dna.unique_features, fields["UF"])
		if(fields["UI"] || fields["UF"])
			target.updateappearance(mutcolor_update = TRUE, mutations_overlay_update = TRUE)
	return TRUE

/obj/item/dnainjector/attack(mob/target, mob/user)
	if(!ISADVANCEDTOOLUSER(user))
		to_chat(user, span_warning("You don't have the dexterity to do this!"))
		return
	if(used)
		to_chat(user, span_warning("This injector is used up!"))
		return
	if(ishuman(target))
		var/mob/living/carbon/human/humantarget = target
		if (!humantarget.try_inject(user, injection_flags = INJECT_TRY_SHOW_ERROR_MESSAGE))
			return
	log_combat(user, target, "attempted to inject", src)

	if(target != user)
		target.visible_message(span_danger("[user] is trying to inject [target] with [src]!"), \
			span_userdanger("[user] is trying to inject you with [src]!"))
		if(!do_after(user, 3 SECONDS, target) || used)
			return
		target.visible_message(span_danger("[user] injects [target] with the syringe with [src]!"), \
						span_userdanger("[user] injects you with the syringe with [src]!"))

	else
		to_chat(user, span_notice("You inject yourself with [src]."))

	log_combat(user, target, "injected", src)

	if(!inject(target, user)) //Now we actually do the heavy lifting.
		to_chat(user, span_notice("It appears that [target] does not have compatible DNA."))

	used = TRUE
	update_appearance()

/obj/item/dnainjector/timed
	var/duration = 600

/obj/item/dnainjector/timed/inject(mob/living/carbon/target, mob/user)
	if(target.stat == DEAD) //prevents dead people from having their DNA changed
		to_chat(user, span_notice("You can't modify [target]'s DNA while [target.p_theyre()] dead."))
		return FALSE
	if(!target.can_mutate())
		return FALSE
	var/endtime = world.time + duration
	for(var/mutation in remove_mutations)
		if(mutation == /datum/mutation/human/race)
			if(!ismonkey(target))
				continue
			target = target.dna.remove_mutation(mutation)
		else
			target.dna.remove_mutation(mutation)
	for(var/mutation in add_mutations)
		if(target.dna.get_mutation(mutation))
			continue //Skip permanent mutations we already have.
		if(mutation == /datum/mutation/human/race && !ismonkey(target))
			message_admins("[ADMIN_LOOKUPFLW(user)] injected [key_name_admin(target)] with the [name] [span_danger("(MONKEY)")]")
			target = target.dna.add_mutation(mutation, MUT_OTHER, endtime)
		else
			target.dna.add_mutation(mutation, MUT_OTHER, endtime)
	if(fields)
		if(fields["name"] && fields["UE"] && fields["blood_type"])
			if(!target.dna.previous["name"])
				target.dna.previous["name"] = target.real_name
			if(!target.dna.previous["UE"])
				target.dna.previous["UE"] = target.dna.unique_enzymes
			if(!target.dna.previous["blood_type"])
				target.dna.previous["blood_type"] = target.dna.blood_type
			target.real_name = fields["name"]
			target.dna.unique_enzymes = fields["UE"]
			target.name = target.real_name
			target.dna.blood_type = fields["blood_type"]
			target.dna.temporary_mutations[UE_CHANGED] = endtime
		if(fields["UI"]) //UI+UE
			if(!target.dna.previous["UI"])
				target.dna.previous["UI"] = target.dna.unique_identity
			target.dna.unique_identity = merge_text(target.dna.unique_identity, fields["UI"])
			target.dna.temporary_mutations[UI_CHANGED] = endtime
		if(fields["UF"]) //UI+UE
			if(!target.dna.previous["UF"])
				target.dna.previous["UF"] = target.dna.unique_features
			target.dna.unique_features = merge_text(target.dna.unique_features, fields["UF"])
			target.dna.temporary_mutations[UF_CHANGED] = endtime
		if(fields["UI"] || fields["UF"])
			target.updateappearance(mutcolor_update = TRUE, mutations_overlay_update = TRUE)
	return TRUE

/obj/item/dnainjector/timed/hulk
	name = "glup shitto"
	desc = "This will make you big and strong, but give you a bad skin condition."
	add_mutations = list(/datum/mutation/human/hulk)

/obj/item/dnainjector/timed/h2m
	name = "glup shitto"
	desc = "Will make you a flea bag."
	add_mutations = list(/datum/mutation/human/race)

/obj/item/dnainjector/activator
	name = "glup shitto"
	desc = "Activates the current mutation on injection, if the subject has it."
	var/doitanyway = FALSE
	var/research = FALSE //Set to true to get expended and filled injectors for chromosomes
	var/filled = FALSE
	var/crispr_charge = FALSE // Look for viruses, look at symptoms, if research and Dormant DNA Activator or Viral Evolutionary Acceleration, set to true

/obj/item/dnainjector/activator/inject(mob/living/carbon/target, mob/user)
	if(!target.can_mutate())
		return FALSE
	for(var/mutation in add_mutations)
		var/datum/mutation/human/added_mutation = mutation
		if(istype(added_mutation, /datum/mutation/human))
			mutation = added_mutation.type
		if(!target.dna.activate_mutation(added_mutation))
			if(doitanyway)
				target.dna.add_mutation(added_mutation, MUT_EXTRA)
		else if(research && target.client)
			filled = TRUE
		for(var/datum/disease/advance/disease in target.diseases)
			for(var/datum/symptom/symp in disease.symptoms)
				if((symp.type == /datum/symptom/genetic_mutation) || (symp.type == /datum/symptom/viralevolution))
					crispr_charge = TRUE
		log_combat(user, target, "[!doitanyway ? "failed to inject" : "injected"]", "[src] ([mutation])[crispr_charge ? " with CRISPR charge" : ""]")
	return TRUE

/// DNA INJECTORS

/obj/item/dnainjector/acidflesh
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/acidflesh)

/obj/item/dnainjector/antiacidflesh
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/acidflesh)

/obj/item/dnainjector/antenna
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/antenna)

/obj/item/dnainjector/antiantenna
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/antenna)

/obj/item/dnainjector/antiglow
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/glow/anti)

/obj/item/dnainjector/removeantiglow
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/glow/anti)

/obj/item/dnainjector/blindmut
	name = "glup shitto"
	desc = "Makes you not see anything."
	add_mutations = list(/datum/mutation/human/blind)

/obj/item/dnainjector/antiblind
	name = "glup shitto"
	desc = "IT'S A MIRACLE!!!"
	remove_mutations = list(/datum/mutation/human/blind)

/obj/item/dnainjector/chameleonmut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/chameleon)

/obj/item/dnainjector/antichameleon
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/chameleon)

/obj/item/dnainjector/chavmut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/chav)

/obj/item/dnainjector/antichav
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/chav)

/obj/item/dnainjector/clumsymut
	name = "glup shitto"
	desc = "Makes clown minions."
	add_mutations = list(/datum/mutation/human/clumsy)

/obj/item/dnainjector/anticlumsy
	name = "glup shitto"
	desc = "Apply this for Security Clown."
	remove_mutations = list(/datum/mutation/human/clumsy)

/obj/item/dnainjector/coughmut
	name = "glup shitto"
	desc = "Will bring forth a sound of horror from your throat."
	add_mutations = list(/datum/mutation/human/cough)

/obj/item/dnainjector/anticough
	name = "glup shitto"
	desc = "Will stop that awful noise."
	remove_mutations = list(/datum/mutation/human/cough)

/obj/item/dnainjector/cryokinesis
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/cryokinesis)

/obj/item/dnainjector/anticryokinesis
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/cryokinesis)

/obj/item/dnainjector/deafmut
	name = "glup shitto"
	desc = "Sorry, what did you say?"
	add_mutations = list(/datum/mutation/human/deaf)

/obj/item/dnainjector/antideaf
	name = "glup shitto"
	desc = "Will make you hear once more."
	remove_mutations = list(/datum/mutation/human/deaf)

/obj/item/dnainjector/dwarf
	name = "glup shitto"
	desc = "It's a small world after all."
	add_mutations = list(/datum/mutation/human/dwarfism)

/obj/item/dnainjector/antidwarf
	name = "glup shitto"
	desc = "Helps you grow big and strong."
	remove_mutations = list(/datum/mutation/human/dwarfism)

/obj/item/dnainjector/elvismut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/elvis)

/obj/item/dnainjector/antielvis
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/elvis)

/obj/item/dnainjector/epimut
	name = "glup shitto"
	desc = "Shake shake shake the room!"
	add_mutations = list(/datum/mutation/human/epilepsy)

/obj/item/dnainjector/antiepi
	name = "glup shitto"
	desc = "Will fix you up from shaking the room."
	remove_mutations = list(/datum/mutation/human/epilepsy)

/obj/item/dnainjector/geladikinesis
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/geladikinesis)

/obj/item/dnainjector/antigeladikinesis
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/geladikinesis)

/obj/item/dnainjector/gigantism
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/gigantism)

/obj/item/dnainjector/antigigantism
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/gigantism)

/obj/item/dnainjector/glassesmut
	name = "glup shitto"
	desc = "Will make you need dorkish glasses."
	add_mutations = list(/datum/mutation/human/nearsight)

/obj/item/dnainjector/antiglasses
	name = "glup shitto"
	desc = "Toss away those glasses!"
	remove_mutations = list(/datum/mutation/human/nearsight)

/obj/item/dnainjector/glow
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/glow)

/obj/item/dnainjector/removeglow
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/glow)

/obj/item/dnainjector/hulkmut
	name = "glup shitto"
	desc = "This will make you big and strong, but give you a bad skin condition."
	add_mutations = list(/datum/mutation/human/hulk)

/obj/item/dnainjector/antihulk
	name = "glup shitto"
	desc = "Cures green skin."
	remove_mutations = list(/datum/mutation/human/hulk)

/obj/item/dnainjector/h2m
	name = "glup shitto"
	desc = "Will make you a flea bag."
	add_mutations = list(/datum/mutation/human/race)

/obj/item/dnainjector/m2h
	name = "glup shitto"
	desc = "Will make you...less hairy."
	remove_mutations = list(/datum/mutation/human/race)

/obj/item/dnainjector/illiterate
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/illiterate)

/obj/item/dnainjector/antiilliterate
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/illiterate)

/obj/item/dnainjector/insulated
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/insulated)

/obj/item/dnainjector/antiinsulated
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/insulated)

/obj/item/dnainjector/lasereyesmut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/laser_eyes)

/obj/item/dnainjector/antilasereyes
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/laser_eyes)

/obj/item/dnainjector/mindread
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/mindreader)

/obj/item/dnainjector/antimindread
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/mindreader)

/obj/item/dnainjector/mutemut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/mute)

/obj/item/dnainjector/antimute
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/mute)

/obj/item/dnainjector/olfaction
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/olfaction)

/obj/item/dnainjector/antiolfaction
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/olfaction)

/obj/item/dnainjector/piglatinmut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/piglatin)

/obj/item/dnainjector/antipiglatin
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/piglatin)

/obj/item/dnainjector/paranoia
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/paranoia)

/obj/item/dnainjector/antiparanoia
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/paranoia)

/obj/item/dnainjector/pressuremut
	name = "glup shitto"
	desc = "Gives you fire."
	add_mutations = list(/datum/mutation/human/pressure_adaptation)

/obj/item/dnainjector/antipressure
	name = "glup shitto"
	desc = "Cures fire."
	remove_mutations = list(/datum/mutation/human/pressure_adaptation)

/obj/item/dnainjector/radioactive
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/radioactive)

/obj/item/dnainjector/antiradioactive
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/radioactive)

/obj/item/dnainjector/shock
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/shock)

/obj/item/dnainjector/antishock
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/shock)

/obj/item/dnainjector/spastic
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/spastic)

/obj/item/dnainjector/antispastic
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/spastic)

/obj/item/dnainjector/spatialinstability
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/badblink)

/obj/item/dnainjector/antispatialinstability
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/badblink)

/obj/item/dnainjector/stuttmut
	name = "glup shitto"
	desc = "Makes you s-s-stuttterrr."
	add_mutations = list(/datum/mutation/human/nervousness)

/obj/item/dnainjector/antistutt
	name = "glup shitto"
	desc = "Fixes that speaking impairment."
	remove_mutations = list(/datum/mutation/human/nervousness)

/obj/item/dnainjector/swedishmut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/swedish)

/obj/item/dnainjector/antiswedish
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/swedish)

/obj/item/dnainjector/telemut
	name = "glup shitto"
	desc = "Super brain TK!"
	add_mutations = list(/datum/mutation/human/telekinesis)

/obj/item/dnainjector/telemut/darkbundle
	name = "glup shitto"
	desc = "Good. Let the hate flow through you."

/obj/item/dnainjector/antitele
	name = "glup shitto"
	desc = "Will make you not able to control your mind."
	remove_mutations = list(/datum/mutation/human/telekinesis)

/obj/item/dnainjector/firemut
	name = "glup shitto"
	desc = "Gives you fire."
	add_mutations = list(/datum/mutation/human/temperature_adaptation)

/obj/item/dnainjector/antifire
	name = "glup shitto"
	desc = "Cures fire."
	remove_mutations = list(/datum/mutation/human/temperature_adaptation)

/obj/item/dnainjector/thermal
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/thermal)

/obj/item/dnainjector/antithermal
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/thermal)

/obj/item/dnainjector/tourmut
	name = "glup shitto"
	desc = "Gives you a nasty case of Tourette's."
	add_mutations = list(/datum/mutation/human/tourettes)

/obj/item/dnainjector/antitour
	name = "glup shitto"
	desc = "Will cure Tourette's."
	remove_mutations = list(/datum/mutation/human/tourettes)

/obj/item/dnainjector/twoleftfeet
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/extrastun)

/obj/item/dnainjector/antitwoleftfeet
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/extrastun)

/obj/item/dnainjector/unintelligiblemut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/unintelligible)

/obj/item/dnainjector/antiunintelligible
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/unintelligible)

/obj/item/dnainjector/void
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/void)

/obj/item/dnainjector/antivoid
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/void)

/obj/item/dnainjector/xraymut
	name = "glup shitto"
	desc = "Finally you can see what the Captain does."
	add_mutations = list(/datum/mutation/human/xray)

/obj/item/dnainjector/antixray
	name = "glup shitto"
	desc = "It will make you see harder."
	remove_mutations = list(/datum/mutation/human/xray)

/obj/item/dnainjector/wackymut
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/wacky)

/obj/item/dnainjector/antiwacky
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/wacky)

/obj/item/dnainjector/webbing
	name = "glup shitto"
	add_mutations = list(/datum/mutation/human/webbing)

/obj/item/dnainjector/antiwebbing
	name = "glup shitto"
	remove_mutations = list(/datum/mutation/human/webbing)
