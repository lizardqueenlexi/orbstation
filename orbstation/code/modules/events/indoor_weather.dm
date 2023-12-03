/**
 * Event where something rains from the sky.
 * Can only be triggered by wizard events or admins.
 */
/datum/round_event_control/wizard/indoor_weather_animal
	name = "Indoor Weather: Cats and Dogs (and Frogs)"
	weight = 2
	typepath = /datum/round_event/wizard/indoor_weather/animal
	max_occurrences = 2
	earliest_start = 0 MINUTES
	description = "Small animals will rain from the sky."

/datum/round_event_control/wizard/indoor_weather_food
	name = "Indoor Weather: Chance of Meatballs"
	weight = 2
	typepath = /datum/round_event/wizard/indoor_weather/food
	max_occurrences = 2
	earliest_start = 0 MINUTES
	description = "Food will rain from the sky."

/datum/round_event_control/wizard/indoor_weather_cash
	name = "Indoor Weather: Loose Change"
	weight = 2
	typepath = /datum/round_event/wizard/indoor_weather/cash
	max_occurrences = 2
	earliest_start = 0 MINUTES
	description = "Money will rain from the sky."

/datum/round_event_control/wizard/indoor_weather_fish
	name = "Indoor Weather: Fish"
	weight = 2
	typepath = /datum/round_event/wizard/indoor_weather/fish
	max_occurrences = 2
	earliest_start = 0 MINUTES
	description = "Fish will rain from the sky."

/datum/round_event/wizard/indoor_weather
	end_when = 20
	/// Where is it happening?
	var/target_region
	/// How many things at most should land per second?
	var/max_things_per_second = 3
	/// Places where things can land
	var/list/target_turfs = list()
	/// Places weather can happen and their friendly names.
	var/static/list/possible_regions = list(\
		"Medbay" = /area/station/medical,
		"Science Division" = /area/station/science,
		"Engineering Division" = /area/station/engineering,
		"Cargo Bay" = /area/station/cargo,
		"Security Department" = /area/station/security,
		"Station Corridors" = /area/station/hallway,
		"Recreation and Relaxation Division" = /area/station/commons)

/datum/round_event/wizard/indoor_weather/setup()
	target_region = pick(possible_regions) // can't use get_safe_random_turfs because it disqualifies some of my areas
	target_turfs = list()
	for (var/turf/turf as anything in get_area_turfs(possible_regions[target_region], subtypes = TRUE))
		if (turf.is_blocked_turf(exclude_mobs = TRUE))
			continue
		target_turfs += turf

/datum/round_event/wizard/indoor_weather/tick()
	var/to_spawn = rand(0, max_things_per_second)
	while (to_spawn > 0)
		to_spawn--
		addtimer(CALLBACK(src, PROC_REF(drop_item)), rand(0, (1 SECONDS)))

/// Make something descend from above.
/datum/round_event/wizard/indoor_weather/proc/drop_item()
	if (length(target_turfs) == 0)
		return
	var/atom/landing_atom = get_item()
	if (!landing_atom)
		return
	podspawn(list(
		"target" = pick_n_take(target_turfs),
		"style" = STYLE_SEETHROUGH,
		"spawn" = landing_atom,
		"delays" = list(POD_TRANSIT = 0, POD_FALLING = (3 SECONDS), POD_OPENING = 0, POD_LEAVING = 0),
		"effectStealth" = TRUE,
		"effectQuiet" = TRUE,))

/datum/round_event/wizard/indoor_weather/announce(fake)
	priority_announce("Anomalous weather patterns forecast in the [target_region].", "Janitorial alert")

/// Return whatever it is you want to rain from the sky here.
/datum/round_event/wizard/indoor_weather/proc/get_item()
	// Return something you want to fall from the sky from here

/// Spawns little animals
/datum/round_event/wizard/indoor_weather/animal
	end_when = 10 // These are mobs so don't make too many.

/datum/round_event/wizard/indoor_weather/animal/get_item()
	var/static/list/possible_paths = list(
		/mob/living/basic/pet/dog/corgi/puppy = 5,
		/mob/living/basic/pet/cat/kitten = 5,
		/mob/living/basic/frog = 5,
		/mob/living/basic/axolotl = 1,
		/mob/living/basic/pet/dog/corgi/puppy/void = 1,
		/mob/living/basic/pet/dog/corgi/puppy/slime = 1,
	)

	var/mob_path = pick_weight(possible_paths)
	return new mob_path(pick(target_turfs)) // Have to drop them on a tile for a frame before they go in a pod or the compiler complains

/// Spawns food
/datum/round_event/wizard/indoor_weather/food

/datum/round_event/wizard/indoor_weather/food/get_item()
	return get_random_food()

/// Spawns money
/datum/round_event/wizard/indoor_weather/cash

/datum/round_event/wizard/indoor_weather/cash/get_item()
	// Sad that I have to remake this list but this doesn't work if I use a spawner object
	var/static/list/possible_paths = list(
		/obj/item/coin/iron = 100,
		/obj/item/coin/plastic = 100,
		/obj/item/coin/silver = 60,
		/obj/item/coin/plasma = 30,
		/obj/item/coin/uranium = 30,
		/obj/item/coin/titanium = 30,
		/obj/item/coin/diamond = 20,
		/obj/item/coin/bananium = 20,
		/obj/item/coin/adamantine = 20,
		/obj/item/coin/mythril = 20,
		/obj/item/coin/runite = 20,
		/obj/item/coin/twoheaded = 10,
		/obj/item/coin/antagtoken = 10,
		/obj/item/stack/spacecash/c10 = 80,
		/obj/item/stack/spacecash/c20 = 50,
		/obj/item/stack/spacecash/c50 = 30,
		/obj/item/stack/spacecash/c100 = 10,
		/obj/item/stack/spacecash/c500 = 5,
		/obj/item/stack/spacecash/c1000 = 1,
	)
	var/cash_path = pick_weight(possible_paths)
	return new cash_path()

/// Spawns fish
/datum/round_event/wizard/indoor_weather/fish

/datum/round_event/wizard/indoor_weather/fish/get_item()
	var/fish_path = pick(subtypesof(/obj/item/fish))
	return new fish_path()
