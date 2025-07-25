/datum/quirk/item_quirk/farsighted
	name = "Farsighted"
	desc = "You are farsighted - you won't be able to read a thing without prescription glasses. Fortunately, you spawn with a pair."
	icon = FA_ICON_MAGNIFYING_GLASS
	value = -3
	gain_text = "<span class='danger'>Things close to you start looking blurry.</span>"
	lose_text = "<span class='notice'>You start seeing nearby things normally again.</span>"
	medical_record_text = "Patient requires prescription glasses in order to counteract farsightedness."
	mail_goodies = list(/obj/item/clothing/glasses/regular) // extra pair if orginal one gets broken by somebody mean
	var/glasses

/datum/quirk/item_quirk/farsighted/add_unique()
	glasses = glasses || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/glasses)
	switch(glasses)
		if ("Thin")
			glasses = /obj/item/clothing/glasses/regular/thin
		if ("Circle")
			glasses = /obj/item/clothing/glasses/regular/circle
		if ("Hipster")
			glasses = /obj/item/clothing/glasses/regular/hipster
		else
			glasses = /obj/item/clothing/glasses/regular

	give_item_to_holder(glasses, list(LOCATION_EYES, LOCATION_BACKPACK, LOCATION_HANDS))

/datum/quirk/item_quirk/farsighted/add()
	quirk_holder.become_farsighted(QUIRK_TRAIT)

/datum/quirk/item_quirk/farsighted/remove()
	quirk_holder.cure_farsighted(QUIRK_TRAIT)

/datum/mutation/human/farsighted
	name = "Far Sightedness"
	desc = "The holder of this mutation can't read without glasses."
	quality = MINOR_NEGATIVE
	text_gain_indication = "<span class='danger'>Things close to you start looking blurry.</span>"
	text_lose_indication = "<span class='notice'>You start seeing nearby things normally again.</span>"

/datum/mutation/human/farsighted/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	owner.become_farsighted(GENETIC_MUTATION)

/datum/mutation/human/farsighted/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	owner.cure_farsighted(GENETIC_MUTATION)

/obj/item/dnainjector/farsighted
	name = "\improper DNA injector (Farsighted)"
	add_mutations = list(/datum/mutation/human/farsighted)

/obj/item/dnainjector/antifarsighted
	name = "\improper DNA injector (Anti-Farsighted)"
	remove_mutations = list(/datum/mutation/human/farsighted)


/// Status effect
/datum/status_effect/grouped/farsighted
	id = "farsighted"
	tick_interval = -1
	alert_type = null

	/// Static list of signals that, when recieved, we add or remove the farsighted illiteracy
	var/static/list/update_signals = list(SIGNAL_ADDTRAIT(TRAIT_FARSIGHTED_CORRECTED), SIGNAL_REMOVETRAIT(TRAIT_FARSIGHTED_CORRECTED))

/datum/status_effect/grouped/farsighted/on_apply()
	RegisterSignals(owner, update_signals, PROC_REF(update_farsightedness))
	update_farsighted_literacy()
	return ..()

/datum/status_effect/grouped/farsighted/on_remove()
	UnregisterSignal(owner, update_signals)

	REMOVE_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)
	return ..()

/datum/status_effect/grouped/farsighted/proc/update_farsightedness(datum/source)
	SIGNAL_HANDLER
	update_farsighted_literacy()

/datum/status_effect/grouped/farsighted/proc/should_be_farsighted()
	return !HAS_TRAIT(owner, TRAIT_FARSIGHTED_CORRECTED)

/datum/status_effect/grouped/farsighted/proc/update_farsighted_literacy()
	if(should_be_farsighted())
		ADD_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)
	else
		REMOVE_TRAIT(owner, TRAIT_ILLITERATE, FARSIGHT_TRAIT)


// Makes glasses correct farsightedness
/obj/item/clothing/glasses/regular
	clothing_traits = list(TRAIT_NEARSIGHTED_CORRECTED, TRAIT_FARSIGHTED_CORRECTED)

/obj/item/clothing/glasses/regular/atom_destruction(damage_flag)
	. = ..()
	clothing_traits -= TRAIT_FARSIGHTED_CORRECTED

/obj/item/clothing/glasses/regular/repair()
	. = ..()
	clothing_traits |= TRAIT_FARSIGHTED_CORRECTED
