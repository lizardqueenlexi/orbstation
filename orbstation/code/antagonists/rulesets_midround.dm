/// Midround Traitor Ruleset (From Living)

// Don't create more traitors if it exceeds the limit for the current population
/datum/dynamic_ruleset/midround/from_living/autotraitor/can_be_selected()
	if(!SSdynamic.traitor_limit_reached())
		message_admins("Midround ruleset [name] could not be executed due to the traitor limit.")
		return FALSE
	return ..()

/// Midround Changeling Infiltrator Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/changeling_infiltrator
	name = "Changeling Infiltrator"
	config_tag = "Changeling Infiltrator"
	preview_antag_datum = /datum/antagonist/changeling/infiltrator
	midround_type = HEAVY_MIDROUND
	pref_flag = ROLE_CHANGELING_INFILTRATOR
	jobban_flag = ROLE_CHANGELING
	ruleset_flags = RULESET_INVADER
	weight = 5
	repeatable = FALSE
	min_antag_cap = 0 // ship will spawn if there are no ghosts around

/datum/dynamic_ruleset/midround/changeling_infiltrator/execute()
	spawn_infiltrator(INFIL_SPAWNER_LING, name, jobban_flag, /obj/item/melee/arm_blade)

/// Midround Smuggled Syndicate Agent Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/smuggled_syndicate_agent
	name = "Smuggled Syndicate Agent"
	config_tag = "Smuggled Syndicate Agent"
	preview_antag_datum = /datum/antagonist/traitor/agent
	midround_type = HEAVY_MIDROUND
	pref_flag = ROLE_SMUGGLED_AGENT
	jobban_flag = ROLE_TRAITOR
	ruleset_flags = RULESET_INVADER
	weight = 5
	repeatable = FALSE
	min_antag_cap = 0 // ship will spawn if there are no ghosts around

/datum/dynamic_ruleset/midround/smuggled_syndicate_agent/execute()
	spawn_infiltrator(INFIL_SPAWNER_TRAITOR, name, jobban_flag, /obj/item/melee/energy/sword)

/// Midround Wizard Journeyman Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/wizard_journeyman
	name = "Wizard Journeyman"
	config_tag = "Wizard Journeyman"
	preview_antag_datum = /datum/antagonist/wizard_journeyman
	midround_type = HEAVY_MIDROUND
	candidate_role = "Wizard Journeyman"
	pref_flag = ROLE_WIZARD_JOURNEYMAN
	ruleset_flags = RULESET_INVADER
	jobban_flag = ROLE_WIZARD
	weight = 5

/datum/dynamic_ruleset/midround/from_ghosts/wizard_journeyman/assign_role(datum/mind/candidate)
	candidate.add_antag_datum(/datum/antagonist/wizard_journeyman) // moves to lair for us

/// Midround Lone Operative Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/lone_operative
	name = "Lone Operative"
	config_tag = "Lone Operative"
	preview_antag_datum = /datum/antagonist/nukeop/lone
	midround_type = HEAVY_MIDROUND
	candidate_role = "Lone Operative"
	pref_flag = ROLE_LONE_OPERATIVE
	jobban_flag = ROLE_LONE_OPERATIVE
	ruleset_flags = RULESET_INVADER
	weight = 4

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/can_be_selected()
	return ..() && !SSmapping.is_planetary() && !isnull(find_space_spawn())

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/assign_role(datum/mind/candidate)
	candidate.set_assigned_role(SSjob.get_job_type(/datum/job/lone_operative))
	candidate.current.forceMove(find_space_spawn())
	addtimer(CALLBACK(src, PROC_REF(delay_announce)), 2 MINUTES)

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/proc/delay_announce()
	priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)

/// Midround Clown Lone Operative Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny
	name = "Lone Clown Operative"
	config_tag = "Lone Clown Operative"
	preview_antag_datum = /datum/antagonist/nukeop/clownop/lone
	midround_type = HEAVY_MIDROUND
	pref_flag = ROLE_CLOWN_LONE_OPERATIVE
	jobban_flag = ROLE_CLOWN_LONE_OPERATIVE
	ruleset_flags = RULESET_INVADER
	weight = 2

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/can_be_selected()
	return ..() && !SSmapping.is_planetary() && !isnull(find_space_spawn())

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/assign_role(datum/mind/candidate)
	candidate.set_assigned_role(SSjob.get_job_type(/datum/job/clown_operative))
	candidate.current.forceMove(find_space_spawn())
	addtimer(CALLBACK(src, PROC_REF(delay_announce)), 2 MINUTES)

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/proc/delay_announce()
	priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)

/// Midround Contract Killer Ruleset (From Living)
/datum/dynamic_ruleset/midround/from_living/contract_killer
	name = "Contract Killer"
	config_tag = "Contract Killer"
	midround_type = LIGHT_MIDROUND
	preview_antag_datum = /datum/antagonist/contract_killer
	pref_flag = ROLE_CONTRACT_KILLER
	jobban_flag = ROLE_CONTRACT_KILLER
	weight = 4
	repeatable = FALSE
