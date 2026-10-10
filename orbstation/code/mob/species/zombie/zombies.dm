/datum/status_effect/zombie
	damage_modifier = 0 // upstream this is 20, which means you need 120 damage to KO a zombie, which kills it, we decreased it to 0

// Also we made zombies vulnerable to brute damage
/datum/status_effect/zombie/on_apply()
	. = ..()
	if (!.)
		return
	MODIFY_PHYSIOLOGY(owner, BRUTE, 1.25)

/datum/status_effect/zombie/on_remove()
	. = ..()
	MODIFY_PHYSIOLOGY(owner, BRUTE, 0.8)
