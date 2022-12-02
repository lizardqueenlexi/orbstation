/obj/item/toy/beach_ball/orb
	name = "orb"
	desc = "Could it be? ORB????"
	icon = 'orbstation/icons/obj/misc.dmi'
	icon_state = "orb"

/obj/item/toy/beach_ball/orb/Initialize(mapload)
	. = ..()

	src.add_filter("glorb", 2, list("type" = "outline", "color" = "#44706550", "size" = 8))
	src.add_filter("rayorbs", 5, list("type" = "rays", "color" = "#00cc99", "size" = 30, "density" = 20, "y" = -5))
	var/filter = src.get_filter("rayorbs")
	animate(filter, offset = 10, time = 3 SECONDS, loop = -1)
	animate(offset = 1, time = 3 SECONDS, loop = -1)
