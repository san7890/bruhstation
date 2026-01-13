/obj/projectile/colossus/wendigo_shockwave
	name = "wendigo shockwave"
	speed = 0.5

	/// Amount the angle changes every pixel move
	var/wave_speed = 0.5
	/// Amount of movements this projectile has made
	var/pixel_moves = 0

/obj/projectile/colossus/wendigo_shockwave/spiral
	damage = 15

/obj/projectile/colossus/wendigo_shockwave/wave
	speed = 0.125
	wave_speed = 0.3

/obj/projectile/colossus/wendigo_shockwave/wave/alternate
	wave_speed = -0.3

/obj/projectile/colossus/wendigo_shockwave/process_movement(pixels_to_move, hitscan, tile_limit)
	. = ..()
	if (QDELETED(src))
		return
	pixel_moves += .
	set_angle(original_angle + pixel_moves * wave_speed)
