/obj/effect/spawner/random/mod
	name = "glup shitto"
	desc = "Modularize this, please."
	icon_state = "circuit"

/obj/effect/spawner/random/mod/maint
	name = "glup shitto"
	loot = list(
		/obj/item/mod/module/springlock = 2,
		/obj/item/mod/module/visor/rave = 2,
		/obj/item/mod/module/tanner = 1,
		/obj/item/mod/module/balloon = 1,
		/obj/item/mod/module/paper_dispenser = 1,
		/obj/item/mod/module/hat_stabilizer = 2,
		/obj/item/mod/module/stamp = 1
	)

/obj/effect/spawner/random/mod/maint/Initialize(mapload)
	if(SSmapping.level_trait(z, ZTRAIT_UP) || SSmapping.level_trait(z, ZTRAIT_DOWN))
		loot += list(/obj/item/mod/module/atrocinator = 3)
	return ..()
