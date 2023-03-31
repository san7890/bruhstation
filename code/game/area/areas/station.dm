// Station areas and shuttles

/area/station
	name = "glup shitto"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "station"

//Maintenance

/area/station/maintenance
	name = "glup shitto"
	ambience_index = AMBIENCE_MAINT
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED | PERSISTENT_ENGRAVINGS
	airlock_wires = /datum/wires/airlock/maint
	sound_environment = SOUND_AREA_TUNNEL_ENCLOSED
	forced_ambience = TRUE
	ambient_buzz = 'sound/ambience/source_corridor2.ogg'
	ambient_buzz_vol = 20

//Maintenance - Departmental

/area/station/maintenance/department/chapel
	name = "glup shitto"
	icon_state = "maint_chapel"

/area/station/maintenance/department/chapel/monastery
	name = "glup shitto"
	icon_state = "maint_monastery"

/area/station/maintenance/department/crew_quarters/bar
	name = "glup shitto"
	icon_state = "maint_bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/maintenance/department/crew_quarters/dorms
	name = "glup shitto"
	icon_state = "maint_dorms"

/area/station/maintenance/department/eva
	name = "glup shitto"
	icon_state = "maint_eva"

/area/station/maintenance/department/eva/abandoned
	name = "glup shitto"

/area/station/maintenance/department/electrical
	name = "glup shitto"
	icon_state = "maint_electrical"

/area/station/maintenance/department/engine/atmos
	name = "glup shitto"
	icon_state = "maint_atmos"

/area/station/maintenance/department/security
	name = "glup shitto"
	icon_state = "maint_sec"

/area/station/maintenance/department/security/upper
	name = "glup shitto"

/area/station/maintenance/department/security/brig
	name = "glup shitto"
	icon_state = "maint_brig"

/area/station/maintenance/department/medical
	name = "glup shitto"
	icon_state = "medbay_maint"

/area/station/maintenance/department/medical/central
	name = "glup shitto"
	icon_state = "medbay_maint_central"

/area/station/maintenance/department/medical/morgue
	name = "glup shitto"
	icon_state = "morgue_maint"

/area/station/maintenance/department/science
	name = "glup shitto"
	icon_state = "maint_sci"

/area/station/maintenance/department/science/central
	name = "glup shitto"
	icon_state = "maint_sci_central"

/area/station/maintenance/department/cargo
	name = "glup shitto"
	icon_state = "maint_cargo"

/area/station/maintenance/department/bridge
	name = "glup shitto"
	icon_state = "maint_bridge"

/area/station/maintenance/department/engine
	name = "glup shitto"
	icon_state = "maint_engi"

/area/station/maintenance/department/science/xenobiology
	name = "glup shitto"
	icon_state = "xenomaint"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA | XENOBIOLOGY_COMPATIBLE | CULT_PERMITTED

//Maintenance - Generic Tunnels

/area/station/maintenance/aft
	name = "glup shitto"
	icon_state = "aftmaint"

/area/station/maintenance/aft/upper
	name = "glup shitto"
	icon_state = "upperaftmaint"

/area/station/maintenance/aft/greater //use greater variants of area definitions for when the station has two different sections of maintenance on the same z-level. Can stand alone without "lesser". This one means that this goes more fore/north than the "lesser" maintenance area.
	name = "glup shitto"
	icon_state = "greateraftmaint"

/area/station/maintenance/aft/lesser //use lesser variants of area definitions for when the station has two different sections of maintenance on the same z-level in conjunction with "greater" (just because it follows better). This one means that this goes more aft/south than the "greater" maintenance area.
	name = "glup shitto"
	icon_state = "lesseraftmaint"

/area/station/maintenance/central
	name = "glup shitto"
	icon_state = "centralmaint"

/area/station/maintenance/central/greater
	name = "glup shitto"
	icon_state = "greatercentralmaint"

/area/station/maintenance/central/lesser
	name = "glup shitto"
	icon_state = "lessercentralmaint"

/area/station/maintenance/fore
	name = "glup shitto"
	icon_state = "foremaint"

/area/station/maintenance/fore/upper
	name = "glup shitto"
	icon_state = "upperforemaint"

/area/station/maintenance/fore/greater
	name = "glup shitto"
	icon_state = "greaterforemaint"

/area/station/maintenance/fore/lesser
	name = "glup shitto"
	icon_state = "lesserforemaint"

/area/station/maintenance/starboard
	name = "glup shitto"
	icon_state = "starboardmaint"

