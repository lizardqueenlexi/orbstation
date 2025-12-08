// SNOUT

/datum/preference/choiced/species_feature/rat_snout
	savefile_key = "feature_rat_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE
	relevant_organ = /obj/item/organ/snout_rat

/datum/preference/choiced/species_feature/rat_snout/icon_for(value)
	return generate_ratfolk_side_shot(get_accessory_for_value(value), "rat_snout", include_snout = FALSE)

/proc/generate_ratfolk_side_shot(datum/sprite_accessory/sprite_accessory, key, include_snout = TRUE)
	var/static/datum/universal_icon/rat
	var/static/datum/universal_icon/rat_with_snout

	if (isnull(rat))
		rat = uni_icon('orbstation/icons/mob/species/ratfolk/bodyparts.dmi', "ratfolk_head", EAST)
		var/datum/universal_icon/eyes = uni_icon(/obj/item/organ/eyes/ratfolk::eye_icon, "[/obj/item/organ/eyes/ratfolk::eye_icon_state]_l", EAST)

		eyes.blend_color(COLOR_BLACK, ICON_MULTIPLY)
		rat.blend_icon(eyes, ICON_OVERLAY)

		rat_with_snout = rat.copy()
		rat.blend_icon(uni_icon('orbstation/icons/mob/species/ratfolk/bodyparts.dmi', "m_rat_snout_round_ADJ", EAST), ICON_OVERLAY)

	var/datum/universal_icon/final_icon = include_snout ? rat_with_snout.copy() : rat.copy()

	if (!isnull(sprite_accessory))
		var/sprite_suffix = key == "rat_ears" ? "FRONT" : "ADJ"
		var/datum/universal_icon/accessory_icon = uni_icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_[sprite_suffix]", EAST)
		final_icon.blend_icon(accessory_icon, ICON_OVERLAY)

	final_icon.crop(11, 20, 23, 32)
	final_icon.scale(32, 32)
	final_icon.blend_color(COLOR_DARK_BROWN, ICON_MULTIPLY)

	return final_icon

// TAIL

/datum/preference/choiced/species_feature/rat_tail
	savefile_key = "feature_rat_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_organ = /obj/item/organ/tail/ratfolk

// EARS

/datum/preference/choiced/species_feature/rat_ears
	savefile_key = "feature_rat_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_organ = /obj/item/organ/ears/ratfolk

/datum/preference/choiced/species_feature/rat_ears/icon_for(value)
	return generate_ratfolk_side_shot(get_accessory_for_value(value), "rat_ears", include_snout=FALSE)
