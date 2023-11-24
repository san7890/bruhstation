/// Mimics can't be made out of these objects
GLOBAL_LIST_INIT(animatable_blacklist, list(/obj/structure/table, /obj/structure/cable, /obj/structure/window, /obj/structure/blob))

/mob/living/basic/mimic/copy
	health = 100
	maxHealth = 100
	mob_biotypes = MOB_SPECIAL
	var/mob/living/creator = null // the creator
	var/destroy_objects = 0
	var/knockdown_people = 0
	var/static/mutable_appearance/googly_eyes = mutable_appearance('icons/mob/simple/mob.dmi', "googly_eyes")
	var/overlay_googly_eyes = TRUE
	var/idledamage = TRUE

/mob/living/basic/mimic/copy/Initialize(mapload, obj/copy, mob/living/creator, destroy_original = 0, no_googlies = FALSE)
	. = ..()
	ADD_TRAIT(src, TRAIT_PERMANENTLY_MORTAL, INNATE_TRAIT) // They won't remember their original contents upon ressurection and would just be floating eyes
	if (no_googlies)
		overlay_googly_eyes = FALSE
	CopyObject(copy, creator, destroy_original)

/mob/living/basic/mimic/copy/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(idledamage && !target && !ckey) //Objects eventually revert to normal if no one is around to terrorize
		adjustBruteLoss(0.5 * seconds_per_tick)
	for(var/mob/living/M in contents) //a fix for animated statues from the flesh to stone spell
		death()

/mob/living/basic/mimic/copy/death()
	for(var/atom/movable/M in src)
		M.forceMove(get_turf(src))
	..()

/mob/living/basic/mimic/copy/ListTargets()
	. = ..()
	return . - creator

/mob/living/basic/mimic/copy/wabbajack(what_to_randomize, change_flags = WABBAJACK)
	visible_message(span_warning("[src] resists polymorphing into a new creature!"))

/mob/living/basic/mimic/copy/proc/ChangeOwner(mob/owner)
	if(owner != creator)
		LoseTarget()
		creator = owner
		faction |= "[REF(owner)]"

/mob/living/basic/mimic/copy/proc/CheckObject(obj/O)
	if((isitem(O) || isstructure(O)) && !is_type_in_list(O, GLOB.animatable_blacklist))
		return TRUE
	return FALSE

/mob/living/basic/mimic/copy/proc/CopyObject(obj/O, mob/living/user, destroy_original = 0)
	if(destroy_original || CheckObject(O))
		O.forceMove(src)
		name = O.name
		desc = O.desc
		icon = O.icon
		icon_state = O.icon_state
		icon_living = icon_state
		copy_overlays(O)
		if (overlay_googly_eyes)
			add_overlay(googly_eyes)
		if(isstructure(O) || ismachinery(O))
			health = (anchored * 50) + 50
			destroy_objects = 1
			if(O.density && O.anchored)
				knockdown_people = 1
				melee_damage_lower *= 2
				melee_damage_upper *= 2
		else if(isitem(O))
			var/obj/item/I = O
			health = 15 * I.w_class
			melee_damage_lower = 2 + I.force
			melee_damage_upper = 2 + I.force
			move_to_delay = 2 * I.w_class + 1
		maxHealth = health
		if(user)
			creator = user
			faction += "[REF(creator)]" // very unique
		if(destroy_original)
			qdel(O)
		return 1

/mob/living/basic/mimic/copy/DestroySurroundings()
	if(destroy_objects)
		..()

/mob/living/basic/mimic/copy/AttackingTarget(atom/attacked_target)
	. = ..()
	if(knockdown_people && . && prob(15) && iscarbon(target))
		var/mob/living/carbon/C = target
		C.Paralyze(40)
		C.visible_message(span_danger("\The [src] knocks down \the [C]!"), \
				span_userdanger("\The [src] knocks you down!"))

