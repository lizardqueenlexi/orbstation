// Collapsing tendrils don't create chasms any more, instead they do a final revenge attack
/obj/effect/collapse/collapse()
	for(var/mob/M in range(7,src))
		shake_camera(M, 15, 1)
	playsound(get_turf(src),'sound/effects/explosion/explosionfar.ogg', 200, TRUE)
	visible_message(span_boldannounce("With a last spasm of grasping limbs, the tendril retreats below the ground!"))
	for(var/turf/near_turf in RANGE_TURFS(3,src))
		if(near_turf.density)
			continue
		if (get_dist(near_turf, src) <= 1)
			near_turf.TerraformTurf(/turf/open/chasm/lavaland, /turf/open/chasm/lavaland, flags = CHANGETURF_INHERIT_AIR)
		else
			new /obj/effect/goliath_tentacle/magic(near_turf)
	qdel(src)
