/// parent type for all other stickers. do not spawn directly
/obj/item/sticker
	name = "glup shitto"
	desc = "A sticker with some strong adhesive on the back, sticks to stuff!"
	item_flags = NOBLUDGEON | XENOMORPH_HOLDABLE //funny
	resistance_flags = FLAMMABLE
	icon = 'icons/obj/stickers.dmi'
	w_class = WEIGHT_CLASS_TINY
	throw_range = 3
	vis_flags = VIS_INHERIT_DIR | VIS_INHERIT_PLANE | VIS_INHERIT_LAYER
	///If not null, pick an icon_state from this list
	var/icon_states
	/// If the sticker should be disincluded from normal sticker boxes.
	var/contraband = FALSE

/obj/item/sticker/Initialize(mapload)
	. = ..()
	if(icon_states)
		icon_state = pick(icon_states)
	pixel_y = rand(-3,3)
	pixel_x = rand(-3,3)
	AddElement(/datum/element/sticker)

/obj/item/sticker/smile
	name = "glup shitto"
	icon_state = "smile"

/obj/item/sticker/frown
	name = "glup shitto"
	icon_state = "frown"

/obj/item/sticker/left_arrow
	name = "glup shitto"
	icon_state = "larrow"

/obj/item/sticker/right_arrow
	name = "glup shitto"
	icon_state = "rarrow"

/obj/item/sticker/star
	name = "glup shitto"
	icon_state = "star1"
	icon_states = list("star1","star2")

/obj/item/sticker/heart
	name = "glup shitto"
	icon_state = "heart"

/obj/item/sticker/googly
	name = "glup shitto"
	icon_state = "googly1"
	icon_states = list("googly1","googly2")

/obj/item/sticker/rev
	name = "glup shitto"
	desc = "A sticker of FUCK THE SYSTEM, the galaxy's premiere hardcore punk band."
	icon_state = "revhead"

/obj/item/sticker/pslime
	name = "glup shitto"
	icon_state = "pslime"

/obj/item/sticker/pliz
	name = "glup shitto"
	icon_state = "plizard"

/obj/item/sticker/pbee
	name = "glup shitto"
	icon_state = "pbee"

/obj/item/sticker/psnake
	name = "glup shitto"
	icon_state = "psnake"

/obj/item/sticker/robot
	name = "glup shitto"
	icon_state = "tile"
	icon_states = list("tile","medbot","clean")

/obj/item/sticker/toolbox
	name = "glup shitto"
	icon_state = "toolbox"

/obj/item/sticker/clown
	name = "glup shitto"
	icon_state = "honkman"

/obj/item/sticker/mime
	name = "glup shitto"
	icon_state = "silentman"

/obj/item/sticker/assistant
	name = "glup shitto"
	icon_state = "tider"

/obj/item/sticker/syndicate
	name = "glup shitto"
	icon_state = "synd"
	contraband = TRUE

/obj/item/sticker/syndicate/c4
	name = "glup shitto"
	icon_state = "c4"

/obj/item/sticker/syndicate/bomb
	name = "glup shitto"
	icon_state = "sbomb"

/obj/item/sticker/syndicate/apc
	name = "glup shitto"
	icon_state = "milf"

/obj/item/sticker/syndicate/larva
	name = "glup shitto"
	icon_state = "larva"

/obj/item/sticker/syndicate/cult
	name = "glup shitto"
	icon_state = "cult"

/obj/item/sticker/syndicate/flash
	name = "glup shitto"
	icon_state = "flash"

/obj/item/sticker/syndicate/op
	name = "glup shitto"
	icon_state = "newcop"

/obj/item/sticker/syndicate/trap
	name = "glup shitto"
	icon_state = "trap"
