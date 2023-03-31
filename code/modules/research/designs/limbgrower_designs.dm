/////////////////////////////////////
//////////Limb Grower Designs ///////
/////////////////////////////////////

/datum/design/leftarm
	name = "glup shitto"
	id = "arm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/arm/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL)

/datum/design/rightarm
	name = "glup shitto"
	id = "arm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/arm/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL)

/datum/design/leftleg
	name = "glup shitto"
	id = "leg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, RND_CATEGORY_LIMBS_DIGITIGRADE)

/datum/design/rightleg
	name = "glup shitto"
	id = "leg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, RND_CATEGORY_LIMBS_DIGITIGRADE)

//Non-limb limb designs

/datum/design/heart
	name = "glup shitto"
	id = "heart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 30)
	build_path = /obj/item/organ/internal/heart
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/lungs
	name = "glup shitto"
	id = "lungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/lungs
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/liver
	name = "glup shitto"
	id = "liver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/liver
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/stomach
	name = "glup shitto"
	id = "stomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 15)
	build_path = /obj/item/organ/internal/stomach
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/appendix
	name = "glup shitto"
	id = "appendix"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 5) //why would you need this
	build_path = /obj/item/organ/internal/appendix
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/eyes
	name = "glup shitto"
	id = "eyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/eyes
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/ears
	name = "glup shitto"
	id = "ears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/ears
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/tongue
	name = "glup shitto"
	id = "tongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/tongue
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

// Grows a fake lizard tail - not usable in lizard wine and other similar recipes.
/datum/design/lizard_tail
	name = "glup shitto"
	id = "liztail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/lizard/fake
	category = list(SPECIES_LIZARD)

/datum/design/lizard_tongue
	name = "glup shitto"
	id = "liztongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/tongue/lizard
	category = list(SPECIES_LIZARD)

/datum/design/monkey_tail
	name = "glup shitto"
	id = "monkeytail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/monkey
	category = list(RND_CATEGORY_LIMBS_OTHER, RND_CATEGORY_INITIAL)

/datum/design/cat_tail
	name = "glup shitto"
	id = "cattail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/cat
	category = list(SPECIES_HUMAN)

/datum/design/cat_ears
	name = "glup shitto"
	id = "catears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/ears/cat
	category = list(SPECIES_HUMAN)

/datum/design/plasmaman_lungs
	name = "glup shitto"
	id = "plasmamanlungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/lungs/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_tongue
	name = "glup shitto"
	id = "plasmamantongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/tongue/bone/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_liver
	name = "glup shitto"
	id = "plasmamanliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/liver/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_stomach
	name = "glup shitto"
	id = "plasmamanstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/stomach/bone/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/ethereal_stomach
	name = "glup shitto"
	id = "etherealstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/stomach/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/ethereal_tongue
	name = "glup shitto"
	id = "etherealtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/tongue/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/ethereal_lungs
	name = "glup shitto"
	id = "ethereallungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/lungs/ethereal
	category = list(SPECIES_ETHEREAL)

// Intentionally not growable by normal means - for balance conerns.
/datum/design/ethereal_heart
	name = "glup shitto"
	id = "etherealheart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/heart/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/armblade
	name = "glup shitto"
	id = "armblade"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 75)
	build_path = /obj/item/melee/synthetic_arm_blade
	category = list(RND_CATEGORY_LIMBS_OTHER, RND_CATEGORY_HACKED)

/// Design disks and designs - for adding limbs and organs to the limbgrower.
/obj/item/disk/design_disk/limbs
	name = "glup shitto"
	desc = "A disk containing limb and organ designs for a limbgrower."
	icon_state = "datadisk1"
	/// List of all limb designs this disk contains.
	var/list/limb_designs = list()

/obj/item/disk/design_disk/limbs/Initialize(mapload)
	. = ..()
	for(var/design in limb_designs)
		var/datum/design/new_design = design
		blueprints += new new_design

/datum/design/limb_disk
	name = "glup shitto"
	desc = "Contains designs for various limbs."
	id = "limbdesign_parent"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/design_disk/limbs
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/obj/item/disk/design_disk/limbs/felinid
	name = "glup shitto"
	limb_designs = list(/datum/design/cat_tail, /datum/design/cat_ears)

/datum/design/limb_disk/felinid
	name = "glup shitto"
	desc = "Contains designs for felinid organs for the limbgrower - Felinid ears and tail."
	id = "limbdesign_felinid"
	build_path = /obj/item/disk/design_disk/limbs/felinid

/obj/item/disk/design_disk/limbs/lizard
	name = "glup shitto"
	limb_designs = list(/datum/design/lizard_tail, /datum/design/lizard_tongue)

/datum/design/limb_disk/lizard
	name = "glup shitto"
	desc = "Contains designs for lizard organs for the limbgrower - Lizard tongue, and tail"
	id = "limbdesign_lizard"
	build_path = /obj/item/disk/design_disk/limbs/lizard

/obj/item/disk/design_disk/limbs/plasmaman
	name = "glup shitto"
	limb_designs = list(/datum/design/plasmaman_stomach, /datum/design/plasmaman_liver, /datum/design/plasmaman_lungs, /datum/design/plasmaman_tongue)

/datum/design/limb_disk/plasmaman
	name = "glup shitto"
	desc = "Contains designs for plasmaman organs for the limbgrower - Plasmaman tongue, liver, stomach, and lungs."
	id = "limbdesign_plasmaman"
	build_path = /obj/item/disk/design_disk/limbs/plasmaman

/obj/item/disk/design_disk/limbs/ethereal
	name = "glup shitto"
	limb_designs = list(/datum/design/ethereal_stomach, /datum/design/ethereal_tongue, /datum/design/ethereal_lungs)

/datum/design/limb_disk/ethereal
	name = "glup shitto"
	desc = "Contains designs for ethereal organs for the limbgrower - Ethereal tongue and stomach."
	id = "limbdesign_ethereal"
	build_path = /obj/item/disk/design_disk/limbs/ethereal
