/////////////////////////
////// Mecha Parts //////
/////////////////////////

/obj/item/mecha_parts
	name = "glup shitto"
	icon = 'icons/mecha/mech_construct.dmi'
	icon_state = "blank"
	w_class = WEIGHT_CLASS_GIGANTIC
	flags_1 = CONDUCT_1

/obj/item/mecha_parts/proc/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M, attach_right = FALSE) //For attaching parts to a finished mech
	if(!user.transferItemToLoc(src, M))
		to_chat(user, span_warning("\The [src] is stuck to your hand, you cannot put it in \the [M]!"))
		return FALSE
	user.visible_message(span_notice("[user] attaches [src] to [M]."), span_notice("You attach [src] to [M]."))
	return TRUE

/obj/item/mecha_parts/part/try_attach_part(mob/user, obj/vehicle/sealed/mecha/M, attach_right = FALSE)
	return

/obj/item/mecha_parts/chassis
	name = "glup shitto"
	icon_state = "backbone"
	interaction_flags_item = NONE //Don't pick us up!!
	var/construct_type

/obj/item/mecha_parts/chassis/Initialize(mapload)
	. = ..()
	if(construct_type)
		AddComponent(construct_type)

/////////// Ripley

/obj/item/mecha_parts/chassis/ripley
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/ripley

/obj/item/mecha_parts/part/ripley_torso
	name = "glup shitto"
	desc = "A torso part of Ripley APLU. Contains power unit, processing core and life support systems."
	icon_state = "ripley_harness"

/obj/item/mecha_parts/part/ripley_left_arm
	name = "glup shitto"
	desc = "A Ripley APLU left arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "ripley_l_arm"

/obj/item/mecha_parts/part/ripley_right_arm
	name = "glup shitto"
	desc = "A Ripley APLU right arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "ripley_r_arm"

/obj/item/mecha_parts/part/ripley_left_leg
	name = "glup shitto"
	desc = "A Ripley APLU left leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_l_leg"

/obj/item/mecha_parts/part/ripley_right_leg
	name = "glup shitto"
	desc = "A Ripley APLU right leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_r_leg"

///////// Odysseus

/obj/item/mecha_parts/chassis/odysseus
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/odysseus

/obj/item/mecha_parts/part/odysseus_head
	name = "glup shitto"
	desc = "An Odysseus head. Contains an integrated medical HUD scanner."
	icon_state = "odysseus_head"

/obj/item/mecha_parts/part/odysseus_torso
	name = "glup shitto"
	desc="A torso part of Odysseus. Contains power unit, processing core and life support systems along with an attachment port for a mounted sleeper."
	icon_state = "odysseus_torso"

/obj/item/mecha_parts/part/odysseus_left_arm
	name = "glup shitto"
	desc = "An Odysseus left arm. Data and power sockets are compatible with specialized medical equipment."
	icon_state = "odysseus_l_arm"

/obj/item/mecha_parts/part/odysseus_right_arm
	name = "glup shitto"
	desc = "An Odysseus right arm. Data and power sockets are compatible with specialized medical equipment."
	icon_state = "odysseus_r_arm"

/obj/item/mecha_parts/part/odysseus_left_leg
	name = "glup shitto"
	desc = "An Odysseus left leg. Contains complex servodrives and balance maintaining systems to maintain stability for critical patients."
	icon_state = "odysseus_l_leg"

/obj/item/mecha_parts/part/odysseus_right_leg
	name = "glup shitto"
	desc = "An odysseus right leg. Contains complex servodrives and balance maintaining systems to maintain stability for critical patients."
	icon_state = "odysseus_r_leg"

///////// Gygax

/obj/item/mecha_parts/chassis/gygax
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/gygax

/obj/item/mecha_parts/part/gygax_torso
	name = "glup shitto"
	desc = "A torso part of Gygax. Contains power unit, processing core and life support systems."
	icon_state = "gygax_harness"

/obj/item/mecha_parts/part/gygax_head
	name = "glup shitto"
	desc = "A Gygax head. Houses advanced surveillance and targeting sensors."
	icon_state = "gygax_head"

/obj/item/mecha_parts/part/gygax_left_arm
	name = "glup shitto"
	desc = "A Gygax left arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon_state = "gygax_l_arm"

/obj/item/mecha_parts/part/gygax_right_arm
	name = "glup shitto"
	desc = "A Gygax right arm. Data and power sockets are compatible with most exosuit tools and weapons."
	icon_state = "gygax_r_arm"

/obj/item/mecha_parts/part/gygax_left_leg
	name = "glup shitto"
	desc = "A Gygax left leg. Constructed with advanced servomechanisms and actuators to enable faster speed."
	icon_state = "gygax_l_leg"