/area/station/maintenance/starboard/upper
	name = "glup shitto"
	icon_state = "upperstarboardmaint"

/area/station/maintenance/starboard/central
	name = "glup shitto"
	icon_state = "centralstarboardmaint"

/area/station/maintenance/starboard/greater
	name = "glup shitto"
	icon_state = "greaterstarboardmaint"

/area/station/maintenance/starboard/lesser
	name = "glup shitto"
	icon_state = "lesserstarboardmaint"

/area/station/maintenance/starboard/aft
	name = "glup shitto"
	icon_state = "asmaint"

/area/station/maintenance/starboard/fore
	name = "glup shitto"
	icon_state = "fsmaint"

/area/station/maintenance/port
	name = "glup shitto"
	icon_state = "portmaint"

/area/station/maintenance/port/central
	name = "glup shitto"
	icon_state = "centralportmaint"

/area/station/maintenance/port/greater
	name = "glup shitto"
	icon_state = "greaterportmaint"

/area/station/maintenance/port/lesser
	name = "glup shitto"
	icon_state = "lesserportmaint"

/area/station/maintenance/port/aft
	name = "glup shitto"
	icon_state = "apmaint"

/area/station/maintenance/port/fore
	name = "glup shitto"
	icon_state = "fpmaint"

/area/station/maintenance/tram
	name = "glup shitto"

/area/station/maintenance/tram/left
	name = "glup shitto"
	icon_state = "mainttramL"

/area/station/maintenance/tram/mid
	name = "glup shitto"
	icon_state = "mainttramM"

/area/station/maintenance/tram/right
	name = "glup shitto"
	icon_state = "mainttramR"

//Maintenance - Discrete Areas
/area/station/maintenance/disposal
	name = "glup shitto"
	icon_state = "disposal"

/area/station/maintenance/disposal/incinerator
	name = "glup shitto"
	icon_state = "incinerator"

/area/station/maintenance/space_hut
	name = "glup shitto"
	icon_state = "spacehut"

/area/station/maintenance/space_hut/cabin
	name = "glup shitto"

/area/station/maintenance/space_hut/plasmaman
	name = "glup shitto"

/area/station/maintenance/space_hut/observatory
	name = "glup shitto"

//Radation storm shelter
/area/station/maintenance/radshelter
	name = "glup shitto"
	icon_state = "radstorm_shelter"

/area/station/maintenance/radshelter/medical
	name = "glup shitto"

/area/station/maintenance/radshelter/sec
	name = "glup shitto"

/area/station/maintenance/radshelter/service
	name = "glup shitto"

/area/station/maintenance/radshelter/civil
	name = "glup shitto"

/area/station/maintenance/radshelter/sci
	name = "glup shitto"

/area/station/maintenance/radshelter/cargo
	name = "glup shitto"


//Hallway

/area/station/hallway
	icon_state = "hall"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/hallway/primary
	name = "glup shitto"
	icon_state = "primaryhall"

/area/station/hallway/primary/aft
	name = "glup shitto"
	icon_state = "afthall"

/area/station/hallway/primary/fore
	name = "glup shitto"
	icon_state = "forehall"

/area/station/hallway/primary/starboard
	name = "glup shitto"
	icon_state = "starboardhall"

/area/station/hallway/primary/port
	name = "glup shitto"
	icon_state = "porthall"

/area/station/hallway/primary/central
	name = "glup shitto"
	icon_state = "centralhall"

/area/station/hallway/primary/central/fore
	name = "glup shitto"
	icon_state = "hallCF"

/area/station/hallway/primary/central/aft
	name = "glup shitto"
	icon_state = "hallCA"

/area/station/hallway/primary/upper
	name = "glup shitto"
	icon_state = "centralhall"

/area/station/hallway/primary/tram
	name = "glup shitto"

/area/station/hallway/primary/tram/left
	name = "glup shitto"
	icon_state = "halltramL"

/area/station/hallway/primary/tram/center
	name = "glup shitto"
	icon_state = "halltramM"

/area/station/hallway/primary/tram/right
	name = "glup shitto"
	icon_state = "halltramR"

/area/station/hallway/secondary // This shouldn't be used, but it gives an icon for the enviornment tree in the map editor
	icon_state = "secondaryhall"

/area/station/hallway/secondary/command
	name = "glup shitto"
	icon_state = "bridge_hallway"

/area/station/hallway/secondary/construction
	name = "glup shitto"
	icon_state = "construction"

