#define CUSTOM_OBJECTIVE_MAX_LENGTH 300

/datum/uplink_category/contract
	name = "Contract Negotiation"
	weight = -3 // just above discount items (because those are apparently hard-coded to be at the bottom)

/datum/uplink_item/contract
	category = /datum/uplink_category/contract
	surplus = 0
	cant_discount = TRUE

/datum/uplink_item/contract/freeform
	name = "Renegotiate Contract"
	desc = "Opt out of conventional objectives and forge your own path forward in pursuit of a custom goal. \
		Be warned that you will no longer be able to earn telecrystals. There is no turning back."
	item = /obj/effect/gibspawner/generic
	surplus = 0
	cost = 0
	restricted = TRUE
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	purchase_log_vis = FALSE

/datum/uplink_item/contract/freeform/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	var/datum/antagonist/traitor/traitor_datum
	for(var/datum/antagonist/antag in user.mind.antag_datums)
		if(istype(antag, /datum/antagonist/traitor))
			traitor_datum = antag
			break

	// Non-traitors can't use this for obvious reasons :v
	if(!traitor_datum)
		return source //For log icon

	if(uplink_handler.final_objective) // prevents overriding final objectives
		to_chat(user, span_warning("Request denied. The terms of your current contract are non-negotiable."))

	var/list/old_objectives = list()

	for(var/datum/objective/primary_objective in traitor_datum.objectives)
		if(istype(primary_objective, /datum/objective/custom)) // prevents overriding pre-existing custom objectives
			to_chat(user, span_warning("Request denied. The terms of your current contract are non-negotiable."))
			return source

		old_objectives += primary_objective.explanation_text

	// Allow the traitor to write down a custom objective if they so wish.
	var/custom_objective_text = tgui_input_text(user, "Write down the terms of your new contract:", "Custom Objective", "Sow fear and discord as a free agent of the Syndicate.", CUSTOM_OBJECTIVE_MAX_LENGTH)
	if(!custom_objective_text) // such as if the user hits "cancel"
		return source

	var/datum/objective/custom/renegotiate/renegotiate_objective = new
	renegotiate_objective.explanation_text = custom_objective_text
	renegotiate_objective.owner = traitor_datum.owner
	renegotiate_objective.completed = TRUE
	renegotiate_objective.old_objectives = old_objectives

	traitor_datum.objectives.Cut()
	traitor_datum.objectives += renegotiate_objective

	user.playsound_local(get_turf(user), 'sound/traitor/final_objective.ogg', vol = 100, vary = FALSE, channel = CHANNEL_TRAITOR)

	log_traitor("[key_name(user)] opted out of uplink objectives and chose a custom objective: [custom_objective_text]")
	message_admins("[ADMIN_LOOKUPFLW(user)] has chosen a custom traitor objective: [span_syndradio("[custom_objective_text]")] | [ADMIN_SYNDICATE_REPLY(user)]")

	for(var/client/admin_client in GLOB.admins)
		if(admin_client.prefs.toggles & SOUND_ADMINHELP)
			SEND_SOUND(admin_client, sound('sound/effects/gong.ogg'))

	// Let's fail all the active objectives on the uplink to get them out of the way.
	for(var/datum/traitor_objective/active_objective as anything in uplink_handler.active_objectives)
		active_objective.fail_objective(penalty_cost = 0)

	// Do the same for potential objectives
	uplink_handler.maximum_potential_objectives = 0
	for(var/datum/traitor_objective/objective as anything in uplink_handler.potential_objectives)
		objective.fail_objective()

	to_chat(user, span_boldwarning("Your request has been received. Until further notice, these are the new terms of your contract. Good luck, agent."))

	return source

/datum/objective/custom/renegotiate
	name = "Contract renegotiation"
	explanation_text = "Try to accomplish your final objective at any cost."
	completed = TRUE
	///used to display original objectives at round end
	var/list/old_objectives = list()

///display data about the original objectives
/datum/objective/custom/renegotiate/proc/display_old_objectives()
	if(!old_objectives?.len)
		return ""

	var/objectives_text = "<br> The original objectives were:"

	var/count = 1
	for(var/explanation in old_objectives)
		objectives_text += "<br><B>Objective #[count]</B>: [explanation]"
		count++

	return objectives_text

#undef CUSTOM_OBJECTIVE_MAX_LENGTH

// Remove the "change objective without losing secondary objectives" button if we renegotiated the other way
/datum/antagonist/traitor/can_change_objectives()
	return ..() && length(objectives) > 1