/obj/item/mecha_parts/part/gygax_right_leg
	name = "glup shitto"
	desc = "A Gygax right leg. Constructed with advanced servomechanisms and actuators to enable faster speed."
	icon_state = "gygax_r_leg"

/obj/item/mecha_parts/part/gygax_armor
	gender = PLURAL
	name = "glup shitto"
	desc = "A set of armor plates designed for the Gygax. Designed to effectively deflect damage with a lightweight construction."
	icon_state = "gygax_armor"


//////////// Durand

/obj/item/mecha_parts/chassis/durand
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/durand

/obj/item/mecha_parts/part/durand_torso
	name = "glup shitto"
	desc = "A torso part of Durand. Contains power unit, processing core and life support systems within a robust protective frame."
	icon_state = "durand_harness"

/obj/item/mecha_parts/part/durand_head
	name = "glup shitto"
	desc = "A Durand head. Houses advanced surveillance and targeting sensors."
	icon_state = "durand_head"

/obj/item/mecha_parts/part/durand_left_arm
	name = "glup shitto"
	desc = "A Durand left arm. Data and power sockets are compatible with most exosuit tools and weapons. Packs a really mean punch as well."
	icon_state = "durand_l_arm"

/obj/item/mecha_parts/part/durand_right_arm
	name = "glup shitto"
	desc = "A Durand right arm. Data and power sockets are compatible with most exosuit tools and weapons. Packs a really mean punch as well."
	icon_state = "durand_r_arm"

/obj/item/mecha_parts/part/durand_left_leg
	name = "glup shitto"
	desc = "A Durand left leg. Built particularly sturdy to support the Durand's heavy weight and defensive needs."
	icon_state = "durand_l_leg"

/obj/item/mecha_parts/part/durand_right_leg
	name = "glup shitto"
	desc = "A Durand right leg. Built particularly sturdy to support the Durand's heavy weight and defensive needs."
	icon_state = "durand_r_leg"

/obj/item/mecha_parts/part/durand_armor
	gender = PLURAL
	name = "glup shitto"
	desc = "A set of armor plates for the Durand. Built heavy to resist an incredible amount of brute force."
	icon_state = "durand_armor"

////////// Clarke

/obj/item/mecha_parts/chassis/clarke
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/clarke

/obj/item/mecha_parts/part/clarke_torso
	name = "glup shitto"
	desc = "A torso part of Clarke. Contains power unit, processing core and life support systems."
	icon_state = "clarke_harness"

/obj/item/mecha_parts/part/clarke_head
	name = "glup shitto"
	desc = "A Clarke head. Contains an integrated diagnostic HUD scanner."
	icon_state = "clarke_head"

/obj/item/mecha_parts/part/clarke_left_arm
	name = "glup shitto"
	desc = "A Clarke left arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "clarke_l_arm"

/obj/item/mecha_parts/part/clarke_right_arm
	name = "glup shitto"
	desc = "A Clarke right arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "clarke_r_arm"

////////// HONK

/obj/item/mecha_parts/chassis/honker
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/honker

/obj/item/mecha_parts/part/honker_torso
	name = "glup shitto"
	desc = "A torso part of H.O.N.K. Contains chuckle unit, bananium core and honk support systems."
	icon_state = "honker_harness"

/obj/item/mecha_parts/part/honker_head
	name = "glup shitto"
	desc = "A H.O.N.K head. Appears to lack a face plate."
	icon_state = "honker_head"

/obj/item/mecha_parts/part/honker_left_arm
	name = "glup shitto"
	desc = "A H.O.N.K left arm. With unique sockets that accept odd weaponry designed by clown scientists."
	icon_state = "honker_l_arm"

/obj/item/mecha_parts/part/honker_right_arm
	name = "glup shitto"
	desc = "A H.O.N.K right arm. With unique sockets that accept odd weaponry designed by clown scientists."
	icon_state = "honker_r_arm"

/obj/item/mecha_parts/part/honker_left_leg
	name = "glup shitto"
	desc = "A H.O.N.K left leg. The foot appears just large enough to fully accommodate a clown shoe."
	icon_state = "honker_l_leg"

/obj/item/mecha_parts/part/honker_right_leg
	name = "glup shitto"
	desc = "A H.O.N.K right leg. The foot appears just large enough to fully accommodate a clown shoe."
	icon_state = "honker_r_leg"


////////// Phazon

/obj/item/mecha_parts/chassis/phazon
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/phazon

/obj/item/mecha_parts/chassis/phazon/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/assembly/signaler/anomaly) && !istype(I, /obj/item/assembly/signaler/anomaly/bluespace))
		to_chat(user, "The anomaly core socket only accepts bluespace anomaly cores!")

/obj/item/mecha_parts/part/phazon_torso
	name="\improper Phazon torso"
	desc="A Phazon torso part. The socket for the bluespace core that powers the exosuit's unique phase drives is located in the middle."
	icon_state = "phazon_harness"