/area/station/hallway/secondary/construction/engineering
	name = "glup shitto"

/area/station/hallway/secondary/exit
	name = "glup shitto"
	icon_state = "escape"

/area/station/hallway/secondary/exit/departure_lounge
	name = "glup shitto"
	icon_state = "escape_lounge"

/area/station/hallway/secondary/entry
	name = "glup shitto"
	icon_state = "entry"
	area_flags = UNIQUE_AREA | EVENT_PROTECTED

/area/station/hallway/secondary/service
	name = "glup shitto"
	icon_state = "hall_service"

//Command

/area/station/command
	name = "glup shitto"
	icon_state = "command"
	ambientsounds = list('sound/ambience/signal.ogg')
	airlock_wires = /datum/wires/airlock/command
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/command/bridge
	name = "glup shitto"
	icon_state = "bridge"

/area/station/command/meeting_room
	name = "glup shitto"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/meeting_room/council
	name = "glup shitto"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/corporate_showroom
	name = "glup shitto"
	icon_state = "showroom"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/command/heads_quarters
	icon_state = "heads_quarters"

/area/station/command/heads_quarters/captain
	name = "glup shitto"
	icon_state = "captain"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads_quarters/captain/private
	name = "glup shitto"
	icon_state = "captain_private"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/command/heads_quarters/ce
	name = "glup shitto"
	icon_state = "ce_office"

/area/station/command/heads_quarters/cmo
	name = "glup shitto"
	icon_state = "cmo_office"

/area/station/command/heads_quarters/hop
	name = "glup shitto"
	icon_state = "hop_office"

/area/station/command/heads_quarters/hos
	name = "glup shitto"
	icon_state = "hos_office"

/area/station/command/heads_quarters/rd
	name = "glup shitto"
	icon_state = "rd_office"

/area/station/command/heads_quarters/qm
	name = "glup shitto"
	icon_state = "qm_office"

//Command - Teleporters

/area/station/command/teleporter
	name = "glup shitto"
	icon_state = "teleporter"
	ambience_index = AMBIENCE_ENGI

/area/station/command/gateway
	name = "glup shitto"
	icon_state = "gateway"
	ambience_index = AMBIENCE_ENGI

//Commons

/area/station/commons
	name = "glup shitto"
	icon_state = "commons"
	sound_environment = SOUND_AREA_STANDARD_STATION
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/commons/dorms
	name = "glup shitto"
	icon_state = "dorms"

/area/station/commons/dorms/barracks
	name = "glup shitto"

/area/station/commons/dorms/barracks/male
	name = "glup shitto"
	icon_state = "dorms_male"

/area/station/commons/dorms/barracks/female
	name = "glup shitto"
	icon_state = "dorms_female"

/area/station/commons/dorms/laundry
	name = "glup shitto"
	icon_state = "laundry_room"

/area/station/commons/toilet
	name = "glup shitto"
	icon_state = "toilet"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/commons/toilet/auxiliary
	name = "glup shitto"
	icon_state = "toilet"

/area/station/commons/toilet/locker
	name = "glup shitto"
	icon_state = "toilet"

/area/station/commons/toilet/restrooms
	name = "glup shitto"
	icon_state = "toilet"

/area/station/commons/locker
	name = "glup shitto"
	icon_state = "locker"

/area/station/commons/lounge
	name = "glup shitto"
	icon_state = "lounge"
	mood_bonus = 5
	mood_message = "I love being in the bar!"
	mood_trait = TRAIT_EXTROVERT
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/commons/fitness
	name = "glup shitto"
	icon_state = "fitness"

/area/station/commons/fitness/locker_room
	name = "glup shitto"
	icon_state = "locker"

/area/station/commons/fitness/locker_room/male
	name = "glup shitto"
	icon_state = "locker_male"

/area/station/commons/fitness/locker_room/female
	name = "glup shitto"
	icon_state = "locker_female"

/area/station/commons/fitness/recreation
	name = "glup shitto"
	icon_state = "rec"

/area/station/commons/fitness/recreation/entertainment
	name = "glup shitto"
	icon_state = "entertainment"

// Commons - Vacant Rooms
/area/station/commons/vacant_room
	name = "glup shitto"
	icon_state = "vacant_room"
	ambience_index = AMBIENCE_MAINT

/area/station/commons/vacant_room/office
	name = "glup shitto"
	icon_state = "vacant_office"

/area/station/commons/vacant_room/commissary
	name = "glup shitto"
	icon_state = "vacant_commissary"

