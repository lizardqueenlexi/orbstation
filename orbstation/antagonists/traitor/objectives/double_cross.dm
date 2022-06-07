/datum/traitor_objective_category/double_cross
	name = "Double Cross"
	objectives = list(
		/datum/traitor_objective/assassinate/calling_card/double_cross = 1,
	)
	weight = OBJECTIVE_WEIGHT_TINY

/datum/traitor_objective/assassinate/calling_card/double_cross
	name = "Assassinate another traitor, and plant a calling card"
	description = "The Syndicate is looking to get rid of its weakest links. Use your codewords to gain another traitor's trust, asssinate them, and plant a calling card in their pockets."

	progression_minimum = 30 MINUTES

	progression_reward = list(12 MINUTES, 14 MINUTES) // big reward as an incentive
	telecrystal_reward = list(1, 2) // you can also steal the other traitor's equipment if you want

	// maximum_objectives_in_period = 3

	card_type = /obj/item/paper/calling_card/double_cross

/datum/traitor_objective/assassinate/calling_card/double_cross/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	// This objective will only generate if there is another living traitor
	// and if you have not already completed this objective
	if(handler.get_completion_count(type))
		return FALSE
	for(var/datum/mind/possible_target as anything in get_crewmember_minds())
		if(possible_target == generating_for)
			continue
		if(!ishuman(possible_target.current))
			continue
		if(possible_target.current.stat == DEAD)
			continue
		if(possible_target.has_antag_datum(/datum/antagonist/traitor))
			return TRUE
	return FALSE

/datum/traitor_objective/assassinate/calling_card/double_cross/on_card_planted(datum/source, mob/living/equipper, slot)
	SIGNAL_HANDLER
	if(!equipper.mind.has_antag_datum(/datum/antagonist/traitor))
		return //not a traitor!
	if(equipper.stat != DEAD)
		return //not dead!
	if(slot != ITEM_SLOT_LPOCKET && slot != ITEM_SLOT_RPOCKET)
		return //not in their pockets!
	succeed_objective()

/obj/item/paper/calling_card/double_cross
	color = "#ff3399" // slightly more purple than the normal one
	info = {"Let this card act as a lesson to any agent of the Syndicate who is foolish enough
	to fail their masters."}
