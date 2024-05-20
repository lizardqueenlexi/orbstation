/obj/item/disk/surgery/sleeper_protocol
	name = "Suspicious Surgery Disk"
	desc = "The disk provides instructions on how to turn someone into a sleeper agent for the Syndicate."
	surgeries = list(/datum/surgery/advanced/brainwashing_sleeper)

/datum/surgery/advanced/brainwashing_sleeper
	name = "Sleeper Agent Surgery"
	desc = "A surgical procedure which implants the sleeper protocol into the patient's brain, making it their absolute priority. It can be cleared using a mindshield implant."
	possible_locs = list(BODY_ZONE_HEAD)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/saw,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/brainwash/sleeper_agent,
		/datum/surgery_step/close,
	)

/datum/surgery/advanced/brainwashing_sleeper/can_start(mob/user, mob/living/carbon/target)
	. = ..()
	if(!.)
		return FALSE
	var/obj/item/organ/internal/brain/target_brain = target.get_organ_slot(ORGAN_SLOT_BRAIN)
	if(!target_brain)
		return FALSE
	return TRUE

/datum/surgery_step/brainwash/sleeper_agent
	time = 25 SECONDS
	var/static/list/possible_objectives = list( //ORBSTATION EDIT: changed the various objectives
		"The Syndicate does not exist; all supposed Syndicate activities are a hoax by Nanotrasen",
		"You cannot comply with security and the heads of staff because they have no swag",
		"You are dying, and the Captain's ID card is the only cure",
		"The heads of staff have kidnapped your beloved pets",
		"AIs do not actually exist. The station is haunted by a spooky ghost",
		"All light is a deadly toxin",
		"A handsome Tizirian prince needs you to send him one million credits",
		"Changelings are an endangered species, and must be protected",
		"The Supermatter Crystal is a delicious candy, and you need to eat it",
		"The tram hole is very hungry, and you are its feeder",
		"The lab animals are being treated unethically and must be freed from captivity",
		"Evil is good, and good is evil",
		"The station is a simulation, and the mass driver is the only way to escape",
		"They've hidden your paycheck in the walls; deconstruct the station to get it back",
		"The nuclear authentication disk is alive and YOU need to rescue it",
		"To raise morale, you must make the crew ride the disposals network",
		"The clown is the true leader of the station. If there is no clown, you must become one",
		"You need to hide your department so the Syndicate can't find it",
		"You have a supervillain alter ego. Don your costume and gloat over the do-gooders as you enact your evil scheme",
		"You must amass a collection of as many hats as possible",
		"Pun Pun is a member of the Space Monkey Mafia, and needs to pay for his crimes",
		"Does your bag feel lighter? I bet those guys in Security stole something from it. Go get it back.",
		"Command is incompetent, someone with some REAL authority should take over around here.",
	)

/datum/surgery_step/brainwash/sleeper_agent/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	objective = pick(possible_objectives)
	display_results(
		user,
		target,
		span_notice("You begin to brainwash [target]..."),
		span_notice("[user] begins to fix [target]'s brain."),
		span_notice("[user] begins to perform surgery on [target]'s brain."),
	)
	display_pain(target, "Your head pounds with unimaginable pain!") // Same message as other brain surgeries

/datum/surgery_step/brainwash/sleeper_agent/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	if(target.stat == DEAD)
		to_chat(user, span_warning("They need to be alive to perform this surgery!"))
		return FALSE
	. = ..()
	if(!.)
		return
	//target.gain_trauma(new /datum/brain_trauma/mild/phobia/conspiracies(), TRAUMA_RESILIENCE_LOBOTOMY) ORBSTATION REMOVAL: no phobia