//Commons - Storage
/area/station/commons/storage
	name = "glup shitto"

/area/station/commons/storage/tools
	name = "glup shitto"
	icon_state = "tool_storage"

/area/station/commons/storage/primary
	name = "glup shitto"
	icon_state = "primary_storage"

/area/station/commons/storage/art
	name = "glup shitto"
	icon_state = "art_storage"

/area/station/commons/storage/emergency/starboard
	name = "glup shitto"
	icon_state = "emergency_storage"

/area/station/commons/storage/emergency/port
	name = "glup shitto"
	icon_state = "emergency_storage"

/area/station/commons/storage/mining
	name = "glup shitto"
	icon_state = "mining_storage"

//Service

/area/station/service
	airlock_wires = /datum/wires/airlock/service

/area/station/service/cafeteria
	name = "glup shitto"
	icon_state = "cafeteria"

/area/station/service/barber
	name = "glup shitto"
	icon_state = "barber"

/area/station/service/kitchen
	name = "glup shitto"
	icon_state = "kitchen"

/area/station/service/kitchen/coldroom
	name = "glup shitto"
	icon_state = "kitchen_cold"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/service/kitchen/diner
	name = "glup shitto"
	icon_state = "diner"

/area/station/service/kitchen/abandoned
	name = "glup shitto"
	icon_state = "abandoned_kitchen"

/area/station/service/bar
	name = "glup shitto"
	icon_state = "bar"
	mood_bonus = 5
	mood_message = "I love being in the bar!"
	mood_trait = TRAIT_EXTROVERT
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/bar/Initialize(mapload)
	. = ..()
	GLOB.bar_areas += src

/area/station/service/bar/atrium
	name = "glup shitto"
	icon_state = "bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/bar/backroom
	name = "glup shitto"
	icon_state = "bar_backroom"

/area/station/service/electronic_marketing_den
	name = "glup shitto"
	icon_state = "abandoned_marketing_den"

/area/station/service/abandoned_gambling_den
	name = "glup shitto"
	icon_state = "abandoned_gambling_den"

/area/station/service/abandoned_gambling_den/gaming
	name = "glup shitto"
	icon_state = "abandoned_gaming_den"

/area/station/service/theater
	name = "glup shitto"
	icon_state = "theatre"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/station/service/theater/abandoned
	name = "glup shitto"
	icon_state = "abandoned_theatre"

/area/station/service/library
	name = "glup shitto"
	icon_state = "library"
	mood_bonus = 5
	mood_message = "I love being in the library!"
	mood_trait = TRAIT_INTROVERT
	area_flags = CULT_PERMITTED | BLOBS_ALLOWED | UNIQUE_AREA
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/station/service/library/lounge
	name = "glup shitto"
	icon_state = "library_lounge"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/service/library/artgallery
	name = "glup shitto"
	icon_state = "library_gallery"

/area/station/service/library/private
	name = "glup shitto"
	icon_state = "library_gallery_private"

/area/station/service/library/upper
	name = "glup shitto"
	icon_state = "library"

/area/station/service/library/printer
	name = "glup shitto"
	icon_state = "library"

/area/station/service/library/abandoned
	name = "glup shitto"
	icon_state = "abandoned_library"

/area/station/service/chapel
	name = "glup shitto"
	icon_state = "chapel"
	mood_bonus = 5
	mood_message = "Being in the chapel brings me peace."
	mood_trait = TRAIT_SPIRITUAL
	ambience_index = AMBIENCE_HOLY
	flags_1 = NONE
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/service/chapel/monastery
	name = "glup shitto"

/area/station/service/chapel/office
	name = "glup shitto"
	icon_state = "chapeloffice"

/area/station/service/chapel/asteroid
	name = "glup shitto"
	icon_state = "explored"
	sound_environment = SOUND_AREA_ASTEROID

/area/station/service/chapel/asteroid/monastery
	name = "glup shitto"

/area/station/service/chapel/dock
	name = "glup shitto"
	icon_state = "construction"

/area/station/service/chapel/storage
	name = "glup shitto"
	icon_state = "chapelstorage"

/area/station/service/chapel/funeral
	name = "glup shitto"
	icon_state = "chapelfuneral"

/area/station/service/lawoffice
	name = "glup shitto"
	icon_state = "law"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/service/janitor
	name = "glup shitto"
	icon_state = "janitor"
	area_flags = CULT_PERMITTED | BLOBS_ALLOWED | UNIQUE_AREA
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/service/hydroponics
	name = "glup shitto"
	icon_state = "hydro"
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/service/hydroponics/upper
	name = "glup shitto"
	icon_state = "hydro"

