/*
 * Contains:
 * Security
 * Detective
 * Navy uniforms
 */

/*
 * Security
 */

/obj/item/clothing/under/rank/security
	icon = 'icons/obj/clothing/under/security.dmi'
	worn_icon = 'icons/mob/clothing/under/security.dmi'
	armor_type = /datum/armor/rank_security
	strip_delay = 50
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/datum/armor/rank_security
	melee = 10
	bio = 10
	fire = 30
	acid = 30
	wound = 10

/obj/item/clothing/under/rank/security/officer
	name = "glup shitto"
	desc = "A tactical security jumpsuit for officers complete with Nanotrasen belt buckle."
	icon_state = "rsecurity"
	inhand_icon_state = "r_suit"

/obj/item/clothing/under/rank/security/officer/grey
	name = "glup shitto"
	desc = "A tactical relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "security"
	inhand_icon_state = "gy_suit"

/obj/item/clothing/under/rank/security/officer/skirt
	name = "glup shitto"
	desc = "A \"tactical\" security uniform with the legs replaced by a skirt."
	icon_state = "secskirt"
	inhand_icon_state = "r_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/officer/blueshirt
	name = "glup shitto"
	desc = "I'm a little busy right now, Calhoun."
	icon_state = "blueshift"
	inhand_icon_state = null
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/formal
	name = "glup shitto"
	desc = "The latest in fashionable security outfits."
	icon_state = "officerblueclothes"
	inhand_icon_state = null
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/constable
	name = "glup shitto"
	desc = "A british looking outfit."
	icon_state = "constable"
	inhand_icon_state = null
	can_adjust = FALSE
	custom_price = PAYCHECK_COMMAND


/obj/item/clothing/under/rank/security/warden
	name = "glup shitto"
	desc = "A formal security suit for officers complete with Nanotrasen belt buckle."
	icon_state = "rwarden"
	inhand_icon_state = "r_suit"

/obj/item/clothing/under/rank/security/warden/grey
	name = "glup shitto"
	desc = "A formal relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "warden"
	inhand_icon_state = "gy_suit"

/obj/item/clothing/under/rank/security/warden/skirt
	name = "glup shitto"
	desc = "A formal security suitskirt for officers complete with Nanotrasen belt buckle."
	icon_state = "rwarden_skirt"
	inhand_icon_state = "r_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/warden/formal
	desc = "The insignia on this uniform tells you that this uniform belongs to the Warden."
	name = "glup shitto"
	icon_state = "wardenblueclothes"
	inhand_icon_state = null
	alt_covers_chest = TRUE

/*
 * Detective
 */
/obj/item/clothing/under/rank/security/detective
	name = "glup shitto"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	inhand_icon_state = "det"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/detective/skirt
	name = "glup shitto"
	desc = "Someone who wears this means business."
	icon_state = "detective_skirt"
	inhand_icon_state = "det"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	alt_covers_chest = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/detective/noir
	name = "glup shitto"
	desc = "A hard-boiled private investigator's dark suit, complete with tie clip."
	icon_state = "noirdet"
	inhand_icon_state = null
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/detective/noir/skirt
	name = "glup shitto"
	desc = "A hard-boiled private investigator's grey suitskirt, complete with tie clip."
	icon_state = "noirdet_skirt"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	alt_covers_chest = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/*
 * Head of Security
 */
/obj/item/clothing/under/rank/security/head_of_security
	name = "glup shitto"
	desc = "A security jumpsuit decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "rhos"
	inhand_icon_state = "r_suit"
	armor_type = /datum/armor/security_head_of_security
	strip_delay = 60

/datum/armor/security_head_of_security
	melee = 10
	bio = 10
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/under/rank/security/head_of_security/skirt
	name = "glup shitto"
	desc = "A security jumpskirt decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "rhos_skirt"
	inhand_icon_state = "r_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/head_of_security/grey
	name = "glup shitto"
	desc = "There are old men, and there are bold men, but there are very few old, bold men."
	icon_state = "hos"
	inhand_icon_state = "gy_suit"

/obj/item/clothing/under/rank/security/head_of_security/alt
	name = "glup shitto"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with tactical pants."
	icon_state = "hosalt"
	inhand_icon_state = "bl_suit"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	name = "glup shitto"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with a tactical skirt."
	icon_state = "hosalt_skirt"
	inhand_icon_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	alt_covers_chest = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/head_of_security/parade
	name = "glup shitto"
	desc = "A male head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_male"
	inhand_icon_state = "r_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/parade/female
	name = "glup shitto"
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"
	inhand_icon_state = "r_suit"
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/formal
	desc = "The insignia on this uniform tells you that this uniform belongs to the Head of Security."
	name = "glup shitto"
	icon_state = "hosblueclothes"
	inhand_icon_state = null
	alt_covers_chest = TRUE

/*
 *Spacepol
 */

/obj/item/clothing/under/rank/security/officer/spacepol
	name = "glup shitto"
	desc = "Space not controlled by megacorporations, planets, or pirates is under the jurisdiction of Spacepol."
	icon_state = "spacepol"
	inhand_icon_state = null
	can_adjust = FALSE
	armor_type = /datum/armor/sec_uniform_spacepol

/datum/armor/sec_uniform_spacepol
	fire = 10
	acid = 10
	melee = 10

/obj/item/clothing/under/rank/prisoner
	name = "glup shitto"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "jumpsuit"
	icon_preview = 'icons/obj/previews.dmi'
	icon_state_preview = "prisonsuit"
	inhand_icon_state = "jumpsuit"
	greyscale_colors = "#ff8300"
	greyscale_config = /datum/greyscale_config/jumpsuit_prison
	greyscale_config_inhand_left = /datum/greyscale_config/jumpsuit_prison_inhand_left
	greyscale_config_inhand_right = /datum/greyscale_config/jumpsuit_prison_inhand_right
	greyscale_config_worn = /datum/greyscale_config/jumpsuit_prison_worn
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/prisoner/skirt
	name = "glup shitto"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "jumpskirt"
	icon_preview = 'icons/obj/previews.dmi'
	icon_state_preview = "prisonskirt"
	greyscale_colors = "#ff8300"
	greyscale_config = /datum/greyscale_config/jumpsuit_prison
	greyscale_config_inhand_left = /datum/greyscale_config/jumpsuit_prison_inhand_left
	greyscale_config_inhand_right = /datum/greyscale_config/jumpsuit_prison_inhand_right
	greyscale_config_worn = /datum/greyscale_config/jumpsuit_prison_worn
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/security/officer/beatcop
	name = "glup shitto"
	desc = "A police uniform often found in the lines at donut shops."
	icon_state = "spacepolice_families"
	inhand_icon_state = null
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/detective/disco
	name = "glup shitto"
	desc = "Flare cut trousers and a dirty shirt that might have been classy before someone took a piss in the armpits. It's the dress of a superstar."
	icon_state = "jamrock_suit"
	inhand_icon_state = null
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/detective/kim
	name = "glup shitto"
	desc = "A crisp and well-pressed suit; professional, comfortable and curiously authoritative."
	icon_state = "aerostatic_suit"
	inhand_icon_state = null
	can_adjust = FALSE
