/datum/species/ratfolk
	name = "\improper Ratfolk"
	plural_form = "Ratfolk"
	id = SPECIES_RATFOLK
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_LITERATE,
		TRAIT_FAST_CRAFTER,
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/ratfolk
	mutanttongue = /obj/item/organ/tongue/ratfolk

	siemens_coeff = 0.75 // slightly resistant to shocks, but not as much as Ethereals

	mutant_organs = list(
		/obj/item/organ/snout_rat = "Round",
		/obj/item/organ/tail/ratfolk = "High",
	)
	mutanteyes = /obj/item/organ/eyes/ratfolk
	mutantstomach = /obj/item/organ/stomach/ratfolk
	mutantears = /obj/item/organ/ears/ratfolk

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/ratfolk,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/ratfolk,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/ratfolk,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/ratfolk,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/ratfolk,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/ratfolk,
	)

/datum/species/ratfolk/get_scream_sound(mob/living/carbon/human/ratfolk)
	return 'orbstation/sound/voice/ratfolk/ratfolk_scream.ogg'

/datum/species/ratfolk/get_cough_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)

/datum/species/ratfolk/get_cry_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/ratfolk/get_sneeze_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/ratfolk/get_laugh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return pick(
		'sound/mobs/humanoids/human/laugh/manlaugh1.ogg',
		'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',
	)

/datum/species/ratfolk/get_sigh_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/ratfolk/get_sniff_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/ratfolk/get_snore_sound(mob/living/carbon/human/human)
	if(human.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

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


/datum/species/ratfolk/randomize_features()
	var/list/features = ..()
	features[FEATURE_RAT_SNOUT] = pick(SSaccessories.rat_snouts_list)
	features[FEATURE_RAT_TAIL] = pick(SSaccessories.rat_tails_list)
	features[FEATURE_RAT_EARS] = pick(SSaccessories.rat_ears_list)
	return features