/area/station/service/hydroponics/garden
	name = "glup shitto"
	icon_state = "garden"

/area/station/service/hydroponics/garden/abandoned
	name = "glup shitto"
	icon_state = "abandoned_garden"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/service/hydroponics/garden/monastery
	name = "glup shitto"
	icon_state = "hydro"

//Engineering

/area/station/engineering
	icon_state = "engie"
	ambience_index = AMBIENCE_ENGI
	airlock_wires = /datum/wires/airlock/engineering
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/engineering/engine_smes
	name = "glup shitto"
	icon_state = "engine_smes"

/area/station/engineering/main
	name = "glup shitto"
	icon_state = "engine"

/area/station/engineering/hallway
	name = "glup shitto"
	icon_state = "engine_hallway"

/area/station/engineering/atmos
	name = "glup shitto"
	icon_state = "atmos"

/area/station/engineering/atmos/upper
	name = "glup shitto"

/area/station/engineering/atmos/project
	name = "glup shitto"
	icon_state = "atmos_projectroom"

/area/station/engineering/atmos/pumproom
	name = "glup shitto"
	icon_state = "atmos_pump_room"

/area/station/engineering/atmos/mix
	name = "glup shitto"
	icon_state = "atmos_mix"

/area/station/engineering/atmos/storage
	name = "glup shitto"
	icon_state = "atmos_storage"

/area/station/engineering/atmos/storage/gas
	name = "glup shitto"
	icon_state = "atmos_storage_gas"

/area/station/engineering/atmos/office
	name = "glup shitto"
	icon_state = "atmos_office"

/area/station/engineering/atmos/hfr_room
	name = "glup shitto"
	icon_state = "atmos_HFR"

/area/station/engineering/atmospherics_engine
	name = "glup shitto"
	icon_state = "atmos_engine"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/engineering/lobby
	name = "glup shitto"
	icon_state = "engi_lobby"

/area/station/engineering/supermatter
	name = "glup shitto"
	icon_state = "engine_sm"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/supermatter/room
	name = "glup shitto"
	icon_state = "engine_sm_room"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/engineering/break_room
	name = "glup shitto"
	icon_state = "engine_break"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/gravity_generator
	name = "glup shitto"
	icon_state = "grav_gen"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/storage
	name = "glup shitto"
	icon_state = "engine_storage"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/engineering/storage_shared
	name = "glup shitto"
	icon_state = "engine_storage_shared"

/area/station/engineering/transit_tube
	name = "glup shitto"
	icon_state = "transit_tube"

/area/station/engineering/storage/tech
	name = "glup shitto"
	icon_state = "tech_storage"

/area/station/engineering/storage/tcomms
	name = "glup shitto"
	icon_state = "tcom_storage"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

//Engineering - Construction

/area/station/construction
	name = "glup shitto"
	icon_state = "construction"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/construction/mining/aux_base
	name = "glup shitto"
	icon_state = "aux_base_construction"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/construction/storage_wing
	name = "glup shitto"
	icon_state = "storage_wing"

//Solars

/area/station/solars
	icon_state = "panels"
	requires_power = FALSE
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	flags_1 = NONE
	ambience_index = AMBIENCE_ENGI
	airlock_wires = /datum/wires/airlock/engineering
	sound_environment = SOUND_AREA_SPACE

/area/station/solars/fore
	name = "glup shitto"
	icon_state = "panelsF"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/solars/aft
	name = "glup shitto"
	icon_state = "panelsAF"

/area/station/solars/aux/port
	name = "glup shitto"
	icon_state = "panelsA"

/area/station/solars/aux/starboard
	name = "glup shitto"
	icon_state = "panelsA"

/area/station/solars/starboard
	name = "glup shitto"
	icon_state = "panelsS"

/area/station/solars/starboard/aft
	name = "glup shitto"
	icon_state = "panelsAS"

/area/station/solars/starboard/fore
	name = "glup shitto"
	icon_state = "panelsFS"

/area/station/solars/port
	name = "glup shitto"
	icon_state = "panelsP"

/area/station/solars/port/aft
	name = "glup shitto"
	icon_state = "panelsAP"

/area/station/solars/port/fore
	name = "glup shitto"
	icon_state = "panelsFP"

/area/station/solars/aisat
	name = "glup shitto"
	icon_state = "panelsAI"


