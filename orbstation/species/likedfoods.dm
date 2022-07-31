/datum/species/human/felinid/New()
	liked_food |= CARRION
	disliked_food &= ~CARRION // Inherited from humans
	return ..()

/datum/species/fly/New()
	liked_food |= CARRION
	return ..()

/datum/species/golem/bone/New()
	liked_food |= CARRION
	return ..()

/datum/species/human/New()
	disliked_food |= CARRION
	return ..()

/datum/species/lizard/New()
	liked_food |= CARRION
	liked_food &= ~GROSS
	disliked_food |= GROSS
	return ..()

/datum/species/jelly/New()
	liked_food |= CARRION
	return ..()

/datum/species/moth/New()
	toxic_food |= CARRION
	return ..()

/datum/species/skeleton/New()
	liked_food |= CARRION
	return ..()

/datum/species/zombie/New()
	liked_food |= CARRION
	return ..()
