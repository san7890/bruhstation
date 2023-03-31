
//Hat Station 13

/obj/item/clothing/head/collectable
	name = "glup shitto"
	desc = "A rare collectable hat."
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = null

/obj/item/clothing/head/collectable/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/series, /obj/item/clothing/head/collectable, "Super duper collectable hats")

/obj/item/clothing/head/collectable/petehat
	name = "glup shitto"
	desc = "It smells faintly of plasma."
	icon_state = "petehat"

/obj/item/clothing/head/collectable/xenom
	name = "glup shitto"
	desc = "Hiss hiss hiss!"
	clothing_flags = SNUG_FIT
	icon_state = "xenom"

/obj/item/clothing/head/collectable/chef
	name = "glup shitto"
	desc = "A rare chef's hat meant for hat collectors!"
	icon = 'icons/obj/clothing/head/utility.dmi'
	worn_icon = 'icons/mob/clothing/head/utility.dmi'
	icon_state = "chef"
	inhand_icon_state = "chefhat"
	dog_fashion = /datum/dog_fashion/head/chef

/obj/item/clothing/head/collectable/paper
	name = "glup shitto"
	desc = "What looks like an ordinary paper hat is actually a rare and valuable collector's edition paper hat. Keep away from water, fire, and Curators."
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "paper"
	dog_fashion = /datum/dog_fashion/head

/obj/item/clothing/head/collectable/tophat
	name = "glup shitto"
	desc = "A top hat worn by only the most prestigious hat collectors."
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "tophat"
	inhand_icon_state = "that"

/obj/item/clothing/head/collectable/captain
	name = "glup shitto"
	desc = "A collectable hat that'll make you look just like a real comdom!"
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "captain"
	inhand_icon_state = null
	dog_fashion = /datum/dog_fashion/head/captain

/obj/item/clothing/head/collectable/police
	name = "glup shitto"
	desc = "A collectable police officer's Hat. This hat emphasizes that you are THE LAW."
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "policehelm"
	dog_fashion = /datum/dog_fashion/head/warden

/obj/item/clothing/head/collectable/beret
	name = "glup shitto"
	desc = "A collectable red beret. It smells faintly of garlic."
	icon_state = "beret"
	greyscale_config = /datum/greyscale_config/beret
	greyscale_config_worn = /datum/greyscale_config/beret/worn
	greyscale_colors = "#972A2A"
	dog_fashion = /datum/dog_fashion/head/beret

/obj/item/clothing/head/collectable/welding
	name = "glup shitto"
	desc = "A collectable welding helmet. Now with 80% less lead! Not for actual welding. Any welding done while wearing this helmet is done so at the owner's own risk!"
	icon = 'icons/obj/clothing/head/utility.dmi'
	worn_icon = 'icons/mob/clothing/head/utility.dmi'
	icon_state = "welding"
	inhand_icon_state = "welding"
	lefthand_file = 'icons/mob/inhands/clothing/masks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/masks_righthand.dmi'
	clothing_flags = SNUG_FIT

/obj/item/clothing/head/collectable/slime
	name = "glup shitto"
	desc = "Just like a real brain slug!"
	icon_state = "headslime"
	inhand_icon_state = null
	clothing_flags = SNUG_FIT

/obj/item/clothing/head/collectable/flatcap
	name = "glup shitto"
	desc = "A collectible farmer's flat cap!"
	icon_state = "beret_flat"
	greyscale_config = /datum/greyscale_config/beret
	greyscale_config_worn = /datum/greyscale_config/beret/worn
	greyscale_colors = "#8F7654"
	inhand_icon_state = null

/obj/item/clothing/head/collectable/pirate
	name = "glup shitto"
	desc = "You'd make a great Dread Syndie Roberts!"
	icon_state = "pirate"
	inhand_icon_state = null
	dog_fashion = /datum/dog_fashion/head/pirate

/obj/item/clothing/head/collectable/kitty
	name = "glup shitto"
	desc = "The fur feels... a bit too realistic."
	icon_state = "kitty"
	inhand_icon_state = null
	dog_fashion = /datum/dog_fashion/head/kitty

/obj/item/clothing/head/collectable/rabbitears
	name = "glup shitto"
	desc = "Not as lucky as the feet!"
	icon_state = "bunny"
	inhand_icon_state = null
	dog_fashion = /datum/dog_fashion/head/rabbit

/obj/item/clothing/head/collectable/wizard
	name = "glup shitto"
	desc = "NOTE: Any magical powers gained from wearing this hat are purely coincidental."
	icon = 'icons/obj/clothing/head/wizard.dmi'
	worn_icon = 'icons/mob/clothing/head/wizard.dmi'
	icon_state = "wizard"
	dog_fashion = /datum/dog_fashion/head/blue_wizard

/obj/item/clothing/head/collectable/hardhat
	name = "glup shitto"
	desc = "WARNING! Offers no real protection, or luminosity, but damn, is it fancy!"
	icon = 'icons/obj/clothing/head/utility.dmi'
	worn_icon = 'icons/mob/clothing/head/utility.dmi'
	clothing_flags = SNUG_FIT
	icon_state = "hardhat0_yellow"
	inhand_icon_state = null
	dog_fashion = /datum/dog_fashion/head

/obj/item/clothing/head/collectable/hos
	name = "glup shitto"
	desc = "Now you too can beat prisoners, set silly sentences, and arrest for no reason!"
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "hoscap"

/obj/item/clothing/head/collectable/hop
	name = "glup shitto"
	desc = "It's your turn to demand excessive paperwork, signatures, stamps, and hire more clowns! Papers, please!"
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "hopcap"
	dog_fashion = /datum/dog_fashion/head/hop

/obj/item/clothing/head/collectable/thunderdome
	name = "glup shitto"
	desc = "Go Red! I mean Green! I mean Red! No Green!"
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	icon_state = "thunderdome"
	inhand_icon_state = "thunderdome_helmet"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEHAIR|HIDEHAIR

/obj/item/clothing/head/collectable/swat
	name = "glup shitto"
	desc = "That's not real blood. That's red paint." //Reference to the actual description
	icon = 'icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'icons/mob/clothing/head/helmet.dmi'
	icon_state = "swatsyndie"
	inhand_icon_state = "swatsyndie_helmet"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEHAIR
