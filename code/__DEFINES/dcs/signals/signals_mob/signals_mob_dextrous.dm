// Contains signals relating to governing simple/basic mobs with dextrous elements.

/// Called from Dextrous Guardians (/mob/living/basic/guardian/dextrous/Recall or /mob/living/basic/guardian/dextrous/snapback) on the guardian when they are forced to move by either the summoner or the game.
#define COMSIG_DEXTROUS_FORCED_MOVE "dextrous_forced_move"

/// Called from Dextrous Guardians (/mob/living/basic/guardian/dextrous/equip_to_slot) on the guardian whenever they are told to handle the exact mechanics of equipping an item to a slot.
#define COMSIG_DEXTROUS_EQUIP_TO_SLOT "dextrous_equip_to_slot"

/// Called from Dextrous Guardians on the guardian whenever we want them to update the icons in their HUD for whatever it is in their "internal storage" slot.
#define COMSIG_DEXTROUS_UPDATE_INTERNAL_STORAGE "dextrous_update_internal_storage"

