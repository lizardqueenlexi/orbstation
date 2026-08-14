/datum/status_effect/zombie
	damage_modifier = 0 // upstream this is 20, which means you need 120 damage to KO a zombie, which kills it, we decreased it to 0

// Also we made zombies vulnerable to brute damage
/datum/status_effect/zombie/on_apply()
	. = ..()
	if (!.)
		return

	var/mob/living/carbon/human/new_zombie = owner
	new_zombie.physiology.brute_mod *= 1.25

/datum/status_effect/zombie/on_remove()
	. = ..()

	var/mob/living/carbon/human/new_zombie = owner
	new_zombie.physiology.brute_mod /= 1.25
