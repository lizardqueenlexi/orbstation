// Clarifying what this quirk actually is
/datum/quirk/item_quirk/chronic_illness
	desc = "You have Causality Degradation Syndrome - a chronic illness that will slowly remove you from reality, and requires constant medication from Cargo to keep under control."

// Reflavoring the disease slightly
/datum/disease/chronic_illness
	name = "Causality Degradation Syndrome"
	desc = "A disease discovered by Interdyne Pharmaceuticals, in which the body's cells gradually destabilize from the flow of time. Invariably fatal, but can be managed with experimental medication."

/datum/supply_pack/medical/experimentalmedicine
	desc = "A crate containing the medication required for living with Causality Degradation Syndrome, Sansufentanyl."

/obj/item/storage/pill_bottle/sansufentanyl
	desc = "A bottle of pills developed by Interdyne Pharmaceuticals. They're used to treat Causality Degradation Syndrome."

/obj/item/reagent_containers/pill/sansufentanyl
	desc = "Used to treat Causality Degradation Syndrome. Temporary side effects include - nausea, dizziness, impaired motor coordination."

// If the injector is somehow acquired, it will not infect the target with HMS.
/obj/item/reagent_containers/hypospray/medipen/manifoldinjector/attack(mob/living/affected_mob, mob/living/carbon/human/user)
	inject(affected_mob, user)

///Removes certain punctuation from sign languages
/proc/punctuation_to_periods(message)
	// Is there a !
	var/exclamation_found = findtext(message, "!")
	// Is there a ?
	var/question_found = findtext(message, "?")
	if(exclamation_found)
		message = replacetext(message, "!", ".")
	if(question_found)
		message = replacetext(message, "?", ".")
	return message

//Overrides talk_into to check if the user is using sign language and only remove their punctuation if so.
//For simplicity, and because it mostly just sucks, radio gloves will no longer garble speech when you only have one hand free.
/obj/item/radio/talk_into(atom/movable/talking_movable, message, channel, list/spans, datum/language/language, list/message_mods)
	var/mob/living/carbon/mute = talking_movable
	if(istype(mute) && HAS_TRAIT(mute, TRAIT_SIGN_LANG)) //check for speaking with sign language
		message = punctuation_to_periods(message) //signing doesn't communicate tone over radio

	return ..()
