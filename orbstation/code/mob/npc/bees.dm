// Variant of the poisonous bees summoned by the "Anthophillia" holodeck simulation, which die after stinging once.
/mob/living/basic/bee/toxin/holo
	name = "holographic bee"
	desc = "Someone should probably turn that simulation off, huh?"

/mob/living/basic/bee/toxin/holo/melee_attack(atom/target, list/modifiers, ignore_cooldown)
	. = ..()
	if (.)
		death()

/obj/effect/holodeck_effect/mobspawner/bee
	mobtype = /mob/living/basic/bee/toxin/holo
