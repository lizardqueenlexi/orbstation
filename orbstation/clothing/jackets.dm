// A number of new, toggleable jackets, hoodies, and flannels, all imported from Skyrat.

//Base Jacket - same stats as /obj/item/clothing/suit/jacket, just toggleable and serving as the base for all the departmental jackets and flannels
/obj/item/clothing/suit/toggle/jacket
	icon = 'orbstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/mob/clothing/suit.dmi'
	name = "deluxe bomber jacket"
	desc = "A warm bomber jacket, with synthetic-wool lining to keep you nice and warm in the depths of space. Aviators not included."
	icon_state = "bomberalt"
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/radio)
	body_parts_covered = CHEST|ARMS|GROIN
	cold_protection = CHEST|ARMS|GROIN
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	toggle_noun = "zipper"

//Job Jackets
/obj/item/clothing/suit/toggle/jacket/engi
	name = "engineering jacket"
	desc = "A comfortable jacket in engineering yellow."
	icon_state = "engi_dep_jacket"
	armor_type = /datum/armor/toggle_jacket_engi
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)

/datum/armor/toggle_jacket_engi
	fire = 30
	acid = 45

/obj/item/clothing/suit/toggle/jacket/sci
	name = "science jacket"
	desc = "A comfortable jacket in science purple."
	icon_state = "sci_dep_jacket"
	armor_type = /datum/armor/toggle_jacket_sci

/datum/armor/toggle_jacket_sci
	bomb = 10

/obj/item/clothing/suit/toggle/jacket/med
	name = "medbay jacket"
	desc = "A comfortable jacket in medical blue."
	icon_state = "med_dep_jacket"
	armor_type = /datum/armor/toggle_jacket_med

/datum/armor/toggle_jacket_med
	bio = 50
	acid = 45

/obj/item/clothing/suit/toggle/jacket/supply
	name = "cargo jacket"
	desc = "A comfortable jacket in supply brown."
	icon_state = "supply_dep_jacket"

/obj/item/clothing/suit/toggle/jacket/sec
	name = "security jacket"
	desc = "A comfortable jacket in security red. Probably against uniform regulations."
	icon_state = "sec_dep_jacket"
	armor_type = /datum/armor/toggle_jacket_sec

/datum/armor/toggle_jacket_sec
	melee = 25
	bullet = 15
	laser = 30
	energy = 10
	bomb = 25
	acid = 45

//Flannels
/obj/item/clothing/suit/toggle/jacket/flannel
	icon = 'orbstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/mob/clothing/suit.dmi'
	name = "flannel jacket"
	desc = "A cozy and warm plaid flannel jacket. Praised by lumberjacks, truckers, and lesbians alike."
	icon_state = "flannel"
	body_parts_covered = CHEST|ARMS //Being a bit shorter, flannels dont cover quite as much as the rest of the woolen jackets (- GROIN)
	cold_protection = CHEST|ARMS
	heat_protection = CHEST|ARMS	//As a plus side, they're more insulating, protecting a bit from the heat as well

/obj/item/clothing/suit/toggle/jacket/flannel/red
	name = "red flannel jacket"
	icon_state = "flannel_red"

/obj/item/clothing/suit/toggle/jacket/flannel/aqua
	name = "aqua flannel jacket"
	icon_state = "flannel_aqua"

/obj/item/clothing/suit/toggle/jacket/flannel/brown
	name = "brown flannel jacket"
	icon_state = "flannel_brown"

/obj/item/clothing/suit/toggle/jacket/flannel/crop
	icon = 'orbstation/icons/obj/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/mob/clothing/suit.dmi'
	name = "cropped flannel jacket"
	desc = "A cozy and warm plaid flannel jacket. This one has been cropped short and is a bit less warm."
	icon_state = "flannel_crop"
	body_parts_covered = CHEST|ARMS //Being a bit shorter, flannels dont cover quite as much as the rest of the woolen jackets (- GROIN)
	cold_protection = CHEST|ARMS
	heat_protection = ARMS	//No heat protection to the chest because it's a crop top. The price we pay for fashion.

/obj/item/clothing/suit/toggle/jacket/flannel/crop/red
	name = "red cropped flannel jacket"
	icon_state = "flannel_crop_red"

/obj/item/clothing/suit/toggle/jacket/flannel/crop/aqua
	name = "aqua cropped flannel jacket"
	icon_state = "flannel_crop_aqua"

/obj/item/clothing/suit/toggle/jacket/flannel/crop/brown
	name = "brown cropped flannel jacket"
	icon_state = "flannel_crop_brown"

//You can craft cropped flannels by using wirecutters or anything sharp on a regular flannel
//I'm aware this is redundant code somewhat, but it was easier to do it this way for the four different colors
//If these jackets later get GAGS'd, it will save time here.
/obj/item/clothing/suit/toggle/jacket/flannel/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if (!(flags_1 & HOLOGRAM_1))
			to_chat(user, span_notice("You begin to cut [src] short..."))
			if(do_after(user, 5 SECONDS, src))
				new /obj/item/clothing/suit/toggle/jacket/flannel/crop(get_turf(src))
				qdel(src)
				to_chat(user, span_notice("You cut [src] short!"))
	else
		return ..()

/obj/item/clothing/suit/toggle/jacket/flannel/red/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if (!(flags_1 & HOLOGRAM_1))
			to_chat(user, span_notice("You begin to cut [src] short..."))
			if(do_after(user, 5 SECONDS, src))
				new /obj/item/clothing/suit/toggle/jacket/flannel/crop/red(get_turf(src))
				qdel(src)
				to_chat(user, span_notice("You cut [src] short!"))
	else
		return ..()

/obj/item/clothing/suit/toggle/jacket/flannel/aqua/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if (!(flags_1 & HOLOGRAM_1))
			to_chat(user, span_notice("You begin to cut [src] short..."))
			if(do_after(user, 5 SECONDS, src))
				new /obj/item/clothing/suit/toggle/jacket/flannel/crop/aqua(get_turf(src))
				qdel(src)
				to_chat(user, span_notice("You cut [src] short!"))
	else
		return ..()

/obj/item/clothing/suit/toggle/jacket/flannel/brown/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if (!(flags_1 & HOLOGRAM_1))
			to_chat(user, span_notice("You begin to cut [src] short..."))
			if(do_after(user, 5 SECONDS, src))
				new /obj/item/clothing/suit/toggle/jacket/flannel/crop/brown(get_turf(src))
				qdel(src)
				to_chat(user, span_notice("You cut [src] short!"))
	else
		return ..()
