/*
/datum/preference/choiced/pod_blood
	savefile_key = "feature_pod_blood"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	main_feature_name = "Bloodtype"
	relevant_inherent_trait = TRAIT_POD_BLOOD

/datum/preference/choiced/pod_blood/create_default_value()
	return "Juices" // The juices are a fun and unique thing we have! lets make them a character default

/datum/preference/choiced/pod_blood/init_possible_values()
	return list("Water", "Juices")

/datum/preference/choiced/pod_blood/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["pod_blood"] = value

/datum/species/pod/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load, regenerate_icons)
	var/value = C.dna?.features?["pod_blood"]
	if(value == "Water")
		exotic_blood = /datum/reagent/water
	else if (value == "Juices")
		exotic_blood = pick(GLOB.pod_bloodtypes_juice)
	return ..()
*/
