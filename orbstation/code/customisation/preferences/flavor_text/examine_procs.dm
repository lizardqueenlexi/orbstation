// Display flavor text when examining closely
/mob/living/carbon/human/examine_more(mob/user)
	. = ..()

	if(block_flavour_text())
		return

	. += span_info(dna.features["flavor_text"])

/mob/living/silicon/robot/examine_more(mob/user)
	. = ..()
	. += span_notice("<i>You examine [src] closer, and note the following...</i>")
	if(client)
		. += client.prefs.read_preference(/datum/preference/text/silicon_flavor_text)

	return .

/// Blocks displaying flavour text in specific cases
/mob/living/carbon/proc/block_flavour_text()
	var/obj/item/bodypart/our_head = get_bodypart(BODY_ZONE_HEAD)
	if(isnull(our_head) || (HAS_TRAIT(src, TRAIT_DISFIGURED)) || (our_head.brutestate + our_head.burnstate) > 2 || !real_name || HAS_TRAIT(src, TRAIT_INVISIBLE_MAN))
		return TRUE

	if(((wear_mask && !istype(wear_mask, /obj/item/clothing/mask/gas/mime) && !istype(wear_mask, /obj/item/clothing/mask/gas/clown_hat) && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))))
		return TRUE

/mob/living/carbon/proc/get_short_description_examine_info(mob/living/user)
	. = list()
	if(block_flavour_text())
		return

	. += span_info(dna.features["flavor_text_short"])
