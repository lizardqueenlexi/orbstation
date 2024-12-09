/datum/map_template/wizard_apartment
	name = "wizard's apartment"
	mappath = "_maps/templates/journeyman_apartment.dmm"

/area/wizard_apartment
	name = "Wizard's Apartment"
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "wizards_den"
	static_lighting = TRUE
	requires_power = FALSE
	default_gravity = STANDARD_GRAVITY
	area_flags = UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

/obj/effect/landmark/start/wizard_journeyman
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard_journeyman/Initialize(mapload)
	..()
	GLOB.journeymanstart += loc
	return INITIALIZE_HINT_QDEL
