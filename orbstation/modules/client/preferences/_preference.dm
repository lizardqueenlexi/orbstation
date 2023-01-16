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


/// Preferences for prosthetic limbs

/datum/preference/choiced/limb
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/limb/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	return "Prosthetics" in preferences.all_quirks

//this is a little messy... might be cleaner if i do arm/L arm/R leg/L leg/R instead and inherit from /arm and /leg?

/datum/preference/choiced/limb/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/choiced/limb/armL
	savefile_key = "prosthetic_armL"

/datum/preference/choiced/limb/armL/init_possible_values()
	return GLOB.prosthetics_arm

/datum/preference/choiced/limb/armR
	savefile_key = "prosthetic_armR"

/datum/preference/choiced/limb/armR/init_possible_values()
	return GLOB.prosthetics_arm

/datum/preference/choiced/limb/legL
	savefile_key = "prosthetic_legL"

/datum/preference/choiced/limb/legL/init_possible_values()
	return GLOB.prosthetics_leg

/datum/preference/choiced/limb/legR
	savefile_key = "prosthetic_legR"

/datum/preference/choiced/limb/legR/init_possible_values()
	return GLOB.prosthetics_leg
