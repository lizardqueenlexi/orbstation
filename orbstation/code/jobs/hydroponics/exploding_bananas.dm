// Modifies grown bananas to not explode
/obj/item/seeds/banana
	reagents_add = list(/datum/reagent/consumable/banana = 0.1, /datum/reagent/potassium_salt = 0.1, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.02)

/datum/reagent/potassium_salt
	name = "Potassium Salt"
	description = "A form of potassium that is commonly found in bananas. A little bit of heat can turn it into regular potassium."
	color = "#E0E0E0" // rgb: 224, 224, 224
	taste_description = "antics"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/chemical_reaction/potassium_metal
	results = list(/datum/reagent/potassium = 1)
	required_reagents = list(/datum/reagent/potassium_salt = 1)
	reaction_flags = REACTION_INSTANT
	reaction_tags = REACTION_TAG_EASY
	required_temp = 320
