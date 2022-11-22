//Beam
/obj/effect/ebeam/chain
	name = "lightning chain"
	layer = LYING_MOB_LAYER
	plane = GAME_PLANE_FOV_HIDDEN

/// Guardian of Lightning.
/mob/living/basic/guardian/beam
	melee_damage_lower = 7
	melee_damage_upper = 7
	attack_verb_continuous = "shocks"
	attack_verb_simple = "shock"
	melee_damage_type = BURN
	attack_sound = 'sound/machines/defib_zap.ogg'
	damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
	range = 7
	playstyle_string = span_holoparasite("As a <b>lightning</b> type, you will apply lightning chains to targets on attack and have a lightning chain to your summoner. Lightning chains will shock anyone near them.")
	magic_fluff_string = span_holoparasite("..And draw the Tesla, a shocking, lethal source of power.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Lightning modules active. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's a lightning carp! Everyone else goes zap zap.")
	miner_fluff_string = span_holoparasite("You encounter... Iron, a conductive master of lightning.")
	/// Beam chain to the guardian, the real shocker.
	var/datum/beam/summonerchain
	/// Track how many shocker chains we've sent out to our enemies.
	var/list/enemychains = list()
	/// How many shocks have we gotten off on our enemies?
	var/successful_shocks = 0

/mob/living/basic/guardian/beam/melee_attack(atom/target)
	. = ..()
	if(. && isliving(target) && target != src && target != summoner)
		clear_deleted_chains()
		for(var/chain in enemychains)
			var/datum/beam/B = chain
			if(B.target == target)
				return //oh this guy already HAS a chain, let's not chain again
		if(enemychains.len > 2)
			var/datum/beam/C = pick(enemychains)
			qdel(C)
			enemychains -= C
		enemychains += Beam(target, "lightning[rand(1,12)]", maxdistance=7, beam_type=/obj/effect/ebeam/chain)

/mob/living/basic/guardian/beam/Destroy()
	remove_chains()
	return ..()

/mob/living/basic/guardian/beam/Manifest()
	. = ..()
	if(.)
		if(summoner)
			summonerchain = Beam(summoner, "lightning[rand(1,12)]", beam_type=/obj/effect/ebeam/chain)
		while(loc != summoner)
			if(successful_shocks > 5)
				successful_shocks = 0
			if(shock_all_chains())
				successful_shocks++
			SLEEP_CHECK_DEATH(3, src)

/mob/living/basic/guardian/beam/Recall()
	. = ..()
	if(.)
		remove_chains()

/// Handles the actual deletion of the chains.
/mob/living/basic/guardian/beam/proc/clear_deleted_chains()
	if(summonerchain && QDELETED(summonerchain))
		summonerchain = null
	if(enemychains.len)
		for(var/chain in enemychains)
			var/datum/cd = chain
			if(!chain || QDELETED(cd))
				enemychains -= chain

/// Remove all current chains, then generate new ones and deliver damage.
/mob/living/basic/guardian/beam/proc/shock_all_chains()
	. = 0
	clear_deleted_chains()
	if(summoner)
		if(!summonerchain)
			summonerchain = Beam(summoner, "lightning[rand(1,12)]", beam_type=/obj/effect/ebeam/chain)
		. += chain_shock(summonerchain)
	if(enemychains.len)
		for(var/chain in enemychains)
			. += chain_shock(chain)

/// Clear all summoned shock chains.
/mob/living/basic/guardian/beam/proc/remove_chains()
	if(summonerchain)
		qdel(summonerchain)
		summonerchain = null
	if(enemychains.len)
		for(var/chain in enemychains)
			qdel(chain)
		enemychains = list()

/// Actually shocks the chain to deliver damage.
/mob/living/basic/guardian/beam/proc/chain_shock(datum/beam/lightning)
	. = 0
	var/list/turfs = list()
	for(var/element in lightning.elements)
		var/obj/effect/ebeam/chainpart = element
		if(chainpart && chainpart.x && chainpart.y && chainpart.z)
			var/turf/position = get_turf_pixel(chainpart)
			turfs |= position
			if(position != get_turf(lightning.origin) && position != get_turf(lightning.target))
				for(var/turf/ranged_turf in circle_range(position, 1))
					turfs |= ranged_turf

	for(var/turf/location as anything in turfs)
		for(var/mob/living/shockee in location)
			if(shockee.stat != DEAD && shockee != src && shockee != summoner)
				if(has_matching_summoner(shockee)) //if the summoner matches don't hurt them
					continue
				if(successful_shocks > 4)
					shockee.electrocute_act(0)
					shockee.visible_message(
						span_danger("[shockee] was shocked by the lightning chain!"), \
						span_userdanger("You are shocked by the lightning chain!"), \
						span_hear("You hear a heavy electrical crack.") \
					)
				shockee.adjustFireLoss(1.2) //adds up very rapidly
				. = 1
