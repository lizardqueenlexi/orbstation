// SNOUT
/obj/item/organ/snout_rat
	name = "ratfolk snout"
	desc = "Take a closer look at that snout!"
	icon_state = "snout"

	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
	preference = "feature_rat_snout"
	external_bodyshapes = BODYSHAPE_SNOUTED

	dna_block = /datum/dna_block/feature/rat_snout

	bodypart_overlay = /datum/bodypart_overlay/mutant/snout_rat

	organ_flags = parent_type::organ_flags | ORGAN_EXTERNAL

/datum/bodypart_overlay/mutant/snout_rat
	layers = EXTERNAL_FRONT | EXTERNAL_ADJACENT
	feature_key = FEATURE_RAT_SNOUT

	/// We dont color the inner part, which is the front layer
	var/colorless_layer = EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/snout_rat/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner)
	var/mob/living/carbon/human/human = bodypart_owner.owner
	if(!istype(human))
		return TRUE
	if((human.head?.flags_inv & HIDESNOUT) || (human.wear_mask?.flags_inv & HIDESNOUT))
		return FALSE
	return TRUE

/datum/bodypart_overlay/mutant/snout_rat/get_global_feature_list()
	return SSaccessories.rat_snouts_list

/datum/bodypart_overlay/mutant/snout_rat/color_image(image/overlay, draw_layer, obj/item/bodypart/limb)
	if(draw_layer != bitflag_to_layer(colorless_layer))
		return ..()
	return overlay

// TAIL

/obj/item/organ/tail/ratfolk
	name = "ratfolk tail"
	desc = "A severed rat tail."
	preference = "feature_rat_tail"
	dna_block = /datum/dna_block/feature/rat_tail
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/rat

/datum/bodypart_overlay/mutant/tail/rat
	feature_key = FEATURE_RAT_TAIL

/datum/bodypart_overlay/mutant/tail/rat/get_global_feature_list()
	return SSaccessories.rat_tails_list
