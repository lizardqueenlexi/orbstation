/mob/living/carbon/human/species/abductor/bouncer
	name = "The Bouncer"
	desc = "Elite Zetan Bouncer. Knows karate and sign language, will protect the command deck from all who are unworthy."


/mob/living/carbon/human/species/abductor/bouncer/Initialize(mapload)
	. = ..()
	fully_replace_character_name(name, "The Bouncer")

	equipOutfit(/datum/outfit/bouncer)

	ADD_TRAIT(src, TRAIT_ABDUCTOR_TRAINING, INNATE_TRAIT)

	AddComponent(/datum/component/sign_language)

/datum/outfit/bouncer
	name = "Abductor Bouncer"
	uniform = /obj/item/clothing/under/pants/jeans
	suit = /obj/item/clothing/suit/jacket/oversized
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/wheelys
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset/abductor
	r_hand = /obj/item/book/granter/martial/carp

/datum/outfit/bouncer/post_equip(mob/living/carbon/human/bouncer, visualsOnly)
	. = ..()
	var/obj/item/clothing/under/pants/jeans/bouncer_jeans = locate() in bouncer
	bouncer_jeans.set_greyscale(list("#FFFFFF", "#000000", "#303030"))

	var/obj/item/clothing/suit/jacket/oversized/bouncer_jacket = locate() in bouncer
	bouncer_jacket.set_greyscale(list("#202020"))

	bouncer.update_worn_oversuit()
	bouncer.update_worn_undersuit()

