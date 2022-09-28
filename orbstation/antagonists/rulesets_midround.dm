//////////////////////////////////////////////
//                                          //
//           SYNDICATE TRAITORS             //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/from_living/autotraitor
	counts_toward_traitor_limit = TRUE

// Don't create more traitors if it exceeds the limit for the current population & threat level.
/datum/dynamic_ruleset/midround/from_living/autotraitor/ready(forced = FALSE)
	if(!forced)
		if(!mode.calculate_traitor_limit())
			message_admins("Midround ruleset [name] could not be executed due to the traitor limit.")
			return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_living/autotraitor/execute()
	mode.traitor_limit_antag_count ++
	return ..()

//////////////////////////////////////////////
//                                          //
//         CHANGELING INFILTRATOR           //
//                                          //
//////////////////////////////////////////////

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
	var/mob/living/carbon/human/new_mob = spawn_changeling_infiltrator(applicant)
	return new_mob

/datum/dynamic_ruleset/midround/from_ghosts/changeling_infiltrator/finish_setup(mob/new_character, index)
	return // the spawned player is given the antag datum via the spawner, so we don't need to do it here

//////////////////////////////////////////////
//                                          //
//            HERETIC (MIDROUND)            //
//                                          //
//////////////////////////////////////////////

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
	enemy_roles = list(
		JOB_HEAD_OF_SECURITY,
		JOB_DETECTIVE,
		JOB_WARDEN,
		JOB_SECURITY_OFFICER,
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
	var/mob/picked_mob = pick(candidates)
	assigned += picked_mob
	candidates -= picked_mob
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
