// the toolbox on their pod has the contents and power of a Syndicate toolbox but looks like a normal emergency one

/obj/item/storage/toolbox/syndicate/secret
	name = "emergency toolbox"
	desc = "Danger. Very robust."
	icon_state = "red"
	inhand_icon_state = "toolbox_red"
	material_flags = NONE

// The ship the infiltrator spawns on

/area/shuttle/infiltrator_pod
	name = "Abandoned Pod"
	requires_power = TRUE

// see _maps\shuttles\infiltrator_pod.dmm

/datum/map_template/shuttle/infiltrator_pod
	name = "abandoned pod"
	port_id = "infiltrator"
	suffix = "pod"

/obj/machinery/computer/shuttle/infiltrator_pod
	name = "abandoned pod console"
	shuttleId = "infiltratorpod"
	icon_screen = "commsyndie"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
	possible_destinations = "infiltratorpod_away;infiltratorpod_home;infiltratorpod_custom"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/infiltrator_pod
	name = "abandoned pod navigation computer"
	desc = "Used to designate a precise transit location for the abandoned pod."
	shuttleId = "infiltratorpod"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "infiltratorpod_custom"
	x_offset = 0
	y_offset = 2
	see_hidden = TRUE

/obj/docking_port/mobile/infiltrator_pod
	name = "abandoned pod"
	shuttle_id = "infiltratorpod"
	rechargeTime = 10 MINUTES // long recharge time since you're not meant to use it too often

//spawning landmark for the ghost spawner
/obj/effect/landmark/infil_spawn
	name = "infiltrator spawn point"

///Proc that spawns the infiltrator's pod and makes the spawner spawn them. Also called by the infiltrator rulesets
/proc/spawn_infiltrator(spawner_type, role_name, jobban, alert_pic)
	var/turf/picked_turf
	var/datum/map_template/shuttle/infiltrator_pod/ship = new
	if(SSmapping.empty_space) // if there's an empty space z level, spawn the pod somewhere there
		var/x = rand(TRANSITIONEDGE,world.maxx - TRANSITIONEDGE - ship.width)
		var/y = rand(TRANSITIONEDGE,world.maxy - TRANSITIONEDGE - ship.height)
		var/z = SSmapping.empty_space.z_value
		picked_turf = locate(x,y,z)
	else // otherwise, try to use a random carp spawn location
		var/obj/pod_spawn = find_space_spawn()
		picked_turf = locate(pod_spawn.x,pod_spawn.y,pod_spawn.z)
		qdel(pod_spawn) // removes the spawn point from the landmarks list so the game doesn't spawn a carp on our poor infiltrator

	if(!picked_turf)
		CRASH("Infiltrator event found no turf to load in.")

	if(!ship.load(picked_turf, centered = TRUE))
		CRASH("Loading infiltrator ship failed!")

	// Spawns the infiltrator at the infiltrator spawner object
	// don't feel great about this, but the problem is that get_affected_turfs returns a list of turfs
	// so you have to loop through the turfs and then loop through each turf to find the spawner object
	// the pirate event also does this. it is what it is
	var/list/candidates = SSpolling.poll_ghost_candidates("Do you wish to be considered for a [span_notice("[role_name]?")]", check_jobban = jobban, alert_pic = alert_pic, role_name_text = role_name)

	for(var/turf/ship_turf in ship.get_affected_turfs(picked_turf, centered = TRUE))
		for(var/obj/effect/landmark/infil_spawn/spawn_point in ship_turf)
			var/obj/effect/mob_spawn/ghost_role/spawner = new spawner_type(spawn_point.loc)
			if(!istype(spawner))
				CRASH("Invalid spawner sent to spawn_infiltrator!")
			if(candidates.len > 0)
				var/our_candidate = pick(candidates)
				var/spawned_mob = spawner.create_from_ghost(our_candidate)
				candidates -= our_candidate
				notify_ghosts(
					"A [role_name] has woken up: [spawned_mob]!",
					source = spawned_mob,
					header = "Infiltrator!",
				)
			else
				notify_ghosts(
					"A [role_name] sleeper is available: [spawner]!",
					source = spawner,
					header = "Infiltrator spawn!",
				)

// Generic type for infiltrator spawners, should never appear in game.
/obj/effect/mob_spawn/ghost_role/human/infiltrator
	name = "sleeper"
	desc = "An old cryo sleeper. Please tell an admin if you see this."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "a glitched infiltrator (please tell an admin if you see this!)"
	you_are_text = "You are a code error! Tell an admin if you see this."
	flavour_text = "This message should never appear! Tell an admin if it does."
	outfit = /datum/outfit/infiltrator
	anchored = TRUE
	density = FALSE
	show_flavor = FALSE //Flavour only exists for spawners menu

/obj/effect/mob_spawn/ghost_role/human/infiltrator/special(mob/living/spawned_mob, mob/mob_possessor)
	//give them a random species from the nukie whitelist
	var/datum/species/infil_species = pick(GLOB.nukeops_species_whitelist)
	if(infil_species)
		spawned_mob.set_species(infil_species)

	return ..()

// Outfit that all infiltrators spawn with
// Includes some chameleon gear to make them less immediately suspicious, but anyone attentive will notice they're not on the crew manifest

/datum/outfit/infiltrator
	name = "Infiltrator"
	uniform = /obj/item/clothing/under/chameleon
	shoes = /obj/item/clothing/shoes/chameleon
	back = /obj/item/storage/backpack/chameleon
	r_pocket = /obj/item/flashlight
	id = /obj/item/card/id/advanced/chameleon // agent ID also gives them maint access, which is very important
	box = /obj/item/storage/box/survival/engineer/radio
