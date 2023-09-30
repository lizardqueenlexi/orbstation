#define STASIS_SOURCE_EATEN "stasis_stomach"

/**
 * Attached to a mob who has been eaten by another mob...
 * Prevents decay and optionally also heals them.
 */
/datum/element/safe_stomach
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	/// If true we will heal the target and give them a moodlet when rescued
	var/regenerative_stomach

/datum/element/safe_stomach/Attach(datum/target, regenerative_stomach = FALSE)
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE

	var/mob/living/victim = target

	src.regenerative_stomach = regenerative_stomach
	victim.extinguish_mob() // It's wet in there
	victim.apply_status_effect(/datum/status_effect/grouped/stasis, STASIS_SOURCE_EATEN)
	if (regenerative_stomach)
		victim.fully_heal(HEAL_DAMAGE)
	RegisterSignal(victim, COMSIG_MOVABLE_MOVED, PROC_REF(on_rescued))
	RegisterSignal(victim, COMSIG_LIVING_REVIVE, PROC_REF(on_rescued))

/datum/element/safe_stomach/Detach(mob/living/source, ...)
	. = ..()
	source.remove_status_effect(/datum/status_effect/grouped/stasis, STASIS_SOURCE_EATEN)
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)

/// Remove the stasis effect
/datum/element/safe_stomach/proc/on_rescued(mob/living/rescued)
	SIGNAL_HANDLER
	if (regenerative_stomach)
		rescued.add_mood_event("regenerative core", /datum/mood_event/healsbadman/long_term) // This will still probably mostly be gone before you are alive
	rescued.RemoveElement(/datum/element/safe_stomach, regenerative_stomach = regenerative_stomach)

// Fluff moodlet from being healed by being inside a legion
/datum/mood_event/healsbadman/long_term
	timeout = 10 MINUTES

#undef STASIS_SOURCE_EATEN
