///This subsystem handles the hyperspace shuttle pull movement loops
MOVEMENT_SUBSYSTEM_DEF(hyperspace_drift)
	name = "glup shitto"
	priority = FIRE_PRIORITY_HYPERSPACE_DRIFT
	flags = SS_NO_INIT|SS_TICKER
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
