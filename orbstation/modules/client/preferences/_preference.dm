//Additional preference types for Orbstation

/// A preference for text and text input. Obtained from Skyrat.
/datum/preference/text
	abstract_type = /datum/preference/text

/datum/preference/text/deserialize(input, datum/preferences/preferences)
	return STRIP_HTML_SIMPLE(input, MAX_FLAVOR_LEN)

/datum/preference/text/create_default_value()
	return ""

/datum/preference/text/is_valid(value)
	return istext(value)

/// A preference for shorter text input (no more than 200 characters).
/datum/preference/text/short
	abstract_type = /datum/preference/text/short

/datum/preference/text/short/deserialize(input, datum/preferences/preferences)
	return STRIP_HTML_SIMPLE(input, MAX_SHORT_FLAVOR_LEN)


/// Preferences for prosthetic limbs testing

/datum/preference/choiced/limb
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/limb/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return "Prosthetics" in preferences.all_quirks

/datum/preference/choiced/limb/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/limb/arm/init_possible_values()
	return list(
		"normal",
		"robotic",
		"surplus"
	)

/datum/preference/choiced/limb/arm/L
	savefile_key = "prosthetic_armL"

/datum/preference/choiced/limb/arm/R
	savefile_key = "prosthetic_armR"

/datum/preference/choiced/limb/leg/init_possible_values()
	return list(
		"normal",
		"robotic",
		"surplus",
		"digitigrade"
	)

/datum/preference/choiced/limb/leg/L
	savefile_key = "prosthetic_legL"

/datum/preference/choiced/limb/leg/R
	savefile_key = "prosthetic_legR"
