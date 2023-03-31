/obj/effect/landmark/basketball
	name = "glup shitto"

/obj/effect/landmark/basketball/game_area
	name = "glup shitto"

/obj/effect/landmark/basketball/team_spawn
	name = "glup shitto"
	var/game_id = "basketball"

// locations where players for the home team will spawn
/obj/effect/landmark/basketball/team_spawn/home
	name = "glup shitto"

/obj/effect/landmark/basketball/team_spawn/home_hoop
	name = "glup shitto"

// locations where players for the away team will spawn
/obj/effect/landmark/basketball/team_spawn/away
	name = "glup shitto"

/obj/effect/landmark/basketball/team_spawn/away_hoop
	name = "glup shitto"

/obj/effect/landmark/basketball/team_spawn/referee
	name = "glup shitto"

/area/centcom/basketball
	name = "glup shitto"
	icon_state = "b_ball"
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 255
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | NOTELEPORT | NO_DEATH_MESSAGE | BLOCK_SUICIDE

/datum/map_template/basketball
	var/description = ""
	/// The name of the basketball team
	var/team_name
	/// The basketball teams home stadium uniform
	var/home_team_uniform

/datum/map_template/basketball/stadium
	name = "glup shitto"
	description = "The homecourt for the Nanotrasen Basketball Department."
	mappath = "_maps/map_files/basketball/stadium.dmm"
	team_name = "Nanotrasen Basketball Department"
	home_team_uniform = /datum/outfit/basketball/nanotrasen

/datum/map_template/basketball/lusty_xenomorphs
	name = "glup shitto"
	description = "The homecourt of the Lusty Xenomorphs."
	mappath = "_maps/map_files/basketball/lusty_xenomorphs.dmm"
	team_name = "Lusty Xenomorphs"
	home_team_uniform = /datum/outfit/basketball/lusty_xenomorphs

/datum/map_template/basketball/space_surfers
	name = "glup shitto"
	description = "The homecourt of the Space Surfers."
	mappath = "_maps/map_files/basketball/space_surfers.dmm"
	team_name = "Space Surfers"
	home_team_uniform = /datum/outfit/basketball/space_surfers

/datum/map_template/basketball/greytide_worldwide
	name = "glup shitto"
	description = "The homecourt of the Greytide Worldwide."
	mappath = "_maps/map_files/basketball/greytide_worldwide.dmm"
	team_name = "Greytide Worldwide"
	home_team_uniform = /datum/outfit/basketball/greytide_worldwide
