/// Latejoin Traitor Ruleset

// Don't create more traitors if it exceeds the limit for the current population & threat level.
/datum/dynamic_ruleset/latejoin/infiltrator/ready(forced = FALSE)
	if(!forced)
		if(!SSdynamic.calculate_traitor_limit())
			return FALSE
	return ..()

/// Latejoin Heretic Ruleset

/datum/dynamic_ruleset/latejoin/heretic_smuggler
	required_enemies = list(1,1,1,1,1,1,1,1,1,1) // the game is supposed to make one of your sac targets a security member

/// Latejoin Contract Killer Ruleset
/datum/dynamic_ruleset/latejoin/contract_killer
	name = "Contract Killer"
	antag_datum = /datum/antagonist/contract_killer
	antag_flag = ROLE_KILLER_LATEJOIN
	antag_flag_override = ROLE_CONTRACT_KILLER
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
	)
	required_candidates = 1
	weight = 6
	cost = 3
	repeatable = FALSE
