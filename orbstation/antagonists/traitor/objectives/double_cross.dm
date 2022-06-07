/datum/traitor_objective_category/double_cross
	name = "Double Cross"
	objectives = list(
		/datum/traitor_objective/assassinate/double_cross = 1,
	)
	weight = OBJECTIVE_WEIGHT_TINY

// This isn't a subtype of the calling card objective because if I did that
// I wouldn't be able to make the calling card a different object with different text.
// Yeah, it's dumb.

/datum/traitor_objective/assassinate/double_cross
	name = "Assassinate another traitor, and plant a calling card"
	description = "The Syndicate is looking to get rid of its weakest links. Use your codewords to gain another traitor's trust, asssinate them, and plant a calling card in their pockets."

	progression_minimum = 30 MINUTES

	progression_reward = list(12 MINUTES, 14 MINUTES) // big reward as an incentive
	telecrystal_reward = list(1, 2) // you can also steal the other traitor's equipment if you want

	maximum_objectives_in_period = 1

	var/obj/item/paper/calling_card/double_cross/card

/datum/traitor_objective/assassinate/double_cross/generate_objective(datum/mind/generating_for, list/possible_duplicates)
	// This objective will only generate if there is another living traitor
	var found_traitor = FALSE
	for(var/datum/mind/possible_target as anything in get_crewmember_minds())
		if(possible_target == generating_for)
			continue
		if(!ishuman(possible_target.current))
			continue
		if(possible_target.current.stat == DEAD)
			continue
		if(possible_target.has_antag_datum(/datum/antagonist/traitor))
			found_traitor = TRUE
	if(!found_traitor)
		return FALSE
	return TRUE

/datum/traitor_objective/assassinate/double_cross/proc/on_card_planted(datum/source, mob/living/equipper, slot)
	SIGNAL_HANDLER
	if(!equipper.mind.has_antag_datum(/datum/antagonist/traitor))
		return //not a traitor!
	if(equipper.stat != DEAD)
		return //not dead!
	if(slot != ITEM_SLOT_LPOCKET && slot != ITEM_SLOT_RPOCKET)
		return //not in their pockets!
	succeed_objective()

/datum/traitor_objective/assassinate/double_cross/generate_ui_buttons(mob/user)
	var/list/buttons = list()
	if(!card)
		buttons += add_ui_button("", "Pressing this will materialize a calling card, which you must plant to succeed.", "paper-plane", "summon_card")
	return buttons

/datum/traitor_objective/assassinate/double_cross/ui_perform_action(mob/living/user, action)
	. = ..()
	switch(action)
		if("summon_card")
			if(card)
				return
			card = new(user.drop_location())
			user.put_in_hands(card)
			card.balloon_alert(user, "the card materializes in your hand")
			RegisterSignal(card, COMSIG_ITEM_EQUIPPED, .proc/on_card_planted)
			AddComponent(/datum/component/traitor_objective_register, card, \
				succeed_signals = null, \
				fail_signals = COMSIG_PARENT_QDELETING, \
				penalty = TRUE)

/obj/item/paper/calling_card/double_cross
	color = "#ff3399" // slightly more purple than the normal one
	info = {"Let this card act as a lesson to any agent of the Syndicate who is foolish enough
	to fail their masters."}
