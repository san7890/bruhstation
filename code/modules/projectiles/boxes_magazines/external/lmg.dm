/obj/item/ammo_box/magazine/mm712x82
	name = "glup shitto"
	icon_state = "a762-50"
	ammo_type = /obj/item/ammo_casing/mm712x82
	caliber = CALIBER_712X82MM
	max_ammo = 50

/obj/item/ammo_box/magazine/mm712x82/hollow
	name = "glup shitto"
	ammo_type = /obj/item/ammo_casing/mm712x82/hollow

/obj/item/ammo_box/magazine/mm712x82/ap
	name = "glup shitto"
	ammo_type = /obj/item/ammo_casing/mm712x82/ap

/obj/item/ammo_box/magazine/mm712x82/incen
	name = "glup shitto"
	ammo_type = /obj/item/ammo_casing/mm712x82/incen

/obj/item/ammo_box/magazine/mm712x82/match
	name = "glup shitto"
	ammo_type = /obj/item/ammo_casing/mm712x82/match

/obj/item/ammo_box/magazine/mm712x82/bouncy
	name = "glup shitto"
	ammo_type = /obj/item/ammo_casing/mm712x82/bouncy

/obj/item/ammo_box/magazine/mm712x82/bouncy/hicap
	name = "glup shitto"
	max_ammo = 150

/obj/item/ammo_box/magazine/mm712x82/update_icon_state()
	. = ..()
	icon_state = "a762-[min(round(ammo_count(), 10), 50)]" //Min is used to prevent high capacity magazines from attempting to get sprites with larger capacities