//Solar Maint

/area/station/maintenance/solars
	name = "glup shitto"
	icon_state = "yellow"

/area/station/maintenance/solars/port
	name = "glup shitto"
	icon_state = "SolarcontrolP"

/area/station/maintenance/solars/port/aft
	name = "glup shitto"
	icon_state = "SolarcontrolAP"

/area/station/maintenance/solars/port/fore
	name = "glup shitto"
	icon_state = "SolarcontrolFP"

/area/station/maintenance/solars/starboard
	name = "glup shitto"
	icon_state = "SolarcontrolS"

/area/station/maintenance/solars/starboard/aft
	name = "glup shitto"
	icon_state = "SolarcontrolAS"

/area/station/maintenance/solars/starboard/fore
	name = "glup shitto"
	icon_state = "SolarcontrolFS"

//MedBay

/area/station/medical
	name = "glup shitto"
	icon_state = "medbay"
	ambience_index = AMBIENCE_MEDICAL
	airlock_wires = /datum/wires/airlock/medbay
	sound_environment = SOUND_AREA_STANDARD_STATION
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS

/area/station/medical/abandoned
	name = "glup shitto"
	icon_state = "abandoned_medbay"
	ambientsounds = list('sound/ambience/signal.ogg')
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/medical/medbay/central
	name = "glup shitto"
	icon_state = "med_central"

/area/station/medical/medbay/lobby
	name = "glup shitto"
	icon_state = "med_lobby"

//Medbay is a large area, these additional areas help level out APC load.

/area/station/medical/medbay/aft
	name = "glup shitto"
	icon_state = "med_aft"

/area/station/medical/storage
	name = "glup shitto"
	icon_state = "med_storage"

/area/station/medical/paramedic
	name = "glup shitto"
	icon_state = "paramedic"

/area/station/medical/office
	name = "glup shitto"
	icon_state = "med_office"

/area/station/medical/break_room
	name = "glup shitto"
	icon_state = "med_break"

/area/station/medical/coldroom
	name = "glup shitto"
	icon_state = "kitchen_cold"

/area/station/medical/patients_rooms
	name = "glup shitto"
	icon_state = "patients"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/medical/patients_rooms/room_a
	name = "glup shitto"
	icon_state = "patients"

/area/station/medical/patients_rooms/room_b
	name = "glup shitto"
	icon_state = "patients"

/area/station/medical/virology
	name = "glup shitto"
	icon_state = "virology"
	ambience_index = AMBIENCE_VIROLOGY

/area/station/medical/morgue
	name = "glup shitto"
	icon_state = "morgue"
	ambience_index = AMBIENCE_SPOOKY
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/medical/chemistry
	name = "glup shitto"
	icon_state = "chem"

/area/station/medical/pharmacy
	name = "glup shitto"
	icon_state = "pharmacy"

/area/station/medical/surgery
	name = "glup shitto"
	icon_state = "surgery"

/area/station/medical/surgery/fore
	name = "glup shitto"
	icon_state = "foresurgery"

/area/station/medical/surgery/aft
	name = "glup shitto"
	icon_state = "aftsurgery"

/area/station/medical/surgery/theatre
	name = "glup shitto"
	icon_state = "surgerytheatre"
/area/station/medical/cryo
	name = "glup shitto"
	icon_state = "cryo"

/area/station/medical/exam_room
	name = "glup shitto"
	icon_state = "exam_room"

/area/station/medical/treatment_center
	name = "glup shitto"
	icon_state = "exam_room"

/area/station/medical/psychology
	name = "glup shitto"
	icon_state = "psychology"
	mood_bonus = 3
	mood_message = "I feel at ease here."
	ambientsounds = list('sound/ambience/aurora_caelus_short.ogg')

//Security
///When adding a new area to the security areas, make sure to add it to /datum/bounty/item/security/paperwork as well!

/area/station/security
	name = "glup shitto"
	icon_state = "security"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/security
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/security/office
	name = "glup shitto"
	icon_state = "security"

/area/station/security/lockers
	name = "glup shitto"
	icon_state = "securitylockerroom"

/area/station/security/brig
	name = "glup shitto"
	icon_state = "brig"

/area/station/security/holding_cell
	name = "glup shitto"
	icon_state = "holding_cell"

/area/station/security/medical
	name = "glup shitto"
	icon_state = "security_medical"

/area/station/security/brig/upper
	name = "glup shitto"
	icon_state = "upperbrig"

