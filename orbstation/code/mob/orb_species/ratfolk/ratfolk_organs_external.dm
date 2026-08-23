// SNOUT
/obj/item/organ/snout/rat
	name = "ratfolk snout"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
	external_bodyshapes = BODYSHAPE_SNOUTED

	dna_block = /datum/dna_block/feature/accessory/rat_snout

	bodypart_overlay = /datum/bodypart_overlay/mutant/snout_rat

/datum/bodypart_overlay/mutant/snout_rat
	layers = list(
		EXTERNAL_FRONT = BODY_FRONT_LAYER,
		EXTERNAL_ADJACENT = BODY_ADJ_LAYER
	)
	feature_key = FEATURE_RAT_SNOUT

	/// We dont color the inner part, which is the front layer
	var/colorless_layer = EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/snout_rat/color_image(image/overlay, draw_layer, obj/item/bodypart/limb, layer_index)
	if(layer_index != colorless_layer)
		return ..()
	return overlay

// TAIL

/obj/item/organ/tail/ratfolk
	name = "ratfolk tail"
	desc = "A severed rat tail."
	dna_block = /datum/dna_block/feature/accessory/rat_tail
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/rat

/datum/bodypart_overlay/mutant/tail/rat
	feature_key = FEATURE_RAT_TAIL
