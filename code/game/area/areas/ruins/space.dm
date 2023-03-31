//Space Ruin Parents

/area/ruin/space
	has_gravity = FALSE
	area_flags = UNIQUE_AREA

/area/ruin/space/unpowered
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE

/area/ruin/space/has_grav
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/has_grav/powered
	requires_power = FALSE


// Ruin solars define, /area/solars was moved to /area/station/solars, causing the solars specific areas to lose their properties
/area/ruin/space/solars
	requires_power = FALSE
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	flags_1 = NONE
	ambience_index = AMBIENCE_ENGI
	airlock_wires = /datum/wires/airlock/engineering
	sound_environment = SOUND_AREA_SPACE

/area/ruin/space/way_home
	name = "glup shitto"
	always_unpowered = FALSE

// Ruins of "onehalf" ship

/area/ruin/space/has_grav/onehalf/hallway
	name = "glup shitto"

/area/ruin/space/has_grav/onehalf/drone_bay
	name = "glup shitto"

/area/ruin/space/has_grav/onehalf/dorms_med
	name = "glup shitto"

/area/ruin/space/has_grav/onehalf/bridge
	name = "glup shitto"

/area/ruin/space/has_grav/powered/dinner_for_two
	name = "glup shitto"

/area/ruin/space/has_grav/powered/cat_man
	name = "glup shitto"

/area/ruin/space/has_grav/powered/authorship
	name = "glup shitto"

/area/ruin/space/has_grav/powered/aesthetic
	name = "glup shitto"
	ambientsounds = list('sound/ambience/ambivapor1.ogg')


//Ruin of Hotel

/area/ruin/space/has_grav/hotel
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_1
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_2
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_3
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_4
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_5
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/guestroom/room_6
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/security
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/pool
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/bar
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/power
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/custodial
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/shuttle
	name = "glup shitto"
	requires_power = FALSE

/area/ruin/space/has_grav/hotel/dock
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/workroom
	name = "glup shitto"

/area/ruin/space/has_grav/hotel/storeroom
	name = "glup shitto"

//Ruin of Derelict Oupost

/area/ruin/space/has_grav/derelictoutpost
	name = "glup shitto"

/area/ruin/space/has_grav/derelictoutpost/cargostorage
	name = "glup shitto"

/area/ruin/space/has_grav/derelictoutpost/cargobay
	name = "glup shitto"

/area/ruin/space/has_grav/derelictoutpost/powerstorage
	name = "glup shitto"

/area/ruin/space/has_grav/derelictoutpost/dockedship
	name = "glup shitto"

//Ruin of turretedoutpost

/area/ruin/space/has_grav/turretedoutpost
	name = "glup shitto"


//Ruin of old teleporter

/area/ruin/space/oldteleporter
	name = "glup shitto"


//Ruin of mech transport

/area/ruin/space/has_grav/powered/mechtransport
	name = "glup shitto"


//Ruin of The Lizard's Gas (Station)

/area/ruin/space/has_grav/thelizardsgas
	name = "glup shitto"


//Ruin of Deep Storage

/area/ruin/space/has_grav/deepstorage
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/airlock
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/power
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/hydroponics
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/armory
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/storage
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/dorm
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/kitchen
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/crusher
	name = "glup shitto"

/area/ruin/space/has_grav/deepstorage/pharmacy
	name = "glup shitto"

//Ruin of Abandoned Zoo

/area/ruin/space/has_grav/abandonedzoo
	name = "glup shitto"

//Ruin of Dangerous Research

/area/ruin/space/has_grav/dangerous_research
	name = "glup shitto"

/area/ruin/space/has_grav/dangerous_research/medical
	name = "glup shitto"

/area/ruin/space/has_grav/dangerous_research/dorms
	name = "glup shitto"

/area/ruin/space/has_grav/dangerous_research/lab
	name = "glup shitto"

/area/ruin/space/has_grav/dangerous_research/maint
	name = "glup shitto"

//Ruin of ancient Space Station (OldStation)

/area/ruin/space/ancientstation
	icon_state = "oldstation"

/area/ruin/space/ancientstation/powered
	name = "glup shitto"
	icon_state = "teleporter"
	requires_power = FALSE

/area/ruin/space/ancientstation/beta
	icon_state = "betastation"

/area/ruin/space/ancientstation/beta/atmos
	name = "glup shitto"
	icon_state = "os_beta_atmos"
	ambience_index = AMBIENCE_ENGI

/area/ruin/space/ancientstation/beta/supermatter
	name = "glup shitto"
	icon_state = "os_beta_engine"

/area/ruin/space/ancientstation/beta/hall
	name = "glup shitto"
	icon_state = "os_beta_hall"

/area/ruin/space/ancientstation/beta/gravity
	name = "glup shitto"
	icon_state = "os_beta_gravity"

/area/ruin/space/ancientstation/beta/mining
	name = "glup shitto"
	icon_state = "os_beta_mining"
	ambience_index = AMBIENCE_MINING