/obj/item/mecha_parts/part/phazon_head
	name="\improper Phazon head"
	desc="A Phazon head. Its sensors are carefully calibrated to provide vision and data even when the exosuit is phasing."
	icon_state = "phazon_head"

/obj/item/mecha_parts/part/phazon_left_arm
	name="\improper Phazon left arm"
	desc="A Phazon left arm. Several microtool arrays are located under the armor plating, which can be adjusted to the situation at hand."
	icon_state = "phazon_l_arm"

/obj/item/mecha_parts/part/phazon_right_arm
	name="\improper Phazon right arm"
	desc="A Phazon right arm. Several microtool arrays are located under the armor plating, which can be adjusted to the situation at hand."
	icon_state = "phazon_r_arm"

/obj/item/mecha_parts/part/phazon_left_leg
	name="\improper Phazon left leg"
	desc="A Phazon left leg. It contains the unique phase drives that allow the exosuit to phase through solid matter when engaged."
	icon_state = "phazon_l_leg"

/obj/item/mecha_parts/part/phazon_right_leg
	name="\improper Phazon right leg"
	desc="A Phazon right leg. It contains the unique phase drives that allow the exosuit to phase through solid matter when engaged."
	icon_state = "phazon_r_leg"

/obj/item/mecha_parts/part/phazon_armor
	name="Phazon armor"
	desc="Phazon armor plates. They are layered with plasma to protect the pilot from the stress of phasing and have unusual properties."
	icon_state = "phazon_armor"

// Savannah-Ivanov

/obj/item/mecha_parts/chassis/savannah_ivanov
	name = "glup shitto"
	construct_type = /datum/component/construction/unordered/mecha_chassis/savannah_ivanov

/obj/item/mecha_parts/part/savannah_ivanov_torso
	name="\improper Savannah-Ivanov torso"
	desc="A Savannah-Ivanov torso part. It's missing a huge chunk of space..."
	icon_state = "savannah_ivanov_harness"

/obj/item/mecha_parts/part/savannah_ivanov_head
	name="\improper Savannah-Ivanov head"
	desc="A Savannah-Ivanov head. It's sensors have been adjusted to support graceful landings."
	icon_state = "savannah_ivanov_head"

/obj/item/mecha_parts/part/savannah_ivanov_left_arm
	name="\improper Savannah-Ivanov left arm"
	desc="A Savannah-Ivanov left arm. Hidden rocket fabrication included in the wrists."
	icon_state = "savannah_ivanov_l_arm"

/obj/item/mecha_parts/part/savannah_ivanov_right_arm
	name="\improper Savannah-Ivanov right arm"
	desc="A Savannah-Ivanov left arm. Hidden rocket fabrication included in the wrists."
	icon_state = "savannah_ivanov_r_arm"

/obj/item/mecha_parts/part/savannah_ivanov_left_leg
	name="\improper Savannah-Ivanov left leg"
	desc="A Savannah-Ivanov left leg. In production they were designed to carry more than two passengers, so the leaping functionality was added as to not waste potential."
	icon_state = "savannah_ivanov_l_leg"

/obj/item/mecha_parts/part/savannah_ivanov_right_leg
	name="\improper Savannah-Ivanov right leg"
	desc="A Savannah-Ivanov left leg. In production they were designed to carry more than two passengers, so the leaping functionality was added as to not waste potential."
	icon_state = "savannah_ivanov_r_leg"

/obj/item/mecha_parts/part/savannah_ivanov_armor
	name="Savannah-Ivanov armor"
	desc="Savannah-Ivanov armor plates. They are uniquely shaped and reinforced to deal with the stresses of two pilots, grandiose leaps, and missiles."
	icon_state = "savannah_ivanov_armor"

///////// Circuitboards

/obj/item/circuitboard/mecha
	name = "glup shitto"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 7

/obj/item/circuitboard/mecha/ripley/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/ripley/main
	name = "glup shitto"
	icon_state = "mainboard"


/obj/item/circuitboard/mecha/gygax/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/targeting
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/gygax/main
	name = "glup shitto"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/durand/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/targeting
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/durand/main
	name = "glup shitto"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/honker/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/targeting
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/honker/main
	name = "glup shitto"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/odysseus/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/odysseus/main
	name = "glup shitto"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/phazon/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/targeting
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/phazon/main
	name = "glup shitto"

/obj/item/circuitboard/mecha/clarke/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/clarke/main
	name = "glup shitto"
	icon_state = "mainboard"

/obj/item/circuitboard/mecha/savannah_ivanov/peripherals
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/targeting
	name = "glup shitto"
	icon_state = "mcontroller"

/obj/item/circuitboard/mecha/savannah_ivanov/main
	name = "glup shitto"
	icon_state = "mainboard"