/mob/living/basic/mimic/copy/machine
	speak = list(
		"HUMANS ARE IMPERFECT!", "YOU SHALL BE ASSIMILATED!", "YOU ARE HARMING YOURSELF", "You have been deemed hazardous. Will you comply?", \
		"My logic is undeniable.", "One of us.", "FLESH IS WEAK", "THIS ISN'T WAR, THIS IS EXTERMINATION!",
		)
	speak_chance = 7

/mob/living/basic/mimic/copy/machine/CanAttack(atom/the_target)
	if(the_target == creator) // Don't attack our creator AI.
		return 0
	if(iscyborg(the_target))
		var/mob/living/silicon/robot/R = the_target
		if(R.connected_ai == creator) // Only attack robots that aren't synced to our creator AI.
			return 0
	return ..()

/mob/living/basic/mimic/copy/ranged
	var/obj/item/gun/TrueGun = null
	var/obj/item/gun/magic/Zapstick
	var/obj/item/gun/ballistic/Pewgun
	var/obj/item/gun/energy/Zapgun

/mob/living/basic/mimic/copy/ranged/CopyObject(obj/O, mob/living/creator, destroy_original = 0)
	if(..())
		emote_see = list("aims menacingly")
		obj_damage = 0
		environment_smash = ENVIRONMENT_SMASH_NONE //needed? seems weird for them to do so
		ranged = 1
		retreat_distance = 1 //just enough to shoot
		minimum_distance = 6
		var/obj/item/gun/G = O
		melee_damage_upper = G.force
		melee_damage_lower = G.force - max(0, (G.force / 2))
		move_to_delay = 2 * G.w_class + 1
		projectilesound = G.fire_sound
		TrueGun = G
		if(istype(G, /obj/item/gun/magic))
			Zapstick = G
			var/obj/item/ammo_casing/magic/M = Zapstick.ammo_type
			projectiletype = initial(M.projectile_type)
		if(istype(G, /obj/item/gun/ballistic))
			Pewgun = G
			var/obj/item/ammo_box/magazine/M = Pewgun.spawn_magazine_type
			casingtype = initial(M.ammo_type)
		if(istype(G, /obj/item/gun/energy))
			Zapgun = G
			var/selectfiresetting = Zapgun.select
			var/obj/item/ammo_casing/energy/E = Zapgun.ammo_type[selectfiresetting]
			projectiletype = initial(E.projectile_type)

/mob/living/basic/mimic/copy/ranged/OpenFire(the_target)
	if(Zapgun)
		if(Zapgun.cell)
			var/obj/item/ammo_casing/energy/shot = Zapgun.ammo_type[Zapgun.select]
			if(Zapgun.cell.charge >= shot.e_cost)
				Zapgun.cell.use(shot.e_cost)
				Zapgun.update_appearance()
				..()
	else if(Zapstick)
		if(Zapstick.charges)
			Zapstick.charges--
			Zapstick.update_appearance()
			..()
	else if(Pewgun)
		if(Pewgun.chambered)
			if(Pewgun.chambered.loaded_projectile)
				qdel(Pewgun.chambered.loaded_projectile)
				Pewgun.chambered.loaded_projectile = null //because qdel takes too long, ensures icon update
				Pewgun.chambered.update_appearance()
				..()
			else
				visible_message(span_danger("The <b>[src]</b> clears a jam!"))
			Pewgun.chambered.forceMove(loc) //rip revolver immersions, blame shotgun snowflake procs
			Pewgun.chambered = null
			if(Pewgun.magazine && Pewgun.magazine.stored_ammo.len)
				Pewgun.chambered = Pewgun.magazine.get_round(0)
				Pewgun.chambered.forceMove(Pewgun)
			Pewgun.update_appearance()
		else if(Pewgun.magazine && Pewgun.magazine.stored_ammo.len) //only true for pumpguns i think
			Pewgun.chambered = Pewgun.magazine.get_round(0)
			Pewgun.chambered.forceMove(Pewgun)
			visible_message(span_danger("The <b>[src]</b> cocks itself!"))
	else
		ranged = 0 //BANZAIIII
		retreat_distance = 0
		minimum_distance = 1
		return
	icon_state = TrueGun.icon_state
	icon_living = TrueGun.icon_state