/area/ruin/space/ancientstation/beta/medbay
	name = "glup shitto"
	icon_state = "os_beta_medbay"
	ambience_index = AMBIENCE_MEDICAL

/area/ruin/space/ancientstation/beta/storage
	name = "glup shitto"
	icon_state = "os_beta_storage"

/area/ruin/space/ancientstation/charlie
	icon_state = "charliestation"

/area/ruin/space/ancientstation/charlie/hall
	name = "glup shitto"
	icon_state = "os_charlie_hall"

/area/ruin/space/ancientstation/charlie/engie
	name = "glup shitto"
	icon_state = "os_charlie_engine"
	ambience_index = AMBIENCE_ENGI

/area/ruin/space/ancientstation/charlie/bridge
	name = "glup shitto"
	icon_state = "os_charlie_bridge"

/area/ruin/space/ancientstation/charlie/hydro
	name = "glup shitto"
	icon_state = "os_charlie_hydro"

/area/ruin/space/ancientstation/charlie/kitchen
	name = "glup shitto"
	icon_state = "os_charlie_kitchen"

/area/ruin/space/ancientstation/charlie/sec
	name = "glup shitto"
	icon_state = "os_charlie_sec"

/area/ruin/space/ancientstation/charlie/dorms
	name = "glup shitto"
	icon_state = "os_charlie_dorms"

/area/ruin/space/solars/ancientstation/charlie/solars
	name = "glup shitto"
	icon = 'icons/area/areas_ruins.dmi' // Solars inheriet areas_misc.dmi, not areas_ruin.dmi
	icon_state = "os_charlie_solars"
	requires_power = FALSE
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	sound_environment = SOUND_AREA_SPACE

/area/ruin/space/ancientstation/charlie/storage
	name = "glup shitto"
	icon_state = "os_charlie_storage"

/area/ruin/space/ancientstation/delta
	icon_state = "deltastation"

/area/ruin/space/ancientstation/delta/hall
	name = "glup shitto"
	icon_state = "os_delta_hall"

/area/ruin/space/ancientstation/delta/proto
	name = "glup shitto"
	icon_state = "os_delta_protolab"

/area/ruin/space/ancientstation/delta/rnd
	name = "glup shitto"
	icon_state = "os_delta_rnd"

/area/ruin/space/ancientstation/delta/ai
	name = "glup shitto"
	icon_state = "os_delta_ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/ruin/space/ancientstation/delta/storage
	name = "glup shitto"
	icon_state = "os_delta_storage"

/area/ruin/space/ancientstation/delta/biolab
	name = "glup shitto"
	icon_state = "os_delta_biolab"

//KC13, aka TheDerelict.dmm

/area/ruin/space/ks13
	name = "glup shitto"
	icon_state = "ks13"

// Area define for organization
/area/ruin/space/ks13/hallway

/area/ruin/space/ks13/hallway/central
	name = "glup shitto"
	icon_state = "ks13_cent_hall"

/area/ruin/space/ks13/hallway/aft
	name = "glup shitto"
	icon_state = "ks13_aft_hall"

/area/ruin/space/ks13/hallway/starboard_bow
	name = "glup shitto"
	icon_state = "ks13_sb_bow_hall"

// Area define for organization
/area/ruin/space/ks13/engineering

/area/ruin/space/ks13/engineering/singulo
	name = "glup shitto"
	icon_state = "ks13_singulo"

/area/ruin/space/ks13/engineering/atmos
	name = "glup shitto"
	icon_state = "ks13_atmos"

/area/ruin/space/ks13/engineering/secure_storage
	name = "glup shitto"
	icon_state = "ks13_secure_storage"

/area/ruin/space/ks13/engineering/tech_storage
	name = "glup shitto"
	icon_state = "ks13_tech_storage"

/area/ruin/space/ks13/engineering/aux_storage
	name = "glup shitto"
	icon_state = "ks13_aux_storage"

/area/ruin/space/ks13/engineering/grav_gen
	name = "glup shitto"
	icon_state = "ks13_grav_gen"

/area/ruin/space/ks13/engineering/sb_bow_solars_control
	name = "glup shitto"
	icon_state = "ks13_sb_bow_solars_control"

/area/ruin/space/ks13/engineering/aft_solars_control
	name = "glup shitto"
	icon_state = "ks13_aft_solars_control"

// Area define for organization
/area/ruin/space/ks13/medical

/area/ruin/space/ks13/medical/morgue
	name = "glup shitto"
	icon_state = "ks13_morgue"

/area/ruin/space/ks13/medical/medbay
	name = "glup shitto"
	icon_state = "ks13_med"

// Area define for organization
/area/ruin/space/ks13/service

/area/ruin/space/ks13/service/kitchen
	name = "glup shitto"
	icon_state = "ks13_kitchen"

/area/ruin/space/ks13/service/bar
	name = "glup shitto"
	icon_state = "ks13_bar"

/area/ruin/space/ks13/service/chapel
	name = "glup shitto"
	icon_state = "ks13_chapel"

/area/ruin/space/ks13/service/chapel_office
	name = "glup shitto"
	icon_state = "ks13_chapel_office"

