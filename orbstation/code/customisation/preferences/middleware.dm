/// Called when applying preferences to the mob.
/datum/preference_middleware/proc/apply_to_human(mob/living/carbon/human/target, datum/preferences/preferences)
	SHOULD_NOT_SLEEP(TRUE)
	SHOULD_CALL_PARENT(FALSE)
	return
