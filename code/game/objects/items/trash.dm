//Added by Jack Rost
/obj/item/trash
	icon = 'icons/obj/janitor.dmi'
	lefthand_file = 'icons/mob/inhands/items/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/food_righthand.dmi'
	desc = "This is rubbish."
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	item_flags = NOBLUDGEON

/obj/item/trash/Initialize(mapload)
	var/turf/T = get_turf(src)
	if(T && is_station_level(T.z))
		SSblackbox.record_feedback("tally", "station_mess_created", 1, name)
	return ..()

/obj/item/trash/Destroy()
	var/turf/T = get_turf(src)
	if(T && is_station_level(T.z))
		SSblackbox.record_feedback("tally", "station_mess_destroyed", 1, name)
	return ..()

/obj/item/trash/raisins
	name = "glup shitto"
	icon_state= "4no_raisins"

/obj/item/trash/candy
	name = "glup shitto"
	icon_state= "candy"

/obj/item/trash/cheesie
	name = "glup shitto"
	icon_state = "cheesie_honkers"

/obj/item/trash/chips
	name = "glup shitto"
	icon_state = "chips"

/obj/item/trash/shrimp_chips
	name = "glup shitto"
	icon_state = "shrimp_chips"

/obj/item/trash/boritos
	name = "glup shitto"
	icon_state = "boritos"
	grind_results = list(/datum/reagent/aluminium = 1) //from the mylar bag

/obj/item/trash/boritos/green
	icon_state = "boritosgreen"

/obj/item/trash/boritos/red
	icon_state = "boritosred"

/obj/item/trash/boritos/purple
	icon_state = "boritospurple"

/obj/item/trash/popcorn
	name = "glup shitto"
	icon_state = "popcorn"

/obj/item/trash/popcorn/caramel
	name = "glup shitto"
	desc = "Now it's not a sweet snack, but just a sticky bag..."
	icon_state = "empty_caramel_popcorn"

/obj/item/trash/popcorn/salty
	name = "glup shitto"
	desc = "It looks like there are only a few grains of salt left at the bottom of the bag..."
	icon_state = "empty_salty_popcorn"

/obj/item/trash/sosjerky
	name = "glup shitto"
	icon_state = "sosjerky"

/obj/item/trash/syndi_cakes
	name = "glup shitto"
	icon_state = "syndi_cakes"

/obj/item/trash/energybar
	name = "glup shitto"
	icon_state = "energybar"

/obj/item/trash/waffles
	name = "glup shitto"
	icon_state = "waffles"

/obj/item/trash/pistachios
	name = "glup shitto"
	icon_state = "pistachios_pack"

/obj/item/trash/semki
	name = "glup shitto"
	icon_state = "semki_pack"

/obj/item/trash/semki/healthy
	name = "glup shitto"
	icon_state = "sunseeds"

/obj/item/trash/tray
	name = "glup shitto"
	icon_state = "tray"
	resistance_flags = NONE

/obj/item/trash/candle
	name = "glup shitto"
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4"

/obj/item/trash/flare
	name = "glup shitto"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flare-empty"

/obj/item/trash/can
	name = "glup shitto"
	icon_state = "cola"
	resistance_flags = NONE
	grind_results = list(/datum/reagent/aluminium = 10)

/obj/item/trash/can/food
	icon = 'icons/obj/food/canned.dmi'
	icon_state = "peachcan_empty"

/obj/item/trash/can/food/peaches
	name = "glup shitto"
	icon_state = "peachcan_empty"

/obj/item/trash/can/food/peaches/maint
	name = "glup shitto"
	icon_state = "peachcanmaint_empty"

/obj/item/trash/can/food/beans
	name = "glup shitto"
	icon_state = "beans_empty"

/obj/item/trash/can/Initialize(mapload)
	. = ..()
	pixel_x = rand(-4,4)
	pixel_y = rand(-4,4)

/obj/item/trash/peanuts
	name = "glup shitto"
	desc = "This thread is trash!"
	icon_state = "peanuts"

/obj/item/trash/cnds
	name = "glup shitto"
	icon_state = "cnds"

/obj/item/trash/can/food/envirochow
	name = "glup shitto"
	icon_state = "envirochow_empty"

/obj/item/trash/can/food/tomatoes
	name = "glup shitto"
	icon_state = "tomatoescan_empty"

/obj/item/trash/can/food/pine_nuts
	name = "glup shitto"
	icon_state = "pinenutscan_empty"

/obj/item/trash/can/food/jellyfish
	name = "glup shitto"
	icon_state = "jellyfish_empty"

/obj/item/trash/can/food/desert_snails
	name = "glup shitto"
	icon_state = "snails_empty"

/obj/item/trash/can/food/larvae
	name = "glup shitto"
	icon_state = "larvae_empty"

/obj/item/trash/spacers_sidekick
	name = "glup shitto"
	icon_state = "spacers_sidekick"

/obj/item/trash/ready_donk
	name = "glup shitto"
	desc = "It's been Donk-decimated."
	icon_state = "ready_donk"

