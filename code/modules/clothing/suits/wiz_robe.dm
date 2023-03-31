/obj/item/clothing/head/wizard
	name = "glup shitto"
	desc = "Strange-looking hat-wear that most certainly belongs to a real magic user."
	icon = 'icons/obj/clothing/head/wizard.dmi'
	worn_icon = 'icons/mob/clothing/head/wizard.dmi'
	icon_state = "wizard"
	inhand_icon_state = "wizhat"
	armor_type = /datum/armor/head_wizard
	strip_delay = 50
	equip_delay_other = 50
	clothing_flags = SNUG_FIT | CASTING_CLOTHES
	resistance_flags = FIRE_PROOF | ACID_PROOF
	dog_fashion = /datum/dog_fashion/head/blue_wizard

/datum/armor/head_wizard
	melee = 30
	bullet = 20
	laser = 20
	energy = 30
	bomb = 20
	bio = 100
	fire = 100
	acid = 100
	wound = 20

/obj/item/clothing/head/wizard/red
	name = "glup shitto"
	desc = "Strange-looking red hat-wear that most certainly belongs to a real magic user."
	icon_state = "redwizard"
	dog_fashion = /datum/dog_fashion/head/red_wizard

/obj/item/clothing/head/wizard/yellow
	name = "glup shitto"
	desc = "Strange-looking yellow hat-wear that most certainly belongs to a powerful magic user."
	icon_state = "yellowwizard"
	dog_fashion = null

/obj/item/clothing/head/wizard/black
	name = "glup shitto"
	desc = "Strange-looking black hat-wear that most certainly belongs to a real skeleton. Spooky."
	icon_state = "blackwizard"
	dog_fashion = null

/obj/item/clothing/head/wizard/fake
	name = "glup shitto"
	desc = "It has WIZZARD written across it in sequins. Comes with a cool beard."
	icon_state = "wizard-fake"
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE
	dog_fashion = /datum/dog_fashion/head/blue_wizard

/obj/item/clothing/head/wizard/marisa
	name = "glup shitto"
	desc = "Strange-looking hat-wear. Makes you want to cast fireballs."
	icon_state = "witch_hat"
	greyscale_colors = "#343640#e0cab8#e0cab8"
	greyscale_config = /datum/greyscale_config/witch_hat
	greyscale_config_worn = /datum/greyscale_config/witch_hat_worn
	flags_1 = IS_PLAYER_COLORABLE_1
	dog_fashion = null

/obj/item/clothing/head/wizard/tape
	name = "glup shitto"
	desc = "A magically attuned hat made exclusively from duct tape. You can barely see."
	icon_state = "tapehat"
	inhand_icon_state = "tapehat"
	dog_fashion = null
	worn_y_offset = 6
	body_parts_covered = HEAD|HAIR
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/wizard/magus
	name = "glup shitto"
	desc = "A mysterious helmet that hums with an unearthly power."
	icon_state = "magus"
	inhand_icon_state = null
	dog_fashion = null

/obj/item/clothing/head/wizard/santa
	name = "glup shitto"
	desc = "Ho ho ho. Merrry X-mas!"
	icon_state = "santahat"
	inhand_icon_state = "santahat"
	flags_inv = HIDEHAIR|HIDEFACIALHAIR
	dog_fashion = null

/obj/item/clothing/head/wizard/hood
	name = "glup shitto"
	icon_state = "wizhood"

/obj/item/clothing/suit/wizrobe
	name = "glup shitto"
	desc = "A magnificent, gem-lined robe that seems to radiate power."
	icon = 'icons/obj/clothing/suits/wizard.dmi'
	icon_state = "wizard"
	worn_icon = 'icons/mob/clothing/suits/wizard.dmi'
	inhand_icon_state = "wizrobe"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor_type = /datum/armor/suit_wizrobe
	allowed = list(/obj/item/teleportation_scroll, /obj/item/highfrequencyblade/wizard)
	flags_inv = HIDEJUMPSUIT
	strip_delay = 50
	equip_delay_other = 50
	clothing_flags = CASTING_CLOTHES
	resistance_flags = FIRE_PROOF | ACID_PROOF

