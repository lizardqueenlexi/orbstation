/datum/species/ratfolk
	name = "\improper Ratfolk"
	plural_form = "Ratfolk"
	id = SPECIES_RATFOLK
	species_traits = list(
		EYECOLOR,
		HAIR,
		LIPS,
		MUTCOLORS,
	)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
		TRAIT_FAST_CRAFTER,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/ratfolk
	mutanttongue = /obj/item/organ/internal/tongue/ratfolk

	//meat = /obj/item/food/meat/slab/human/mutant/rat
	//skinned_type = /obj/item/stack/sheet/animalhide/rat

	liked_food = FRUIT | NUTS | DAIRY
	disliked_food = CLOTH | BUGS

	siemens_coeff = 0.75 // slightly resistant to shocks, but not as much as Ethereals
	brutemod = 1.3 // more vulnerable to brute damage than humans

	external_organs = list(
		/obj/item/organ/external/snout_rat = "Round",
		/obj/item/organ/external/tail/ratfolk = "High",
	)
	mutant_bodyparts = list("rat_ears" = "Round")
	mutanteyes = /obj/item/organ/internal/eyes/ratfolk
	mutantstomach = /obj/item/organ/internal/stomach/ratfolk
	mutantears = /obj/item/organ/internal/ears/ratfolk

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ratfolk,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ratfolk,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/ratfolk,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/ratfolk,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ratfolk,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ratfolk,
	)

/datum/species/ratfolk/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		var/obj/item/organ/internal/ears/ratfolk/ears = new
		ears.Insert(H, drop_if_replaced = FALSE)
	return ..()

/datum/species/ratfolk/get_species_description()
	return "The crafty, darkness-loving Ratfolk hail from vast underground cities beneath the frozen, \
	snow-swept surface of Engira. Their knack for construction and repair makes them ideal engineers, \
	and they are adept at quickly navigating through tight corridors and passageways."

/datum/species/ratfolk/get_species_lore()
	return list(
		"Life on the frigid surface of Engira is harsh and unforgiving. Its long nights are marked by \
		gale-force winds which whip up snow and ice into ferocious storms, and during the few fleeting \
		moments of daylight, the skies are dominated by the planet's apex predator, the Tal'nak - enormous, \
		monstrous birds with powerful wings and razor-sharp beaks, constantly seeking out their next meal. \
		The ratfolk of Engira, small but resourceful, decided to claw their way into the earth, leaving in \
		their wake a network of burrows which were sheltered from the cold.",

		"Beneath the surface, the ratfolk discovered the remnants of what appeared to be an old and once-powerful \
		culture, memorialized in enormous structures of brass clockwork. They uncovered writings in an ancient \
		language astonishingly similar to their own, many of which pertained to advancements in engineering, \
		architecture, and technology. Crafty as ever, they learned from these writings and applied them, rapidly \
		transforming their burrows into vast cities through projects which drew upon the collective labor and \
		ingenuity of hundreds of ratfolk working in tandem.",

		"In recent centuries, ratfolk on Engira have made great strides towards reclaiming the surface of their planet, \
		beginning work on massive, mobile fortress cities which could provide safety from their fearsome predators. \
		Meanwhile, the advent of space travel has led other ratfolk to turn to the stars, seeking an escape from the \
		frigid world they called home. In the present day, ratfolk can be found all across the galaxy, especially in \
		dark and cramped places. They have taken particularly well to industrial sectors, with many of them finding \
		work for Nanotrasen in jobs related to engineering, technology, and resources.",
	)

/datum/species/ratfolk/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "eye",
			SPECIES_PERK_NAME = "Darkvision",
			SPECIES_PERK_DESC = "Centuries of living underground have given Ratfolk superior vision in the dark.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "cheese",
			SPECIES_PERK_NAME = "Cheese Rush",
			SPECIES_PERK_DESC = "The taste of raw cheese gives Ratfolk a temporary burst of speed. However, this also drains their hunger faster.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "wrench",
			SPECIES_PERK_NAME = "Fast Crafter",
			SPECIES_PERK_DESC = "Ratfolk have nimble hands which allow them to craft things twice as fast as most people can.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "lightbulb",
			SPECIES_PERK_NAME = "Photosensitive",
			SPECIES_PERK_DESC = "Ratfolk eyes are sensitive to flashes, and will go blind faster as a result of eye damage.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "assistive-listening-systems",
			SPECIES_PERK_NAME = "Sensitive Hearing",
			SPECIES_PERK_DESC = "Ratfolk are more sensitive to loud sounds, such as flashbangs.",
		),
	)

	return to_add

/mob/living/carbon/human/species/ratfolk
	race = /datum/species/ratfolk

/obj/item/organ/internal/tongue/ratfolk
	name = "ratfolk-tongue"
	desc = "If you look closely, you can see a fine layer of cheese dust. Or is that... brass?"
	say_mod = "squeaks"
