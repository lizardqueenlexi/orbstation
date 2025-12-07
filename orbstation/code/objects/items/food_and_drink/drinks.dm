/obj/item/reagent_containers/cup/glass/bottle/kortara
	name = "Imperial Reserve Kortara"
	desc = "A bottle of sweet kortara, imported directly from Tizira."
	icon = 'orbstation/icons/obj/drinks.dmi'
	icon_state = "kortara"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/kortara = 100)

// Slime wine. Poisons you, but it's a really good drink... (Could make this do something special based on the core you make it with. If we want.)
/datum/reagent/consumable/ethanol/slimewine
	name = "Slime Wine"
	description = "A strangely appetizing wine made of a fermented slime core. Bad for you, and yet..."
	boozepwr = 45
	color = "#7DF9FF"
	quality = DRINK_FANTASTIC
	taste_description = "tangy neurotoxin"

/obj/item/reagent_containers/cup/glass/bottle/slimewine
	name = "Slime Wine"
	desc = "A bottle of delicious, mildly toxic slime wine. It tastes so good, maybe your liver will forgive you later. FOR SIPPING ONLY."
	icon = 'orbstation/icons/obj/drinks.dmi'
	icon_state = "slimewine"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/slimewine = 100)

/datum/glass_style/drinking_glass/slimewine
	required_drink_type = /datum/reagent/consumable/ethanol/slimewine
	name = "Slime Wine"
	desc = "A glass of thick, gelatinous wine. Mildly toxic, but the taste is almost irresistable."
	icon = 'orbstation/icons/obj/drinks.dmi'
	icon_state = "slimewineglass"

/datum/reagent/consumable/ethanol/slimewine/on_mob_life(mob/living/carbon/drinker, delta_time, times_fired)
	drinker.adjust_tox_loss(1 * REM * delta_time, FALSE, required_biotype = affected_biotype)
	return ..()

/datum/crafting_recipe/slimewine
	name = "Slime Wine"
	time = 40
	reqs = list(
		/obj/item/slime_extract = 1,
		/datum/reagent/consumable/ethanol = 100
	)
	result = /obj/item/reagent_containers/cup/glass/bottle/slimewine
	category = CAT_DRINK
