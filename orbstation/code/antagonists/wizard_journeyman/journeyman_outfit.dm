/**
 * Clothes fit for a grad student
 * Maybe one day we can replace or expand these with some even shittier looking robes
 */
/datum/outfit/journeyman_wizard
	name = "Journeyman Wizard"

	uniform = /obj/item/clothing/under/color/lightpurple
	back = /obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/wizard_diploma = 1, )
	ears = /obj/item/radio/headset
	shoes = /obj/item/clothing/shoes/sandal/magic
	r_pocket = /obj/item/teleportation_scroll/apprentice/announcement // You just get to the station, then you're on your own
	r_hand = /obj/item/reagent_containers/cup/glass/bottle/beer/almost_empty

/// Randomise outfit
/datum/outfit/journeyman_wizard/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	var/random_outfit = (visualsOnly) ? 1 : rand(1, 3) // Don't randomise on prefs screen
	switch(random_outfit)
		if (1)
			suit = /obj/item/clothing/suit/wizrobe
			head = /obj/item/clothing/head/wizard
		if (2)
			suit = /obj/item/clothing/suit/wizrobe/red
			head = /obj/item/clothing/head/wizard/red
		if (3)
			suit = /obj/item/clothing/suit/wizrobe/marisa
			head = /obj/item/clothing/head/wizard/marisa
			shoes = /obj/item/clothing/shoes/sneakers/marisa

/// Sign the diploma
/datum/outfit/journeyman_wizard/post_equip(mob/living/carbon/human/wizard, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	var/obj/item/wizard_diploma/diploma = locate() in wizard.back
	if(diploma)
		diploma.owner = wizard.mind

/// Special scroll that announces the wizard's teleporting
/obj/item/teleportation_scroll/apprentice/announcement

/obj/item/teleportation_scroll/apprentice/announcement/on_spell_cast(datum/action/cooldown/spell/cast_spell, mob/living/cast_on)
	priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)
	return ..()
