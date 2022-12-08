/datum/species/zombie/infectious
	armor = 0 // let's not give zombies more armor for no reason
	brutemod = 1.25 // zombies are weak to brute-force attacks

/datum/species/zombie/infectious/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	if(HAIR in old_species.species_traits)
		species_traits |= HAIR
	if(FACEHAIR in old_species.species_traits)
		species_traits |= FACEHAIR
	return ..()