/area/ruin/space/ks13/service/cafe
	name = "glup shitto"
	icon_state = "ks13_cafe"

/area/ruin/space/ks13/service/hydro
	name = "glup shitto"
	icon_state = "ks13_hydro"

/area/ruin/space/ks13/service/jani
	name = "glup shitto"
	icon_state = "ks13_jani"

// Area define for organization
/area/ruin/space/ks13/science

/area/ruin/space/ks13/science/rnd
	name = "glup shitto"
	icon_state = "ks13_sci"

/area/ruin/space/ks13/science/genetics
	name = "glup shitto"
	icon_state = "ks13_gen"

/area/ruin/space/ks13/science/ordnance
	name = "glup shitto"
	icon_state = "ks13_ord"

/area/ruin/space/ks13/science/ordnance_hall
	name = "glup shitto"
	icon_state = "ks13_ord_hall"

// Area define for organization
/area/ruin/space/ks13/security

/area/ruin/space/ks13/security/sec
	name = "glup shitto"
	icon_state = "ks13_sec"

/area/ruin/space/ks13/security/cell
	name = "glup shitto"
	icon_state = "ks13_sec_cell"

/area/ruin/space/ks13/security/court
	name = "glup shitto"
	icon_state = "ks13_court"

/area/ruin/space/ks13/security/court_hall
	name = "glup shitto"
	icon_state = "ks13_court_hall"

// Area define for organization
/area/ruin/space/ks13/command

/area/ruin/space/ks13/command/bridge
	name = "glup shitto"
	icon_state = "ks13_bridge"

/area/ruin/space/ks13/command/bridge_hall
	name = "glup shitto"
	icon_state = "ks13_bridge_hall"

/area/ruin/space/ks13/command/eva
	name = "glup shitto"
	icon_state = "ks13_eva"

// Area define for organization
/area/ruin/space/ks13/ai

/area/ruin/space/ks13/ai/vault
	name = "glup shitto"
	icon_state = "ks13_ai_vault"

/area/ruin/space/ks13/ai/corridor
	name = "glup shitto"
	icon_state = "ks13_ai_corridor"

// Misc areas that don't belong to a department, general purpose or what may have you
/area/ruin/space/ks13/tool_storage
	name = "glup shitto"
	icon_state = "ks13_tool_storage"

/area/ruin/space/ks13/dorms
	name = "glup shitto"
	icon_state = "ks13_dorms"

/area/ruin/space/solars/ks13/sb_bow_solars
	name = "glup shitto"
	icon_state = "ks13_sb_bow_solars"

/area/ruin/space/solars/ks13/aft_solars
	name = "glup shitto"
	icon_state = "ks13_aft_solars"

//DJSTATION

/area/ruin/space/djstation
	name = "glup shitto"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/djstation/solars
	name = "glup shitto"
	icon_state = "DJ"
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/djstation/service
	name = "glup shitto"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

//ABANDONED TELEPORTER

/area/ruin/space/abandoned_tele
	name = "glup shitto"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg')

//OLD AI SAT

/area/ruin/space/tcommsat_oldaisat // Since tcommsat was moved to /area/station/, this turf doesn't inhereit its properties anymore
	name = "glup shitto"
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')
	airlock_wires = /datum/wires/airlock/engineering

//ABANDONED BOX WHITESHIP

/area/ruin/space/has_grav/whiteship/box

	name = "glup shitto"


//SYNDICATE LISTENING POST STATION

/area/ruin/space/has_grav/listeningstation
	name = "glup shitto"

/area/ruin/space/has_grav/powered/ancient_shuttle
	name = "glup shitto"

//HELL'S FACTORY OPERATING FACILITY
/area/ruin/space/has_grav/hellfactory
	name = "glup shitto"

/area/ruin/space/has_grav/hellfactoryoffice
	name = "glup shitto"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA | NOTELEPORT

//Ruin of Spinward Smoothies

/area/ruin/space/has_grav/spinwardsmoothies
	name = "glup shitto"


// The planet of the clowns
/area/ruin/space/has_grav/powered/clownplanet
	name = "glup shitto"
	ambientsounds = list('sound/ambience/clown.ogg')

//DERELICT SULACO
/area/ruin/space/has_grav/derelictsulaco
	name = "glup shitto"

//Mass-driver hub ruin
/area/ruin/space/massdriverhub
	name = "glup shitto"
	always_unpowered = FALSE

// The abandoned capsule 'The Traveler's Rest'
/area/ruin/space/has_grav/travelers_rest
	name = "glup shitto"

// Ruin of Derelict Construction
/area/ruin/space/has_grav/derelictconstruction
	name = "glup shitto"

// Ruin of Waystation
/area/ruin/space/has_grav/waystation
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/qm
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/dorms
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/kitchen
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/cargobay
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/securestorage
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/cargooffice
	name = "glup shitto"

/area/ruin/space/has_grav/powered/waystation/assaultpod
	name = "glup shitto"

/area/ruin/space/has_grav/waystation/power
	name = "glup shitto"
