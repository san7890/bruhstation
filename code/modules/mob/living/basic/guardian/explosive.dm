#define UNREGISTER_BOMB_SIGNALS(A) \
	do { \
		UnregisterSignal(A, boom_signals); \
		UnregisterSignal(A, COMSIG_PARENT_EXAMINE); \
	} while (0)

//Bomb
/mob/living/basic/guardian/bomb
	damage_coeff = list(BRUTE = 0.6, BURN = 0.6, TOX = 0.6, CLONE = 0.6, STAMINA = 0, OXY = 0.6)
	range = 13
	playstyle_string = span_holoparasite("As an <b>explosive</b> type, you have moderate close combat abilities and are capable of converting nearby items and objects into disguised bombs via alt-click.")
	magic_fluff_string = span_holoparasite("..And draw the Scientist, master of explosive death.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Explosive modules active. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's an explosive carp! Boom goes the fishy.")
	miner_fluff_string = span_holoparasite("You encounter... Gibtonite, an explosive fighter.")
	/// How long we have until a bomb can be placed again
	var/bomb_cooldown_duration = 20 SECONDS
	COOLDOWN_DECLARE(bomb_cooldown_timer)
	/// The types of signals that'll trigger a bomb
	var/static/list/boom_signals = list(COMSIG_PARENT_ATTACKBY, COMSIG_ATOM_BUMPED, COMSIG_ATOM_ATTACK_HAND)

/mob/living/basic/guardian/bomb/get_status_tab_items()
	. = ..()
	if(!COOLDOWN_FINISHED(src, bomb_cooldown_timer))
		. += "Bomb Cooldown Remaining: [DisplayTimeText(bomb_cooldown_timer - world.time)]"

/mob/living/basic/guardian/bomb/AltClickOn(atom/movable/source)
	if(!istype(source))
		return
	if(loc == summoner)
		to_chat(src, span_danger("<B>You must be manifested to create bombs!</B>"))
		return
	if(isobj(source) && Adjacent(source))
		if(COOLDOWN_FINISHED(src, bomb_cooldown_timer) && !stat)
			to_chat(src, span_danger("<B>Success! Bomb armed!</B>"))
			RegisterSignal(source, COMSIG_PARENT_EXAMINE, PROC_REF(display_examine))
			RegisterSignal(source, boom_signals, PROC_REF(kaboom))
			COOLDOWN_START(src, bomb_cooldown_timer, bomb_cooldown_duration)
			addtimer(CALLBACK(src, PROC_REF(disable), source), 60 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE)
		else
			to_chat(src, span_danger("<B>Your powers are on cooldown! You must wait [DisplayTimeText(bomb_cooldown_timer)] between bombs.</B>"))

/mob/living/basic/guardian/bomb/proc/kaboom(atom/source, mob/living/explodee)
	SIGNAL_HANDLER
	if(!istype(explodee))
		return
	if(explodee == src || explodee == summoner || has_matching_summoner(explodee))
		return
	to_chat(explodee, span_danger("<B>[source] was boobytrapped!</B>"))
	to_chat(src, span_danger("<B>Success! Your trap caught [explodee]!</B>"))
	var/turf/position = get_turf(source)
	playsound(position, 'sound/effects/explosion2.ogg', 20 SECONDS, TRUE)
	new /obj/effect/temp_visual/explosion(position)
	EX_ACT(explodee, EXPLODE_HEAVY)
	UNREGISTER_BOMB_SIGNALS(source)

/mob/living/basic/guardian/bomb/proc/disable(atom/source)
	to_chat(src, span_danger("<B>Failure! Your trap didn't catch anyone this time.</B>"))
	UNREGISTER_BOMB_SIGNALS(source)

/mob/living/basic/guardian/bomb/proc/display_examine(datum/source, mob/user, text)
	SIGNAL_HANDLER
	text += span_holoparasite("It glows with a strange <font color=\"[guardian_color]\">light</font>!")

#undef UNREGISTER_BOMB_SIGNALS
