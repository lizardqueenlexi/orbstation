/datum/traitor_objective_category/final_objective
	name = "Final Objective"
	objectives = list(
		/datum/traitor_objective/final/romerol = 1,
		/datum/traitor_objective/final/battlecruiser = 1,
		/datum/traitor_objective/final/space_dragon = 1,
		/datum/traitor_objective/final/supermatter_cascade = 1,
	)
	weight = 100

/datum/traitor_objective/final
	abstract_type = /datum/traitor_objective/final
	// to get a final objective, you must have 900 total reputation points,
	// and have completed objectives worth a cumulative total of 400 reputation points
	// basically, you need to do high-risk high-reward objectives like assassination and sabotage
	progression_minimum = 90 MINUTES

	var/progression_points_in_objectives = 40 MINUTES

/// Determines if this final objective can be taken. Should be put into every final objective's generate function.
/datum/traitor_objective/final/proc/can_take_final_objective()
	if(handler.get_completion_progression(/datum/traitor_objective) < progression_points_in_objectives)
		return FALSE
	if(SStraitor.get_taken_count(type) > 0) // Prevents multiple people from ever getting the same final objective.
		return FALSE
	var/valid_crystal = FALSE
	for(var/obj/machinery/power/supermatter_crystal/engine/crystal in GLOB.machines)
		if(is_station_level(crystal.z) || is_mining_level(crystal.z))
			valid_crystal = TRUE
	if(!valid_crystal)
		return FALSE
	return TRUE

/datum/traitor_objective/final/on_objective_taken(mob/user)
	. = ..()
	handler.maximum_potential_objectives = 0
	for(var/datum/traitor_objective/objective as anything in handler.potential_objectives)
		objective.fail_objective()
	user.playsound_local(get_turf(user), 'sound/traitor/final_objective.ogg', vol = 100, vary = FALSE, channel = CHANNEL_TRAITOR)
	// replace those normal primary objectives with a special objective that automatically succeeds
	var/datum/antagonist/traitor/traitor_datum
	for(var/datum/antagonist/antag in user.mind.antag_datums)
		if(istype(antag, /datum/antagonist/traitor))
			traitor_datum = antag
			break
	if(traitor_datum)
		traitor_datum.objectives.Cut()
		var/datum/objective/traitor_progression/final_objective = new /datum/objective/traitor_final()
		final_objective.owner = traitor_datum.owner
		traitor_datum.objectives += final_objective
		to_chat(user, span_boldwarning("In taking this final objective, the Syndicate no longer cares if you live or die. All that matters is that you try to see this last mission through."))
		traitor_datum.owner.announce_objectives()

/datum/objective/traitor_final
	name = "at any cost"
	explanation_text = "Try to accomplish your final objective at any cost."
	completed = TRUE

/datum/objective/traitor_final/check_completion()
	return TRUE // no way of checking completion; this objective is just here for flavor

/datum/traitor_objective/final/is_duplicate(datum/traitor_objective/objective_to_compare)
	return TRUE

/datum/traitor_objective/final/uplink_ui_data(mob/user)
	. = ..()
	.["final_objective"] = TRUE
