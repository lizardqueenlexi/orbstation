/datum/dna_block/feature/rat_snout
	feature_key = FEATURE_RAT_SNOUT

/datum/dna_block/feature/rat_snout/create_unique_block(mob/living/carbon/human/target)
	return construct_block(SSaccessories.rat_snouts_list.Find(target.dna.features[feature_key]), length(SSaccessories.rat_snouts_list))

/datum/dna_block/feature/rat_ears
	feature_key = FEATURE_RAT_EARS

/datum/dna_block/feature/rat_ears/create_unique_block(mob/living/carbon/human/target)
	return construct_block(SSaccessories.rat_ears_list.Find(target.dna.features[feature_key]), length(SSaccessories.rat_ears_list))

/datum/dna_block/feature/rat_tail
	feature_key = FEATURE_RAT_TAIL

/datum/dna_block/feature/rat_tail/create_unique_block(mob/living/carbon/human/target)
	return construct_block(SSaccessories.rat_tails_list.Find(target.dna.features[feature_key]), length(SSaccessories.rat_tails_list))


/datum/dna_block/feature/moth_color
	block_length = DNA_BLOCK_SIZE_COLOR
	feature_key = FEATURE_MOTH_COLOR

/datum/dna_block/feature/moth_color/create_unique_block(mob/living/carbon/human/target)
	return sanitize_hexcolor(target.dna.features[FEATURE_MOTH_COLOR], include_crunch = FALSE)

/datum/dna_block/feature/moth_color/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	target.dna.features[feature_key] = sanitize_hexcolor(get_block(dna_hash))