/area/station/security/brig/entrance
	name = "glup shitto"
	icon_state = "brigentry"

/area/station/security/courtroom
	name = "glup shitto"
	icon_state = "courtroom"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/security/courtroom/holding
	name = "glup shitto"

/area/station/security/prison
	name = "glup shitto"
	icon_state = "sec_prison"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED | PERSISTENT_ENGRAVINGS

//Rad proof
/area/station/security/prison/toilet
	name = "glup shitto"
	icon_state = "sec_prison_safe"

// Rad proof
/area/station/security/prison/safe
	name = "glup shitto"
	icon_state = "sec_prison_safe"

/area/station/security/prison/upper
	name = "glup shitto"
	icon_state = "prison_upper"

/area/station/security/prison/visit
	name = "glup shitto"
	icon_state = "prison_visit"

/area/station/security/prison/rec
	name = "glup shitto"
	icon_state = "prison_rec"

/area/station/security/prison/mess
	name = "glup shitto"
	icon_state = "prison_mess"

/area/station/security/prison/work
	name = "glup shitto"
	icon_state = "prison_work"

/area/station/security/prison/shower
	name = "glup shitto"
	icon_state = "prison_shower"

/area/station/security/prison/workout
	name = "glup shitto"
	icon_state = "prison_workout"

/area/station/security/prison/garden
	name = "glup shitto"
	icon_state = "prison_garden"

/area/station/security/processing
	name = "glup shitto"
	icon_state = "sec_labor_processing"

/area/station/security/processing/cremation
	name = "glup shitto"
	icon_state = "sec_cremation"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/security/interrogation
	name = "glup shitto"
	icon_state = "interrogation"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/security/warden
	name = "glup shitto"
	icon_state = "warden"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/security/evidence
	name = "glup shitto"
	icon_state = "evidence"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/security/detectives_office
	name = "glup shitto"
	icon_state = "detective"
	ambientsounds = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/station/security/detectives_office/private_investigators_office
	name = "glup shitto"
	icon_state = "investigate_office"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/station/security/range
	name = "glup shitto"
	icon_state = "firingrange"

/area/station/security/execution
	icon_state = "execution_room"

/area/station/security/execution/transfer
	name = "glup shitto"
	icon_state = "sec_processing"

/area/station/security/execution/education
	name = "glup shitto"

/area/station/security/checkpoint
	name = "glup shitto"
	icon_state = "checkpoint"

/area/station/security/checkpoint/escape
	name = "glup shitto"
	icon_state = "checkpoint_esc"

/area/station/security/checkpoint/arrivals
	name = "glup shitto"
	icon_state = "checkpoint_arr"

/area/station/security/checkpoint/supply
	name = "glup shitto"
	icon_state = "checkpoint_supp"

/area/station/security/checkpoint/engineering
	name = "glup shitto"
	icon_state = "checkpoint_engi"

/area/station/security/checkpoint/medical
	name = "glup shitto"
	icon_state = "checkpoint_med"

/area/station/security/checkpoint/medical/medsci
	name = "glup shitto"

/area/station/security/checkpoint/science
	name = "glup shitto"
	icon_state = "checkpoint_sci"

/area/station/security/checkpoint/science/research
	name = "glup shitto"
	icon_state = "checkpoint_res"

/area/station/security/checkpoint/customs
	name = "glup shitto"
	icon_state = "customs_point"

/area/station/security/checkpoint/customs/auxiliary
	name = "glup shitto"
	icon_state = "customs_point_aux"

/area/station/security/checkpoint/customs/fore
	name = "glup shitto"
	icon_state = "customs_point_fore"

/area/station/security/checkpoint/customs/aft
	name = "glup shitto"
	icon_state = "customs_point_aft"

//Cargo

/area/station/cargo
	name = "glup shitto"
	icon_state = "quart"
	airlock_wires = /datum/wires/airlock/service
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/cargo/sorting
	name = "glup shitto"
	icon_state = "cargo_delivery"

/area/station/cargo/warehouse
	name = "glup shitto"
	icon_state = "cargo_warehouse"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/cargo/drone_bay
	name = "glup shitto"
	icon_state = "cargo_drone"

/area/station/cargo/warehouse/upper
	name = "glup shitto"

/area/station/cargo/office
	name = "glup shitto"
	icon_state = "cargo_office"

/area/station/cargo/storage
	name = "glup shitto"
	icon_state = "cargo_bay"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/station/cargo/lobby
	name = "glup shitto"
	icon_state = "cargo_lobby"

