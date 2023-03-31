
// CENTCOM
// CentCom itself
/area/centcom
	name = "glup shitto"
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "centcom"
	static_lighting = TRUE
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

// This is just to define the category
/area/centcom/central_command_areas
	name = "glup shitto"

/area/centcom/central_command_areas/control
	name = "glup shitto"
	icon_state = "centcom_control"

/area/centcom/central_command_areas/evacuation
	name = "glup shitto"
	icon_state = "centcom_evacuation"

/area/centcom/central_command_areas/evacuation/ship
	name = "glup shitto"
	icon_state = "centcom_evacuation_ship"

/area/centcom/central_command_areas/fore
	name = "glup shitto"
	icon_state = "centcom_fore"

/area/centcom/central_command_areas/supply
	name = "glup shitto"
	icon_state = "centcom_supply"

/area/centcom/central_command_areas/ferry
	name = "glup shitto"
	icon_state = "centcom_ferry"

/area/centcom/central_command_areas/briefing
	name = "glup shitto"
	icon_state = "centcom_briefing"

/area/centcom/central_command_areas/armory
	name = "glup shitto"
	icon_state = "centcom_armory"

/area/centcom/central_command_areas/admin
	name = "glup shitto"
	icon_state = "centcom_admin"

/area/centcom/central_command_areas/admin/storage
	name = "glup shitto"
	icon_state = "centcom_admin_storage"

/area/centcom/central_command_areas/prison
	name = "glup shitto"
	icon_state = "centcom_prison"

/area/centcom/central_command_areas/prison/cells
	name = "glup shitto"
	icon_state = "centcom_cells"

/area/centcom/central_command_areas/courtroom
	name = "glup shitto"
	icon_state = "centcom_court"

/area/centcom/central_command_areas/holding
	name = "glup shitto"
	icon_state = "centcom_holding"

/area/centcom/central_command_areas/supplypod/supplypod_temp_holding
	name = "glup shitto"
	icon_state = "supplypod_flight"

/area/centcom/central_command_areas/supplypod
	name = "glup shitto"
	icon_state = "supplypod"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/centcom/central_command_areas/supplypod/pod_storage
	name = "glup shitto"
	icon_state = "supplypod_holding"

/area/centcom/central_command_areas/supplypod/loading
	name = "glup shitto"
	icon_state = "supplypod_loading"
	var/loading_id = ""

/area/centcom/central_command_areas/supplypod/loading/Initialize(mapload)
	. = ..()
	if(!loading_id)
		CRASH("[type] created without a loading_id")
	if(GLOB.supplypod_loading_bays[loading_id])
		CRASH("Duplicate loading bay area: [type] ([loading_id])")
	GLOB.supplypod_loading_bays[loading_id] = src

/area/centcom/central_command_areas/supplypod/loading/one
	name = "glup shitto"
	loading_id = "1"

/area/centcom/central_command_areas/supplypod/loading/two
	name = "glup shitto"
	loading_id = "2"

/area/centcom/central_command_areas/supplypod/loading/three
	name = "glup shitto"
	loading_id = "3"

/area/centcom/central_command_areas/supplypod/loading/four
	name = "glup shitto"
	loading_id = "4"

/area/centcom/central_command_areas/supplypod/loading/ert
	name = "glup shitto"
	loading_id = "5"

//THUNDERDOME
/area/centcom/tdome
	name = "glup shitto"
	icon_state = "thunder"
	static_lighting = TRUE
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/centcom/tdome/arena
	name = "glup shitto"
	icon_state = "thunder"
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/centcom/tdome/tdome1
	name = "glup shitto"
	icon_state = "thunder_team_one"

/area/centcom/tdome/tdome2
	name = "glup shitto"
	icon_state = "thunder_team_two"

/area/centcom/tdome/administration
	name = "glup shitto"
	icon_state = "thunder_admin"

/area/centcom/tdome/observation
	name = "glup shitto"
	icon_state = "thunder_observe"


// ENEMY

// Wizard
/area/centcom/wizard_station
	name = "glup shitto"
	icon_state = "wizards_den"
	static_lighting = TRUE
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE


//Abductors
/area/centcom/abductor_ship
	name = "glup shitto"
	icon_state = "abductor_ship"
	requires_power = FALSE
	area_flags = UNIQUE_AREA | NOTELEPORT
	static_lighting = FALSE
	base_lighting_alpha = 255
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

//Syndicates
/area/centcom/syndicate_mothership
	name = "glup shitto"
	icon_state = "syndie-ship"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE
	ambience_index = AMBIENCE_DANGER

/area/centcom/syndicate_mothership/control
	name = "glup shitto"
	icon_state = "syndie-control"
	static_lighting = TRUE

/area/centcom/syndicate_mothership/expansion_bombthreat
	name = "glup shitto"
	icon_state = "syndie-elite"
	static_lighting = TRUE
	ambience_index = AMBIENCE_ENGI

/area/centcom/syndicate_mothership/expansion_bioterrorism
	name = "glup shitto"
	icon_state = "syndie-elite"
	static_lighting = TRUE
	ambience_index = AMBIENCE_MEDICAL

/area/centcom/syndicate_mothership/expansion_chemicalwarfare
	name = "glup shitto"
	icon_state = "syndie-elite"
	static_lighting = TRUE
	ambience_index = AMBIENCE_REEBE

/area/centcom/syndicate_mothership/expansion_fridgerummage
	name = "glup shitto"
	icon_state = "syndie-elite"
	static_lighting = TRUE

/area/centcom/syndicate_mothership/elite_squad
	name = "glup shitto"
	icon_state = "syndie-elite"

//CAPTURE THE FLAG
/area/centcom/ctf
	name = "glup shitto"
	icon_state = "ctf"
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 255
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | NOTELEPORT | NO_DEATH_MESSAGE

/area/centcom/ctf/control_room
	name = "glup shitto"
	icon_state = "ctf_room_a"

/area/centcom/ctf/control_room2
	name = "glup shitto"
	icon_state = "ctf_room_b"

/area/centcom/ctf/central
	name = "glup shitto"
	icon_state = "ctf_central"

/area/centcom/ctf/main_hall
	name = "glup shitto"
	icon_state = "ctf_hall_a"

/area/centcom/ctf/main_hall2
	name = "glup shitto"
	icon_state = "ctf_hall_b"

/area/centcom/ctf/corridor
	name = "glup shitto"
	icon_state = "ctf_corr_a"

/area/centcom/ctf/corridor2
	name = "glup shitto"
	icon_state = "ctf_corr_b"

/area/centcom/ctf/flag_room
	name = "glup shitto"
	icon_state = "ctf_flag_a"

/area/centcom/ctf/flag_room2
	name = "glup shitto"
	icon_state = "ctf_flag_b"

// Asteroid area stuff
/area/centcom/asteroid
	name = "glup shitto"
	icon_state = "asteroid"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA
	ambience_index = AMBIENCE_MINING
	flags_1 = CAN_BE_DIRTY_1
	sound_environment = SOUND_AREA_ASTEROID
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/centcom/asteroid/nearstation
	static_lighting = TRUE
	ambience_index = AMBIENCE_RUINS
	always_unpowered = FALSE
	requires_power = TRUE
	area_flags = UNIQUE_AREA | BLOBS_ALLOWED

/area/centcom/asteroid/nearstation/bomb_site
	name = "glup shitto"
