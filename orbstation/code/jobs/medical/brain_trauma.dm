/// Curated list of weird brain traumas we actually want to use in events
GLOBAL_LIST_INIT(orb_mysterious_brain_traumas, list(
		/datum/brain_trauma/magic/poltergeist,
		/datum/brain_trauma/magic/antimagic,
		/datum/brain_trauma/magic/stalker,
		/datum/brain_trauma/mild/hallucinations,
		/datum/brain_trauma/mild/healthy,
		/datum/brain_trauma/special/godwoken,
		/datum/brain_trauma/special/bluespace_prophet,
		/datum/brain_trauma/special/quantum_alignment,
		/datum/brain_trauma/special/death_whispers,
		/datum/brain_trauma/special/existential_crisis,
		/datum/brain_trauma/special/tenacity,
		/datum/brain_trauma/severe/hypnotic_trigger/random,
))

/// As hypnotic trigger but randomise the code phrase to several common-but-not-too-common words
/datum/brain_trauma/severe/hypnotic_trigger/random
	var/static/list/possible_phrases = list("Nanotrasen", "Syndicate", "ling", "Ian", "Poly", "Wizard", "Shuttle", "Bomb", "Help")

/datum/brain_trauma/severe/hypnotic_trigger/random/New(phrase)
	..()
	if(!phrase)
		trigger_phrase = pick(possible_phrases)

/// split personality override
/datum/brain_trauma/severe/split_personality
	name = "Possession"
	desc = "Patient's head wounds have allowed the dead to heavily influence them."
	scan_desc = "supernatural susceptibility "
	gain_text = span_warning("You feel like your head is full of dark whispers.")
	lose_text = span_notice("You feel quiet once more.")

/// if someone wants to juice this up more than this thats fine but just moving all around is probably decent enough
/datum/brain_trauma/severe/split_personality/on_gain()
	. = ..()
	if(isnull(owner))
		return // Don't apply to a corpse
	RegisterSignal(owner, COMSIG_MOB_STATCHANGE, PROC_REF(on_stat_change))
	owner.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
		"clap" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "clap"),
		"cry" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "cry"),
		"flip" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "flip"),
		"laugh" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "laugh"),
		"scream" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "scream"),
		"spin" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "spin"),
		"swear" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "swear"),
		), 10 SECONDS)

/datum/brain_trauma/severe/split_personality/proc/on_stat_change(mob/living/owner, new_stat, old_stat)
	SIGNAL_HANDLER
	if(new_stat == old_stat)
		return
	if(new_stat == DEAD)
		qdel(owner.GetComponent(/datum/component/deadchat_control/cardinal_movement))
		return
	if(old_stat == DEAD)
		owner.AddComponent(/datum/component/deadchat_control/cardinal_movement, ANARCHY_MODE, list(
			"spin" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "spin"),
			"flip" = CALLBACK(owner, TYPE_PROC_REF(/mob, emote), "flip"),
			), 7 SECONDS)

/datum/brain_trauma/severe/split_personality/on_lose()
	. = ..()
	qdel(owner.GetComponent(/datum/component/deadchat_control/cardinal_movement))
	UnregisterSignal(owner, COMSIG_MOB_STATCHANGE)

/datum/brain_trauma/severe/split_personality/make_backseats()
	return

/datum/brain_trauma/severe/split_personality/get_ghost()
	return

/datum/brain_trauma/severe/split_personality/on_life(delta_time, times_fired)
	return

/datum/brain_trauma/severe/split_personality/switch_personalities(reset_to_owner)
	return

// Display something else on medical scan
/datum/brain_trauma/special/imaginary_friend
	scan_desc = "active imagination"

/datum/brain_trauma/mild/dumbness
	name = "Distractible"
	desc = "Patient has difficulty focusing, and may walk into objects."
	scan_desc = "easily distracted"
	gain_text = span_warning("You can't seem to concentrate.")
	lose_text = span_notice("You feel focused.")

/datum/brain_trauma/mild/dumbness/on_life(delta_time, times_fired)
	return // This was just forced speech which we do not want

/datum/brain_trauma/special/psychotic_brawling
	name = "Chaotic Brawler"
	desc = "Patient fights in unpredictable ways, ranging from helping their target to hitting them with brutal strength."
	scan_desc = "unpredictable reactions"

/datum/brain_trauma/special/psychotic_brawling/bath_salts
	name = "Chemically-Induced Chaotic Brawler"

/datum/brain_trauma/mild/hallucinations
	scan_desc = "hallucinations"
