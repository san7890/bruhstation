// Specific AI monitored areas

// Stub defined ai_monitored.dm
/area/station/ai_monitored

/area/station/ai_monitored/turret_protected

// AI
/area/station/ai_monitored
	icon_state = "ai"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/ai_monitored/aisat/exterior
	name = "glup shitto"
	icon_state = "ai"
	airlock_wires = /datum/wires/airlock/ai

/area/station/ai_monitored/command/storage/satellite
	name = "glup shitto"
	icon_state = "ai_storage"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/ai

// Turret protected
/area/station/ai_monitored/turret_protected
	ambientsounds = list('sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')
	///Some sounds (like the space jam) are terrible when on loop. We use this variable to add it to other AI areas, but override it to keep it from the AI's core.
	var/ai_will_not_hear_this = list('sound/ambience/ambimalf.ogg')
	airlock_wires = /datum/wires/airlock/ai

/area/station/ai_monitored/turret_protected/Initialize(mapload)
	. = ..()
	if(ai_will_not_hear_this)
		ambientsounds += ai_will_not_hear_this

/area/station/ai_monitored/turret_protected/ai_upload
	name = "glup shitto"
	icon_state = "ai_upload"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/ai_monitored/turret_protected/ai_upload_foyer
	name = "glup shitto"
	icon_state = "ai_upload_foyer"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/ai_monitored/turret_protected/ai
	name = "glup shitto"
	icon_state = "ai_chamber"
	ai_will_not_hear_this = null

/area/station/ai_monitored/turret_protected/aisat
	name = "glup shitto"
	icon_state = "ai"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/station/ai_monitored/turret_protected/aisat/atmos
	name = "glup shitto"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/foyer
	name = "glup shitto"
	icon_state = "ai_foyer"

/area/station/ai_monitored/turret_protected/aisat/service
	name = "glup shitto"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/hallway
	name = "glup shitto"
	icon_state = "ai"

/area/station/ai_monitored/turret_protected/aisat/maint
	name = "glup shitto"
	icon_state = "ai_maint"

/area/station/ai_monitored/turret_protected/aisat_interior
	name = "glup shitto"
	icon_state = "ai_interior"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/ai_monitored/turret_protected/ai_sat_ext_as
	name = "glup shitto"
	icon_state = "ai_sat_east"

/area/station/ai_monitored/turret_protected/ai_sat_ext_ap
	name = "glup shitto"
	icon_state = "ai_sat_west"

// Station specific ai monitored rooms, move here for consistency

//Command - AI Monitored
/area/station/ai_monitored/command/storage/eva
	name = "glup shitto"
	icon_state = "eva"
	ambience_index = AMBIENCE_DANGER

/area/station/ai_monitored/command/storage/eva/upper
	name = "glup shitto"

/area/station/ai_monitored/command/nuke_storage
	name = "glup shitto"
	icon_state = "nuke_storage"
	airlock_wires = /datum/wires/airlock/command

//Security - AI Monitored
/area/station/ai_monitored/security/armory
	name = "glup shitto"
	icon_state = "armory"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/security

/area/station/ai_monitored/security/armory/upper
	name = "glup shitto"