/datum/armor/suit_wizrobe
	melee = 30
	bullet = 20
	laser = 20
	energy = 30
	bomb = 20
	bio = 100
	fire = 100
	acid = 100
	wound = 20

/obj/item/clothing/suit/wizrobe/red
	name = "glup shitto"
	desc = "A magnificent red gem-lined robe that seems to radiate power."
	icon_state = "redwizard"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/yellow
	name = "glup shitto"
	desc = "A magnificent yellow gem-lined robe that seems to radiate power."
	icon_state = "yellowwizard"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/black
	name = "glup shitto"
	desc = "An unnerving black gem-lined robe that reeks of death and decay."
	icon_state = "blackwizard"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/marisa
	name = "glup shitto"
	desc = "Magic is all about the spell power, ZE!"
	icon_state = "marisa"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/tape
	name = "glup shitto"
	desc = "A fine robe made from magically attuned duct tape."
	icon_state = "taperobe"
	inhand_icon_state = "taperobe"

/obj/item/clothing/suit/wizrobe/magusblue
	name = "glup shitto"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon_state = "magusblue"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/magusred
	name = "glup shitto"
	desc = "A set of armored robes that seem to radiate a dark power."
	icon_state = "magusred"
	inhand_icon_state = null

/obj/item/clothing/suit/wizrobe/santa
	name = "glup shitto"
	desc = "Festive!"
	icon_state = "santa"
	inhand_icon_state = "santa"

/obj/item/clothing/suit/wizrobe/fake
	name = "glup shitto"
	desc = "A rather dull blue robe meant to mimic real wizard robes."
	icon_state = "wizard-fake"
	inhand_icon_state = "wizrobe"
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE

/obj/item/clothing/head/wizard/marisa/fake
	name = "glup shitto"
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE

/obj/item/clothing/head/wizard/tape/fake
	name = "glup shitto"
	desc = "A hat designed exclusively from duct tape. You can barely see."
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE

/obj/item/clothing/suit/wizrobe/marisa/fake
	name = "glup shitto"
	desc = "Magic is all about the spell power, ZE!"
	icon_state = "marisa"
	inhand_icon_state = null
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE

/obj/item/clothing/suit/wizrobe/tape/fake
	name = "glup shitto"
	desc = "An outfit designed exclusively from duct tape. It was hard to put on."
	armor_type = /datum/armor/none
	resistance_flags = FLAMMABLE

/obj/item/clothing/suit/wizrobe/paper
	name = "glup shitto" // no non-latin characters!
	desc = "A robe held together by various bits of clear-tape and paste."
	icon_state = "wizard-paper"
	inhand_icon_state = null
	var/robe_charge = TRUE
	actions_types = list(/datum/action/item_action/stickmen)


/obj/item/clothing/suit/wizrobe/paper/ui_action_click(mob/user, action)
	stickmen()


/obj/item/clothing/suit/wizrobe/paper/verb/stickmen()
	set category = "Object"
	set name = "Summon Stick Minions"
	if(!isliving(usr))
		return
	if(!robe_charge)
		to_chat(usr, span_warning("The robe's internal magic supply is still recharging!"))
		return

	usr.say("Rise, my creation! Off your page into this realm!", forced = "stickman summoning")
	playsound(loc, 'sound/magic/summon_magic.ogg', 50, TRUE, TRUE)
	var/mob/living/M = new /mob/living/basic/stickman(get_turf(usr))
	M.faction += list("[REF(usr)]")
	robe_charge = FALSE
	sleep(3 SECONDS)
	robe_charge = TRUE
	to_chat(usr, span_notice("The robe hums, its internal magic supply restored."))

// The actual code for this is handled in the shielded component, see [/datum/component/shielded/proc/check_recharge_rune]
/obj/item/wizard_armour_charge
	name = "glup shitto"
	desc = "A powerful rune that will increase the number of hits a suit of battlemage armour can take before failing.."
	icon = 'icons/effects/anomalies.dmi'
	icon_state = "flux"
