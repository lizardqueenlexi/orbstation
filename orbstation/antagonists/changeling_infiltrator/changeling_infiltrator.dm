// Changeling Infiltrator: ghost role that spawns on a pilotable shuttle out in deep space,
// given the objective to sneak on board the station and infiltrate the crew.

/datum/job/changeling_infiltrator
	title = "Changeling Infiltrator"

/datum/antagonist/changeling/infiltrator
	name = "\improper Changeling Infiltrator"

/// Override objectives with ones where you're very hungry
/datum/antagonist/changeling/infiltrator/forge_objectives()
	var/datum/objective/true_absorb/absorb_objective = new
	absorb_objective.owner = owner
	absorb_objective.gen_amount_goal()
	objectives += absorb_objective

	var/datum/objective/escape/escape_objective = new
	escape_objective.owner = owner
	objectives += escape_objective

// Event that spawns the changeling and their ship. Does not alert the crew (obviously)

/datum/round_event_control/changeling_infiltrator
	name = "Changeling Infiltrator"
	description = "A Changeling Infiltrator spawns in a pod, tasked to eat some of the crew."
	category = EVENT_CATEGORY_INVASION
	typepath = /datum/round_event/ghost_role/changeling_infiltrator
	weight = 8 // slightly higher than aliens
	min_players = 14
	earliest_start = 30 MINUTES
	max_occurrences = 1
	dynamic_should_hijack = TRUE

/datum/round_event/ghost_role/changeling_infiltrator
	role_name = "changeling infiltrator"

/datum/round_event/ghost_role/changeling_infiltrator/spawn_role()
	var/list/candidates = get_candidates(ROLE_CHANGELING, ROLE_CHANGELING_INFILTRATOR)
	if(!candidates.len) // we only need one
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick_n_take(candidates)

	var/mob/living/new_mob = spawn_changeling_infiltrator(selected)

	if(!new_mob)
		return NOT_ENOUGH_PLAYERS

	spawned_mobs += new_mob

	return SUCCESSFUL_SPAWN

///Proc that spawns the changeling infiltrator's pod and makes the spawner spawn them. Also called by the changeling infiltrator ruleset
/proc/spawn_changeling_infiltrator(mob/new_ling)
	if(!new_ling)
		return

	var/turf/T
	var/datum/map_template/shuttle/changeling_pod/ship = new
	if(SSmapping.empty_space) // if there's an empty space z level, spawn the pod somewhere there
		var/x = rand(TRANSITIONEDGE,world.maxx - TRANSITIONEDGE - ship.width)
		var/y = rand(TRANSITIONEDGE,world.maxy - TRANSITIONEDGE - ship.height)
		var/z = SSmapping.empty_space.z_value
		T = locate(x,y,z)
	else // otherwise, try to use a random carp spawn location
		var/list/spawn_points = list()
		for(var/obj/effect/landmark/carpspawn/C in GLOB.landmarks_list)
			spawn_points += C
		var/obj/pod_spawn = pick(spawn_points)
		T = locate(pod_spawn.x,pod_spawn.y,pod_spawn.z)
		pod_spawn.Destroy() // removes the spawn point from the landmarks list so the game doesn't spawn a carp on our poor changeling

	if(!T)
		CRASH("Changeling infiltrator event found no turf to load in.")

	if(!ship.load(T, centered = TRUE))
		CRASH("Loading changeling infiltrator ship failed!")

	// Spawns the changeling at the changeling spawner object
	// don't feel great about this, but the problem is that get_affected_turfs returns a list of turfs
	// so you have to loop through the turfs and then loop through each turf to find the spawner object
	// the pirate event also does this. it is what it is
	for(var/turf/A in ship.get_affected_turfs(T, centered = TRUE))
		for(var/obj/effect/mob_spawn/ghost_role/human/changeling_infiltrator/spawner in A)
			var/mob/living/carbon/human/new_mob = spawner.create(new_ling)
			return new_mob

/obj/effect/mob_spawn/ghost_role/human/changeling_infiltrator
	name = "changeling sleeper"
	desc = "An old cryo sleeper, desperately frozen shut many years ago."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "a changeling infiltrator"
	outfit = /datum/outfit/changeling_infiltrator
	anchored = TRUE
	density = FALSE
	show_flavor = FALSE //Flavour only exists for spawners menu
	you_are_text = "You are a changeling infiltrator."
	flavour_text = "You awaken in an abandoned escape pod in a forsaken part of the galaxy. As you slowly regain your senses, your memories start to resurface... \
	that old station, a chaotic brawl, blood and organs strewn everywhere... then pod doors hissing shut, and finally, nothing but silence. \
	Those scientists thought they could seal you away forever. They were wrong."
	important_text = "Use the navigation computer and shuttle console to navigate the pod to the station, and sneak your way on board."
	spawner_job_path = /datum/job/changeling_infiltrator

