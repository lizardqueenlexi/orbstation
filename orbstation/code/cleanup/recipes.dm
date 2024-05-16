// Hides some things we don't want to be craftable
/datum/crafting_recipe/tailclub
	non_craftable = TRUE

/datum/crafting_recipe/tailwhip
	non_craftable = TRUE

/datum/crafting_recipe/catwhip
	non_craftable = TRUE

/datum/crafting_recipe/lizardhat
	non_craftable = TRUE

/datum/crafting_recipe/lizardhat_alternate
	non_craftable = TRUE

/datum/crafting_recipe/food/catburger
	non_craftable = TRUE

/datum/crafting_recipe/food/tailkebab
	non_craftable = TRUE

/datum/crafting_recipe/lizardwine
	non_craftable = TRUE

// Changes some recipes for things whose ingredients we don't like
/datum/crafting_recipe/lizardboots
	name = "Tiziran Cowboy Boots"
	reqs = list(/obj/item/stack/sheet/leather = 2) //not made of lizard skin, that would be fucked up

/datum/chemical_reaction/omegasoapification
	required_reagents = list(/datum/reagent/consumable/potato_juice = 10, /datum/reagent/consumable/ethanol/slimewine = 10, /datum/reagent/monkey_powder = 10, /datum/reagent/drug/krokodil = 10, /datum/reagent/toxin/acid/nitracid = 10, /datum/reagent/baldium = 10, /datum/reagent/consumable/ethanol/hooch = 10, /datum/reagent/bluespace = 10, /datum/reagent/drug/pumpup = 10, /datum/reagent/consumable/space_cola = 10)

/datum/chemical_reaction/scream
	required_reagents = list(/datum/reagent/medicine/strange_reagent = 1, /datum/reagent/consumable/cream = 5, /datum/reagent/consumable/ethanol/slimewine = 5 )

/datum/chemical_reaction/drink/planet_cracker
	required_reagents = list(/datum/reagent/consumable/ethanol/champagne = 10, /datum/reagent/consumable/ethanol/toxins_special = 10, /datum/reagent/consumable/ice = 1, /datum/reagent/silicon = 5)
