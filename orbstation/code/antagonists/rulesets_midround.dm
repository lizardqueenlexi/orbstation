/// Midround Traitor Ruleset (From Living)

// Don't create more traitors if it exceeds the limit for the current population & threat level.
/datum/dynamic_ruleset/midround/from_living/autotraitor/ready(forced = FALSE)
	if(!forced)
		if(!SSdynamic.calculate_traitor_limit())
			message_admins("Midround ruleset [name] could not be executed due to the traitor limit.")
			return FALSE
	return ..()

/// Midround Changeling Infiltrator Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator
	name = "Changeling Infiltrator"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_HEAVY
	antag_flag = ROLE_CHANGELING_INFILTRATOR
	antag_flag_override = ROLE_CHANGELING
	antag_datum = /datum/antagonist/changeling/infiltrator
	weight = 5
	cost = 12
	requirements = list(101,60,50,50,40,20,20,10,10,10)
	required_candidates = 1
	repeatable = FALSE

/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator/generate_ruleset_body(mob/applicant)
	var/mob/living/carbon/human/new_mob = spawn_infiltrator(applicant, INFIL_SPAWNER_LING)
	return new_mob

/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator/finish_setup(mob/new_character, index)
	return // the spawned player is given the antag datum via the spawner, so we don't need to do it here

/// Midround Smuggled Syndicate Agent Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/smuggled_syndicate_agent
	name = "Smuggled Syndicate Agent"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_HEAVY
	antag_flag = ROLE_SMUGGLED_AGENT
	antag_flag_override = ROLE_TRAITOR
	antag_datum = /datum/antagonist/traitor/agent
	weight = 5
	cost = 8
	requirements = list(101,60,50,50,40,20,20,10,10,10)
	required_candidates = 1
	repeatable = FALSE

/datum/dynamic_ruleset/midround/from_ghosts/smuggled_syndicate_agent/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/smuggled_syndicate_agent/generate_ruleset_body(mob/applicant)
	var/mob/living/carbon/human/new_mob = spawn_infiltrator(applicant, INFIL_SPAWNER_TRAITOR)
	return new_mob

/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator/finish_setup(mob/new_character, index)
	return // the spawned player is given the antag datum via the spawner, so we don't need to do it here

/// Midround Wizard Journeyman Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/wizard_journeyman
	name = "Wizard Journeyman"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_HEAVY
	antag_datum = /datum/antagonist/wizard_journeyman
	antag_flag = ROLE_WIZARD_JOURNEYMAN
	antag_flag_override = ROLE_WIZARD
	required_enemies = list(2,2,2,2,1,1,1,0,0,0)
	requirements = list(101,101,60,50,40,30,20,10,10,10)
	required_candidates = 1
	weight = 5
	cost = 12
	enemy_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
		JOB_CHAPLAIN,
	)

/datum/dynamic_ruleset/midround/from_ghosts/wizard_journeyman/ready(forced = FALSE)
	if (!check_candidates())
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/wizard_journeyman/finish_setup(mob/new_character, index)
	..()
	if (GLOB.journeymanstart.len)
		new_character.forceMove(pick(GLOB.journeymanstart))

/// Midround Heretic Ruleset (From Living)
/datum/dynamic_ruleset/midround/from_living/waking_heretic
	name = "Waking Heretic"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_LIGHT // heretics need time to set up, so this should happen earlier in the round
	antag_datum = /datum/antagonist/heretic
	antag_flag = ROLE_HERETIC_MIDROUND
	antag_flag_override = ROLE_HERETIC
	protected_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_PRISONER,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
		ROLE_POSITRONIC_BRAIN,
	)
	requirements = list(10,101,50,40,35,20,20,15,10,10)
	required_enemies = list(1,1,1,1,1,1,1,1,1,1) // the game is supposed to make one of your sac targets a security member
	required_candidates = 1
	minimum_players = 15 // same as the other heretic roles as listed in our dynamic.json
	weight = 3
	cost = 10
	repeatable = TRUE

/datum/dynamic_ruleset/midround/from_living/waking_heretic/trim_candidates()
	..()
	candidates = living_players
	for(var/mob/living/player in candidates)
		if(issilicon(player))
			candidates -= player
		else if(is_centcom_level(player.z))
			candidates -= player
		else if(player.mind && (player.mind.special_role || player.mind.antag_datums?.len > 0))
			candidates -= player