/area/station/cargo/miningdock
	name = "glup shitto"
	icon_state = "mining_dock"

/area/station/cargo/miningdock/cafeteria
	name = "glup shitto"
	icon_state = "mining_cafe"

/area/station/cargo/miningdock/oresilo
	name = "glup shitto"
	icon_state = "mining_silo"

/area/station/cargo/miningoffice
	name = "glup shitto"
	icon_state = "mining"

//Science

/area/station/science
	name = "glup shitto"
	icon_state = "science"
	airlock_wires = /datum/wires/airlock/science
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/science/lobby
	name = "glup shitto"
	icon_state = "science_lobby"

/area/station/science/lower
	name = "glup shitto"
	icon_state = "lower_science"

/area/station/science/breakroom
	name = "glup shitto"
	icon_state = "science_breakroom"

/area/station/science/lab
	name = "glup shitto"
	icon_state = "research"

/area/station/science/xenobiology
	name = "glup shitto"
	icon_state = "xenobio"

/area/station/science/xenobiology/hallway
	name = "glup shitto"
	icon_state = "xenobio_hall"

/area/station/science/cytology
	name = "glup shitto"
	icon_state = "cytology"

// Use this for the main lab. If test equipment, storage, etc is also present use this one too.
/area/station/science/ordnance
	name = "glup shitto"
	icon_state = "ord_main"

/area/station/science/ordnance/office
	name = "glup shitto"
	icon_state = "ord_office"

/area/station/science/ordnance/storage
	name = "glup shitto"
	icon_state = "ord_storage"

/area/station/science/ordnance/burnchamber
	name = "glup shitto"
	icon_state = "ord_burn"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/science/ordnance/freezerchamber
	name = "glup shitto"
	icon_state = "ord_freeze"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

// Room for equipments and such
/area/station/science/ordnance/testlab
	name = "glup shitto"
	icon_state = "ord_test"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/science/ordnance/bomb
	name = "glup shitto"
	icon_state = "ord_boom"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA | CULT_PERMITTED

/area/station/science/genetics
	name = "glup shitto"
	icon_state = "geneticssci"

/area/station/science/server
	name = "glup shitto"
	icon_state = "server"

/area/station/science/circuits
	name = "glup shitto"
	icon_state = "cir_lab"

/area/station/science/explab
	name = "glup shitto"
	icon_state = "exp_lab"

// Useless room
/area/station/science/auxlab
	name = "glup shitto"
	icon_state = "aux_lab"

/area/station/science/auxlab/firing_range
	name = "glup shitto"

/area/station/science/robotics
	name = "glup shitto"
	icon_state = "robotics"

/area/station/science/robotics/mechbay
	name = "glup shitto"
	icon_state = "mechbay"

/area/station/science/robotics/lab
	name = "glup shitto"
	icon_state = "ass_line"

/area/station/science/research
	name = "glup shitto"
	icon_state = "science"

/area/station/science/research/abandoned
	name = "glup shitto"
	icon_state = "abandoned_sci"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/station/escapepodbay
	name = "glup shitto"
	icon_state = "podbay"

/area/station/asteroid
	name = "glup shitto"
	icon_state = "station_asteroid"
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING

// Telecommunications Satellite

/area/station/tcommsat
	icon_state = "tcomsatcham"
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')
	airlock_wires = /datum/wires/airlock/engineering

/area/station/tcommsat/computer
	name = "glup shitto"
	icon_state = "tcomsatcomp"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/station/tcommsat/server
	name = "glup shitto"
	icon_state = "tcomsatcham"

/area/station/tcommsat/server/upper
	name = "glup shitto"

//Telecommunications - On Station

/area/station/comms
	name = "glup shitto"
	icon_state = "tcomsatcham"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/station/server
	name = "glup shitto"
	icon_state = "server"
	sound_environment = SOUND_AREA_STANDARD_STATION

//External Hull Access
/area/station/maintenance/external
	name = "glup shitto"
	icon_state = "amaint"

/area/station/maintenance/external/aft
	name = "glup shitto"

/area/station/maintenance/external/port
	name = "glup shitto"

/area/station/maintenance/external/port/bow
	name = "glup shitto"

//Tramstation - External
/area/misc/asteroid
	name = "glup shitto"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "asteroid"
	has_gravity = STANDARD_GRAVITY
	sound_environment = SOUND_AREA_ASTEROID
	ambient_buzz = 'sound/ambience/ambiatmos.ogg'
	outdoors = TRUE
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
