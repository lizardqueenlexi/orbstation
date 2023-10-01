///override to give hair to our lizards
/obj/item/bodypart/head/lizard
	head_flags = HEAD_HAIR|HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN

/datum/species/lizard/silverscale
	/// Stored facial hair color for when the species is removed.
	var/old_facehair_color

/datum/species/lizard/silverscale/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/new_silverscale = C
	old_facehair_color = new_silverscale.facial_hair_color
	new_silverscale.facial_hair_color = "#FFFFFF"

/datum/species/lizard/silverscale/on_species_loss(mob/living/carbon/C)
	..()
	var/mob/living/carbon/human/was_silverscale = C
	was_silverscale.facial_hair_color = old_facehair_color
