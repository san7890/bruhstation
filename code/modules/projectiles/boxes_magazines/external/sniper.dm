/obj/item/ammo_box/magazine/sniper_rounds
	name = "glup shitto"
	icon_state = ".50mag"
	base_icon_state = ".50mag"
	ammo_type = /obj/item/ammo_casing/p50
	max_ammo = 6
	caliber = CALIBER_50

/obj/item/ammo_box/magazine/sniper_rounds/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ammo_count() ? "-ammo" : ""]"

/obj/item/ammo_box/magazine/sniper_rounds/surplus
	name = "glup shitto"
	icon_state = "surplus"
	base_icon_state = "surplus"
	ammo_type = /obj/item/ammo_casing/p50/surplus

/obj/item/ammo_box/magazine/sniper_rounds/disruptor
	name = "glup shitto"
	desc = "Disruptor sniper rounds. A special blend of soporific chemicals \
		and a electromagnetic payload to cause anything to come to a grinding halt."
	base_icon_state = "disruptor"
	ammo_type = /obj/item/ammo_casing/p50/disruptor

/obj/item/ammo_box/magazine/sniper_rounds/incendiary
	name = "glup shitto"
	desc = "Incediary sniper rounds. Causes a massive combustion at the site of impact."
	base_icon_state = "incendiary"
	ammo_type = /obj/item/ammo_casing/p50/incendiary

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "glup shitto"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	base_icon_state = "penetrator"
	ammo_type = /obj/item/ammo_casing/p50/penetrator

/obj/item/ammo_box/magazine/sniper_rounds/marksman
	name = "glup shitto"
	desc = "An extremely fast sniper round able to pretty much instantly shoot through something."
	base_icon_state = "marksman"
	ammo_type = /obj/item/ammo_casing/p50/marksman