/datum/dynamic_ruleset/midround/from_living/waking_heretic/execute()
	var/list/weighted_candidates = generate_weighted_candidate_list(candidates)
	var/mob/picked_mob = pick_weight(weighted_candidates)
	candidates -= picked_mob
	assigned += picked_mob
	var/datum/antagonist/heretic/new_heretic = picked_mob.mind.add_antag_datum(antag_datum)
	message_admins("[ADMIN_LOOKUPFLW(picked_mob)] was selected by the [name] ruleset and has been made into a midround heretic.")
	log_game("DYNAMIC: [key_name(picked_mob)] was selected by the [name] ruleset and has been made into a midround heretic.")

	// Heretics passively gain influence over time.
	// As a consequence, latejoin heretics start out at a massive
	// disadvantage if the round's been going on for a while.
	// Let's give them some influence points when they arrive.
	new_heretic.knowledge_points += round((world.time - SSticker.round_start_time) / new_heretic.passive_gain_timer)
	// BUT let's not give smugglers a million points on arrival.
	// Limit it to four missed passive gain cycles (4 points).
	new_heretic.knowledge_points = min(new_heretic.knowledge_points, 5)

	return TRUE

/// Midround Lone Operative Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/lone_operative
	name = "Lone Operative"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_HEAVY
	antag_datum = /datum/antagonist/nukeop/lone
	antag_flag = ROLE_LONE_OPERATIVE
	antag_flag_override = ROLE_NUCLEAR_OPERATIVE
	required_enemies = list(2,2,2,2,1,1,1,0,0,0)
	requirements = list(101,60,50,40,30,20,10,10,10,10)
	required_candidates = 1
	weight = 4
	cost = 5
	minimum_round_time = 45 MINUTES
	enemy_roles = list(
		JOB_AI,
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
	)

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/ready(forced = FALSE)
	if (!check_candidates())
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/finish_setup(mob/new_character, index)
	..()
	new_character.mind.set_assigned_role(SSjob.GetJobType(/datum/job/lone_operative))

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/finish_setup(mob/new_character, index)
	..()
	var/list/spawn_locs = list()
	for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
		spawn_locs += L.loc
	if(!spawn_locs.len)
		return MAP_ERROR
	new_character.forceMove(pick(spawn_locs))
	addtimer(CALLBACK(src, PROC_REF(delay_announce)), 2 MINUTES)

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative/proc/delay_announce()
	priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)

/// Midround Clown Lone Operative Ruleset (From Ghosts)
/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny
	name = "Lone Clown Operative"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_HEAVY
	antag_datum = /datum/antagonist/nukeop/clownop/lone
	antag_flag = ROLE_CLOWN_LONE_OPERATIVE
	antag_flag_override = ROLE_NUCLEAR_OPERATIVE
	requirements = list(101,60,50,40,30,20,10,10,10,10)
	required_candidates = 1
	weight = 2
	cost = 5
	minimum_round_time = 40 MINUTES

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/ready(forced = FALSE)
	if (!check_candidates())
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/finish_setup(mob/new_character, index)
	..()
	new_character.mind.set_assigned_role(SSjob.GetJobType(/datum/job/clown_operative))

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/finish_setup(mob/new_character, index)
	..()
	var/list/spawn_locs = list()
	for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
		spawn_locs += L.loc
	if(!spawn_locs.len)
		return MAP_ERROR
	new_character.forceMove(pick(spawn_locs))
	addtimer(CALLBACK(src, PROC_REF(delay_announce)), 2 MINUTES)

/datum/dynamic_ruleset/midround/from_ghosts/lone_operative_funny/proc/delay_announce()
	priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)

/// Midround Contract Killer Ruleset (From Living)
/datum/dynamic_ruleset/midround/from_living/contract_killer
	name = "Contract Killer"
	midround_ruleset_style = MIDROUND_RULESET_STYLE_LIGHT
	antag_datum = /datum/antagonist/contract_killer
	antag_flag = ROLE_CONTRACT_KILLER
	restricted_roles = list(
		JOB_AI,
		JOB_CYBORG,
		ROLE_POSITRONIC_BRAIN,
	)
	required_enemies = list(1,1,1,0,0,0,0,0,0,0)
	required_candidates = 1
	weight = 4
	cost = 3
	repeatable = FALSE

/datum/dynamic_ruleset/midround/from_living/contract_killer/trim_candidates()
	..()
	candidates = living_players
	for(var/mob/living/player in candidates)
		if(issilicon(player))
			candidates -= player
		else if(is_centcom_level(player.z))
			candidates -= player
		else if(player.mind && (player.mind.special_role || player.mind.antag_datums?.len > 0))
			candidates -= player

/datum/dynamic_ruleset/midround/from_living/contract_killer/execute()
	var/mob/living/carbon/human/killer = pick_n_take(candidates)
	var/datum/antagonist/contract_killer/new_killer = new
	killer.mind.add_antag_datum(new_killer)
	message_admins("[ADMIN_LOOKUPFLW(killer)] has been made into a Contract Killer by the midround ruleset.")
	log_game("[key_name(killer)] was made into a Contract Killer by the midround ruleset.")
	return TRUE
