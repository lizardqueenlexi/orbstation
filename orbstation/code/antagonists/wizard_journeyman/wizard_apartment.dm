/datum/lazy_template/wizard_apartment
	key = LAZY_TEMPLATE_KEY_WIZARD_JOURNEYMAN
	map_name = "journeyman_apartment"

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
