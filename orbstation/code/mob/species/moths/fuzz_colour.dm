//sets moth to the correct color
/datum/species/moth/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	if(!ishuman(C))
		return
	var/mob/living/carbon/human/moth = C
	fixed_mut_color = moth.dna.features["moth_color"]

//Pref for moth coloration
/datum/preference/choiced/moth_color
	savefile_key = "feature_mothcolor"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Fuzz color"
	should_generate_icons = TRUE

/datum/preference/choiced/moth_color/has_relevant_feature(datum/preferences/preferences)
	// tied directly to species
	return current_species_has_savekey(preferences)

/datum/preference/choiced/moth_color/init_possible_values()
	return assoc_to_keys(GLOB.color_list_moth)

/datum/preference/choiced/moth_color/icon_for(value)
	var/static/datum/universal_icon/moth_base
	if (isnull(moth_base))
		moth_base = uni_icon('orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi', "moth_head")
		moth_base.blend_icon(uni_icon('orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi', "moth_chest_m"), ICON_OVERLAY)
		moth_base.blend_icon(uni_icon('orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi', "moth_l_arm"), ICON_OVERLAY)
		moth_base.blend_icon(uni_icon('orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi', "moth_r_arm"), ICON_OVERLAY)

		var/datum/universal_icon/eyes = uni_icon('icons/mob/human/human_face.dmi', "motheyes_white_l")
		eyes.blend_icon(uni_icon('icons/mob/human/human_face.dmi', "motheyes_white_r"), ICON_OVERLAY)
		eyes.blend_color(COLOR_BLACK, ICON_MULTIPLY)
		moth_base.blend_icon(eyes, ICON_OVERLAY)

		moth_base.scale(64, 64)
		moth_base.crop(15, 64 - 31, 15 + 31, 64)

	var/datum/universal_icon/icon = moth_base.copy()
	icon.blend_color(GLOB.color_list_moth[value], ICON_MULTIPLY)
	return icon

/datum/preference/choiced/moth_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features[FEATURE_MOTH_COLOR] = GLOB.color_list_moth[value]

//Moth bodypart overrides
/obj/item/bodypart/head/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/chest/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/right/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/left/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/moth
	icon_greyscale = 'orbstation/icons/mob/species/moth/bodyparts_greyscale.dmi'
	should_draw_greyscale = TRUE

/datum/species/moth/get_features()
	var/list/features = ..()

	features += FEATURE_MOTH_COLOR

	return features

/datum/species/moth/randomize_features()
	var/list/features = ..()
	features[FEATURE_MOTH_COLOR] = GLOB.color_list_moth[pick(GLOB.color_list_moth)]
	return features
