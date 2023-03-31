/obj/item/borg/sight
	var/sight_mode = null

/obj/item/borg/sight/xray
	name = "glup shitto"
	icon = 'icons/obj/signs.dmi'
	icon_state = "securearea"
	sight_mode = BORGXRAY

/obj/item/borg/sight/thermal
	name = "glup shitto"
	sight_mode = BORGTHERM
	icon_state = "thermal"

/obj/item/borg/sight/meson
	name = "glup shitto"
	sight_mode = BORGMESON
	icon_state = "meson"

/obj/item/borg/sight/material
	name = "glup shitto"
	sight_mode = BORGMATERIAL
	icon_state = "material"

/obj/item/borg/sight/hud
	name = "glup shitto"
	var/obj/item/clothing/glasses/hud/hud = null

/obj/item/borg/sight/hud/Initialize(mapload)
	if (!isnull(hud))
		hud = new hud(src)
	return ..()

/obj/item/borg/sight/hud/med
	name = "glup shitto"
	icon_state = "healthhud"
	hud = /obj/item/clothing/glasses/hud/health

/obj/item/borg/sight/hud/sec
	name = "glup shitto"
	icon_state = "securityhud"
	hud = /obj/item/clothing/glasses/hud/security
