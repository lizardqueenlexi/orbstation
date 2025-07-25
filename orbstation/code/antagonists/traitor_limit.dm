/// Current count of traitors & blood brothers
GLOBAL_VAR_INIT(traitor_limit_antag_count, 0)

/datum/controller/subsystem/dynamic
	/// The number of alive players is multitplied by this percentage to determine the traitor limit.
	/// Configurable in dynamic.json.
	var/traitor_limit_scaling_percentage = 0.25

/// Calculates the limit for midround/latejoin traitor spawns based on current population.
/// Returns TRUE or FALSE depending on if more traitors can spawn or not.
/datum/controller/subsystem/dynamic/proc/traitor_limit_reached()
	var/traitor_limit = round(traitor_limit_scaling_percentage * GLOB.alive_player_list.len, 1)
	if(GLOB.traitor_limit_antag_count >= traitor_limit)
		return FALSE

	return TRUE

/datum/antagonist/traitor/on_gain()
	GLOB.traitor_limit_antag_count++
	return ..()

/datum/antagonist/traitor/on_removal()
	GLOB.traitor_limit_antag_count = max(0, GLOB.traitor_limit_antag_count - 1)
	return ..()

/datum/antagonist/brother/on_gain()
	GLOB.traitor_limit_antag_count++
	return ..()

/datum/antagonist/brother/on_removal()
	GLOB.traitor_limit_antag_count = max(0, GLOB.traitor_limit_antag_count - 1)
	return ..()

/datum/antagonist/spy/on_gain()
	GLOB.traitor_limit_antag_count++
	return ..()

/datum/antagonist/spy/on_removal()
	GLOB.traitor_limit_antag_count = max(0, GLOB.traitor_limit_antag_count - 1)
	return ..()
