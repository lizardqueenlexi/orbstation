#define ETHEREAL_RESPAWN_TRAIT "ethereal_respawn"

#define ETHEREAL_PENALTY_FRAIL 1
#define ETHEREAL_PENALTY_FRAGILE 2
#define ETHEREAL_PENALTY_CLUMSY 3
#define ETHEREAL_PENALTY_PARAPLEGIA 4

/datum/ethereal_penalty
	var/trait
	var/output

/datum/ethereal_penalty/New(_output, _trait)
	src.trait = _trait
	src.output = _output

/datum/ethereal_penalty/proc/apply(mob/living/carbon/victim)
	if (!trait)
		return TRUE
	if (HAS_TRAIT(victim, trait))
		return FALSE
	to_chat(victim, span_notice(output))
	ADD_TRAIT(victim, trait, ETHEREAL_RESPAWN_TRAIT)
	return TRUE

/datum/ethereal_penalty/paraplegia/apply(mob/living/carbon/victim)
	if (victim.has_trauma_type(/datum/brain_trauma/severe/paralysis/paraplegic, TRAUMA_RESILIENCE_ABSOLUTE))
		return FALSE
	to_chat(victim, span_notice(output))
	victim.gain_trauma(/datum/brain_trauma/severe/paralysis/paraplegic, TRAUMA_RESILIENCE_ABSOLUTE)
	return TRUE

#define ETHEREAL_RESPAWN_PENALTIES list( \
	ETHEREAL_PENALTY_FRAIL = new /datum/ethereal_penalty("You burst out of the crystal, feeling a phantom ache from your past wounds!", TRAIT_EASILY_WOUNDED), \
	ETHEREAL_PENALTY_FRAGILE = new /datum/ethereal_penalty("You slip tentatively out of the crystal, your limbs feel like paper after their regrowth!", TRAIT_EASYDISMEMBER), \
	ETHEREAL_PENALTY_CLUMSY = new /datum/ethereal_penalty("You fall face-first out of the crystal, but at least you are alive!", TRAIT_CLUMSY), \
	ETHEREAL_PENALTY_PARAPLEGIA = new /datum/ethereal_penalty/paraplegia("You collapse forwards out of the crystal, you can't take much more of this!"),)

/obj/item/organ/heart/ethereal
///Keeps track of the amount of death we suffered
	var/respawn_count = 0

/obj/structure/ethereal_crystal/heal_ethereal()
	var/mob/living/carbon/regenerating = ethereal_heart.owner
	if (!regenerating)
		playsound(get_turf(src), 'sound/mobs/humanoids/ethereal/ethereal_revive.ogg', 100)
		qdel(src)
		return

	playsound(get_turf(regenerating), 'sound/mobs/humanoids/ethereal/ethereal_revive.ogg', 100)
	regenerating.revive(HEAL_ALL & ~HEAL_REFRESH_ORGANS)

	ethereal_heart = regenerating.get_organ_slot(ORGAN_SLOT_HEART)
	if (!(prob(90) && apply_new_penalty()))
		to_chat(regenerating, span_notice("[notify_player_consequences()]"))

	if (ethereal_heart.respawn_count >= ETHEREAL_PENALTY_CLUMSY)
		regenerating.Paralyze(5 SECONDS)

	var/random_trauma = pick(GLOB.orb_mysterious_brain_traumas)
	regenerating.gain_trauma(random_trauma, TRAUMA_RESILIENCE_SURGERY)

	if(!QDELETED(src))
		qdel(src)

/**
 * Tries to apply a new penalty from our list of penalties.
 * Returns false if we go through the whole list and can't find any left to apply.
 */
/obj/structure/ethereal_crystal/proc/apply_new_penalty()
	ethereal_heart.respawn_count++
	if (ethereal_heart.respawn_count > ETHEREAL_PENALTY_PARAPLEGIA)
		return FALSE
	var/datum/ethereal_penalty/penalty = ETHEREAL_RESPAWN_PENALTIES[ethereal_heart.respawn_count]
	if (penalty.apply(ethereal_heart.owner))
		return TRUE
	return apply_new_penalty()

/**
 * Gets a message for the player to be shown if they didn't get one from receiving a specific penalty.
 * Either they have all of them, or got lucky enough not to get one this time around.
 */
/obj/structure/ethereal_crystal/proc/notify_player_consequences()
	if (ethereal_heart.respawn_count >= ETHEREAL_PENALTY_PARAPLEGIA)
		return "You flop out of the crystal sluggishly, but have become accustomed to this at this point."
	if (ethereal_heart.respawn_count >= ETHEREAL_PENALTY_CLUMSY)
		return "You burst out of the crystal with vigour... and fall on your face."
	return "You burst out of the crystal with vigour, miraculously unharmed!"

#undef ETHEREAL_RESPAWN_PENALTIES
#undef ETHEREAL_RESPAWN_TRAIT

#undef ETHEREAL_PENALTY_FRAIL
#undef ETHEREAL_PENALTY_FRAGILE
#undef ETHEREAL_PENALTY_CLUMSY
#undef ETHEREAL_PENALTY_PARAPLEGIA
