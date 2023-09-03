
/datum/sprite_accessory/snouts/sharpcolored
	name = "Sharp + Colored"
	icon_state = "sharplight"
	color_src = FACIAL_HAIR_COLOR

/datum/sprite_accessory/snouts/roundcolored
	name = "Round + Colored"
	icon_state = "roundlight"
	color_src = FACIAL_HAIR_COLOR

/datum/preference/choiced/lizard_snout/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "facial_hair_color"

	return data
