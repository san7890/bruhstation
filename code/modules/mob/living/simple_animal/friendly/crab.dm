

/mob/living/simple_animal/crab/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(isturf(loc) && !resting && !buckled) //This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				var/east_vs_west = pick(4, 8)
				if(Process_Spacemove(east_vs_west))
					Move(get_step(src,east_vs_west), east_vs_west)
					turns_since_move = 0
	regenerate_icons()

//COFFEE! SQUEEEEEEEEE!
/mob/living/simple_animal/crab/coffee
	name = "Coffee"
	real_name = "Coffee"
	desc = "It's Coffee, the other pet!"
	gender = FEMALE
	gold_core_spawnable = NO_SPAWN

/mob/living/simple_animal/crab/jon //holodeck crab
	name = "Jon"
	real_name = "Jon"
	gold_core_spawnable = NO_SPAWN

/mob/living/simple_animal/crab/evil
	name = "Evil Crab"
	real_name = "Evil Crab"
	desc = "Unnerving, isn't it? It has to be planning something nefarious..."
	icon_state = "evilcrab"
	icon_living = "evilcrab"
	icon_dead = "evilcrab_dead"
	gold_core_spawnable = FRIENDLY_SPAWN

/mob/living/simple_animal/crab/kreb
	name = "Kreb"
	desc = "This is a real crab. The other crabs are simply gubbucks in disguise!"
	real_name = "Kreb"
	icon_state = "kreb"
	icon_living = "kreb"
	icon_dead = "kreb_dead"
	gold_core_spawnable = NO_SPAWN

/mob/living/simple_animal/crab/evil/kreb
	name = "Evil Kreb"
	real_name = "Evil Kreb"
	icon_state = "evilkreb"
	icon_living = "evilkreb"
	icon_dead = "evilkreb_dead"
	gold_core_spawnable = NO_SPAWN
