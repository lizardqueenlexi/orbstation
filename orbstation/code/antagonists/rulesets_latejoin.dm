/// Latejoin Traitor Ruleset

// Don't create more traitors if it exceeds the limit for the current population
/datum/dynamic_ruleset/latejoin/traitor/can_be_selected()
	if(!SSdynamic.traitor_limit_reached())
		return FALSE
	return ..()

/// Latejoin Contract Killer Ruleset
/datum/dynamic_ruleset/latejoin/contract_killer
	name = "Contract Killer"
	config_tag = "Contract Killer"
	preview_antag_datum = /datum/antagonist/contract_killer
	pref_flag = ROLE_KILLER_LATEJOIN
	jobban_flag = ROLE_CONTRACT_KILLER
	blacklisted_roles = list(
		JOB_HEAD_OF_PERSONNEL,
	)
	weight = 6
