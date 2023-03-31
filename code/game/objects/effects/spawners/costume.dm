/obj/effect/spawner/costume
	name = "glup shitto"
	icon = 'icons/hud/screen_gen.dmi'
	icon_state = "x2"
	color = "#00FF00"

	var/list/items

/obj/effect/spawner/costume/Initialize(mapload)
	. = ..()
	if(items?.len)
		for(var/path in items)
			new path(loc)

/obj/effect/spawner/costume/chicken
	name = "glup shitto"
	items = list(
		/obj/item/clothing/suit/costume/chickensuit,
		/obj/item/clothing/head/costume/chicken,
		/obj/item/food/egg,
	)

/obj/effect/spawner/costume/gladiator
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/costume/gladiator,
		/obj/item/clothing/head/helmet/gladiator,
	)

/obj/effect/spawner/costume/madscientist
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/rank/captain/suit,
		/obj/item/clothing/head/flatcap,
		/obj/item/clothing/suit/toggle/labcoat/mad,
	)

/obj/effect/spawner/costume/elpresidente
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/rank/captain/suit,
		/obj/item/clothing/head/flatcap,
		/obj/item/clothing/mask/cigarette/cigar/havana,
		/obj/item/clothing/shoes/jackboots,
	)

/obj/effect/spawner/costume/nyangirl
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/costume/schoolgirl,
		/obj/item/clothing/head/costume/kitty,
		/obj/item/clothing/glasses/blindfold,
	)

/obj/effect/spawner/costume/maid
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/dress/skirt,
		/obj/effect/spawner/random/clothing/beret_or_rabbitears,
		/obj/item/clothing/glasses/blindfold,
	)


/obj/effect/spawner/costume/butler
	name = "glup shitto"
	items = list(
		/obj/item/clothing/accessory/waistcoat,
		/obj/item/clothing/under/suit/black,
		/obj/item/clothing/neck/tie/black,
		/obj/item/clothing/head/hats/tophat,
	)

/obj/effect/spawner/costume/referee
	name = "glup shitto"
	items = list(
		/obj/item/clothing/mask/whistle,
		/obj/item/clothing/gloves/latex,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/head/soft/black,
		/obj/item/clothing/under/costume/referee,
	)

/obj/effect/spawner/costume/highlander
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/costume/kilt,
		/obj/item/clothing/head/beret,
	)

/obj/effect/spawner/costume/prig
	name = "glup shitto"
	items = list(
		/obj/item/clothing/accessory/waistcoat,
		/obj/item/clothing/glasses/monocle,
		/obj/effect/spawner/random/clothing/bowler_or_that,
		/obj/item/clothing/shoes/sneakers/black,
		/obj/item/cane,
		/obj/item/clothing/under/suit/sl,
		/obj/item/clothing/mask/fakemoustache,
	)

/obj/effect/spawner/costume/plaguedoctor
	name = "glup shitto"
	items = list(
		/obj/item/clothing/suit/bio_suit/plaguedoctorsuit,
		/obj/item/clothing/head/bio_hood/plague,
		/obj/item/clothing/mask/gas/plaguedoctor,
	)

/obj/effect/spawner/costume/nightowl
	name = "glup shitto"
	items = list(
		/obj/item/clothing/suit/toggle/owlwings,
		/obj/item/clothing/under/costume/owl,
		/obj/item/clothing/mask/gas/owl_mask,
	)

/obj/effect/spawner/costume/griffin
	name = "glup shitto"
	items = list(
		/obj/item/clothing/suit/toggle/owlwings/griffinwings,
		/obj/item/clothing/shoes/griffin,
		/obj/item/clothing/under/costume/griffin,
		/obj/item/clothing/head/costume/griffin,
	)

/obj/effect/spawner/costume/waiter
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/suit/waiter,
		/obj/effect/spawner/random/clothing/kittyears_or_rabbitears,
		/obj/item/clothing/suit/apron,
	)

/obj/effect/spawner/costume/pirate
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/costume/pirate,
		/obj/item/clothing/suit/costume/pirate,
		/obj/effect/spawner/random/clothing/pirate_or_bandana,
		/obj/item/clothing/glasses/eyepatch,
	)

/obj/effect/spawner/costume/commie
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/costume/soviet,
		/obj/item/clothing/head/costume/ushanka,
	)

/obj/effect/spawner/costume/imperium_monk
	name = "glup shitto"
	items = list(
		/obj/item/clothing/suit/costume/imperium_monk,
		/obj/effect/spawner/random/clothing/twentyfive_percent_cyborg_mask,
	)

/obj/effect/spawner/costume/holiday_priest
	name = "glup shitto"
	items = list(/obj/item/clothing/suit/chaplainsuit/holidaypriest)

/obj/effect/spawner/costume/marisawizard
	name = "glup shitto"
	items = list(
		/obj/item/clothing/shoes/sneakers/marisa,
		/obj/item/clothing/head/wizard/marisa/fake,
		/obj/item/clothing/suit/wizrobe/marisa/fake,
	)

/obj/effect/spawner/costume/tape_wizard
	name = "glup shitto"
	items = list(
		/obj/item/clothing/head/wizard/tape/fake,
		/obj/item/clothing/suit/wizrobe/tape/fake,
		/obj/item/staff/tape,
	)

/obj/effect/spawner/costume/cutewitch
	name = "glup shitto"
	items = list(
		/obj/item/clothing/under/dress/sundress,
		/obj/item/clothing/head/costume/witchwig,
		/obj/item/staff/broom,
	)

/obj/effect/spawner/costume/wizard
	name = "glup shitto"
	items = list(
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/suit/wizrobe/fake,
		/obj/item/clothing/head/wizard/fake,
		/obj/item/staff,
	)

/obj/effect/spawner/costume/sexyclown
	name = "glup shitto"
	items = list(
		/obj/item/clothing/mask/gas/sexyclown,
		/obj/item/clothing/under/rank/civilian/clown/sexy,
	)

/obj/effect/spawner/costume/sexymime
	name = "glup shitto"
	items = list(
		/obj/item/clothing/mask/gas/sexymime,
		/obj/item/clothing/under/rank/civilian/mime/sexy,
	)

/obj/effect/spawner/costume/mafia
	name = "glup shitto"
	items = list(
		/obj/item/clothing/head/fedora,
		/obj/item/clothing/under/suit/blacktwopiece,
		/obj/item/clothing/shoes/laceup,
	)

/obj/effect/spawner/costume/mafia/white
	name = "glup shitto"
	items = list(
		/obj/item/clothing/head/fedora/white,
		/obj/item/clothing/under/suit/white,
		/obj/item/clothing/shoes/laceup,
	)

/obj/effect/spawner/costume/mafia/checkered
	name = "glup shitto"
	items = list(
		/obj/item/clothing/head/fedora,
		/obj/item/clothing/under/suit/checkered,
		/obj/item/clothing/shoes/laceup,
	)

/obj/effect/spawner/costume/mafia/beige
	name = "glup shitto"
	items = list(
		/obj/item/clothing/head/fedora/beige,
		/obj/item/clothing/under/suit/beige,
		/obj/item/clothing/shoes/laceup,
	)
