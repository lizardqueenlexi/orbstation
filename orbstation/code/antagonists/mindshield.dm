/// Midround antagonists will not select mindshielded players.
/datum/dynamic_ruleset/midround/from_living/is_valid_candidate(mob/candidate, client/candidate_client)
	if (!HAS_TRAIT(candidate, TRAIT_MINDSHIELD))
		return FALSE
	return . = ..()
