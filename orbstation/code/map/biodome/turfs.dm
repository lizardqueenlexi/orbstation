/turf/closed/wall/r_wall/fakewood
	desc = "A huge chunk of reinforced metal used to separate rooms. This one has been painted like a log."
	color = COLOR_ORANGE_BROWN

/turf/open/water/jungle/biodome
	name="Biodome Lake"
	baseturfs = /turf/open/misc/asteroid
	fishing_datum = /datum/fish_source/ocean/beach
/turf/open/misc/ashplanet/wateryrock/biodome
	name="Biodome Lake Rocks"
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

/turf/open/lava/plasma/biodome
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	baseturfs = /turf/open/lava/plasma/biodome

/turf/open/floor/fake_snow/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	slowdown = 0

/turf/open/floor/fake_iron_sand
	desc = "Wait a minute. This martian soil is just painted on!"
	icon_state = "ironsand1"
	base_icon_state = "ironsand1"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/fake_iron_sand/Initialize(mapload)
	. = ..()
	icon_state = "ironsand[rand(1,15)]"

/turf/open/floor/fake_iron_sand/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/fake_iron_sand/crowbar_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/wood/stairs
	icon = 'orbstation/icons/turf/floor.dmi'
	icon_state = "woodstairs_up"

/turf/open/floor/wood/stairs/down
	icon_state = "woodstairs_down"

/turf/open/floor/wood/stairs/left
	icon_state = "woodstairs_left"

/turf/open/floor/wood/stairs/right
	icon_state = "woodstairs_right"


/turf/open/misc/dirt/jungle/dark/biodome
	baseturfs = /turf/open/misc/asteroid

/turf/open/misc/dirt/jungle/wasteland/biodome
	baseturfs = /turf/open/misc/asteroid

/turf/open/floor/fake_dirt
	desc = "Upon closer examination, it's still astrodirt."
	icon_state = "dirt"
	base_icon_state = "dirt"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/fake_dirt/dark
	icon_state = "greenerdirt"
	base_icon_state = "greenerdirt"

/turf/open/floor/fake_dirt/wasteland
	name = "cracked earth"
	desc = "Looks a bit dry. And fake."
	icon_state = "wasteland"
	base_icon_state = "wasteland"
	var/floor_variance = 15

/turf/open/misc/dirt/jungle/wasteland/Initialize(mapload)
	.=..()
	if(prob(floor_variance))
		icon_state = "[initial(icon_state)][rand(0,12)]"
