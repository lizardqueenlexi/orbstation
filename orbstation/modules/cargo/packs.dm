//CARGO CRATES FOR ORBSTATION

/datum/supply_pack/medical/cadaver
	cost = CARGO_CRATE_VALUE * 5
	access = ACCESS_MEDICAL
	crate_type = /obj/structure/closet/crate/coffin //this is temporary
	crate_name = "medical cadaver crate"

//this SHOULD function identically for every cadaver crate
/datum/supply_pack/medical/cadaver/generate()
	. = ..()
	var/mob/living/carbon/human/H = locate() in .
	H.death()
	for (var/part in H.internal_organs) //each cadaver comes with a complimentary set of organs, held in stasis
		var/obj/item/organ/O = part
		O.organ_flags |= ORGAN_FROZEN

/datum/supply_pack/medical/cadaver/human
	name = "Medical Cadaver Crate (Human)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a human."
	contains = list(/mob/living/carbon/human)

/datum/supply_pack/medical/cadaver/felinid
	name = "Medical Cadaver Crate (Felinid)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a felinid."
	contains = list(/mob/living/carbon/human/species/felinid)

/datum/supply_pack/medical/cadaver/lizard
	name = "Medical Cadaver Crate (Tiziran)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a tiziran."
	contains = list(/mob/living/carbon/human/species/lizard)

/datum/supply_pack/medical/cadaver/ethereal
	name = "Medical Cadaver Crate (Ethereal)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a ethereal. Note that the body's crystal core has been removed for research purposes."
	contains = list(/mob/living/carbon/human/species/ethereal)

//remove the ethereal's heart - we don't want them regenerating
/datum/supply_pack/medical/cadaver/ethereal/generate()
	. = ..()
	var/mob/living/carbon/human/H = locate() in .
	for (var/part in H.internal_organs) //i feel like there's a more efficient way to do this
		if(istype(part, /obj/item/organ/internal/heart))
			qdel(part)

/datum/supply_pack/medical/cadaver/moth
	name = "Medical Cadaver Crate (Moth)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a moth."
	contains = list(/mob/living/carbon/human/species/moth)

/datum/supply_pack/medical/cadaver/jelly
	name = "Medical Cadaver Crate (Jellyperson)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a jellyperson."
	contains = list(/mob/living/carbon/human/species/jelly)

/datum/supply_pack/medical/cadaver/pod
	name = "Medical Cadaver Crate (Podperson)"
	desc = "A preserved medical cadaver, for dissections, spare organs, or other experimental surgeries. This one is a podperson."
	contains = list(/mob/living/carbon/human/species/pod)
