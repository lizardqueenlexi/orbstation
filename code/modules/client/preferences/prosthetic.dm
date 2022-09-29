/datum/preference/choiced/prosthetic
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_key = "prosthetic"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/prosthetic/init_possible_values()
	return GLOB.prosthetics

/datum/preference/choiced/prosthetic/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return "Prosthetic" in preferences.all_quirks

/datum/preference/choiced/prosthetic/apply_to_human(mob/living/carbon/human/target, value)
	return