///Makes the player a changeling with a unique objective to fully absorb a certain amount of people, as well as an escape objective
/obj/effect/mob_spawn/ghost_role/human/changeling_infiltrator/special(mob/living/spawned_mob, mob/mob_possessor)
	. = ..()

	to_chat(spawned_mob, span_alert("[flavour_text]"))
	var/datum/antagonist/changeling/infiltrator/antag_datum = new
	spawned_mob.mind.add_antag_datum(antag_datum)
	to_chat(spawned_mob, span_alert("[important_text]"))

// True absorb objective - this requires using the absorb ability, *NOT* DNA sting

/datum/objective/true_absorb
	name = "true absorb"

///Sets the number of required absorbs. 1 + 1 extra absorb for every [players_per_absorb] players, up to a maximum of [target_cap]
/datum/objective/true_absorb/proc/gen_amount_goal(players_per_absorb = 10, target_cap = 5)
	target_amount = 1
	var/player_count = 0
	var/list/datum/mind/owners = get_owners()
	if (SSticker.current_state == GAME_STATE_SETTING_UP)
		for(var/i in GLOB.new_player_list)
			var/mob/dead/new_player/P = i
			if(P.ready == PLAYER_READY_TO_PLAY && !(P.mind in owners))
				player_count ++
				if(player_count == players_per_absorb)
					target_amount ++
					player_count = 0
	else if (SSticker.IsRoundInProgress())
		for(var/mob/living/carbon/human/P in GLOB.player_list)
			if(!(P.mind.has_antag_datum(/datum/antagonist/changeling)) && !(P.mind in owners))
				player_count ++
				if(player_count == players_per_absorb)
					target_amount ++
					player_count = 0

	target_amount = min(target_amount, target_cap)

	update_explanation_text()
	return target_amount

/datum/objective/true_absorb/update_explanation_text()
	. = ..()
	explanation_text = "Fully absorb the DNA of [target_amount] [target_amount > 1 ? "people" : "person"]."

/datum/objective/true_absorb/admin_edit(mob/admin)
	var/count = input(admin,"How many people to absorb?","absorb",target_amount) as num|null
	if(count)
		target_amount = count
	update_explanation_text()

/datum/objective/true_absorb/check_completion()
	var/list/datum/mind/owners = get_owners()
	var/absorbed_count = 0
	for(var/datum/mind/M in owners)
		if(!M)
			continue
		var/datum/antagonist/changeling/changeling = M.has_antag_datum(/datum/antagonist/changeling)
		if(!changeling || !changeling.stored_profiles)
			continue
		absorbed_count += changeling.true_absorbs

	return absorbed_count >= target_amount

// Outfit that the changeling spawns with
// Includes some chameleon gear to make them less immediately suspicious, but anyone attentive will notice they're not on the crew manifest

/datum/outfit/changeling_infiltrator
	name = "Changeling Infiltrator"
	uniform = /obj/item/clothing/under/chameleon
	shoes = /obj/item/clothing/shoes/chameleon
	back = /obj/item/storage/backpack/chameleon
	r_pocket = /obj/item/flashlight
	id = /obj/item/card/id/advanced/chameleon // agent ID also gives them maint access, which is very important
	box = /obj/item/storage/box/survival/engineer/radio

// the toolbox on their pod has the contents and power of a Syndicate toolbox but looks like a normal emergency one

/obj/item/storage/toolbox/syndicate/secret
	name = "emergency toolbox"
	desc = "Danger. Very robust."
	icon_state = "red"
	inhand_icon_state = "toolbox_red"
	material_flags = NONE

// The ship the infiltrator spawns on

/area/shuttle/changeling_pod
	name = "Abandoned Pod"
	requires_power = TRUE

// see _maps\shuttles\changeling_pod.dmm

/datum/map_template/shuttle/changeling_pod
	name = "abandoned pod"
	port_id = "changeling"
	suffix = "pod"

/obj/machinery/computer/shuttle/changeling_pod
	name = "abandoned pod console"
	shuttleId = "changelingpod"
	icon_screen = "commsyndie"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
	possible_destinations = "changelingpod_away;changelingpod_home;changelingpod_custom"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/changeling_pod
	name = "abandoned pod navigation computer"
	desc = "Used to designate a precise transit location for the abandoned pod."
	shuttleId = "changelingpod"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "changelingpod_custom"
	x_offset = 0
	y_offset = 2
	see_hidden = TRUE

/obj/docking_port/mobile/changeling_pod
	name = "abandoned pod"
	shuttle_id = "changelingpod"
	rechargeTime = 10 MINUTES // long recharge time since you're not meant to use it too often
