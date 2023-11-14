/datum/bodypart_overlay/mutant
	/// Is this bodypart concealed by clothing?
	var/concealed = FALSE

// Moths and Tail-owners can choose whether to show or hide their visible external organs.
/obj/item/organ/external/tail
	actions_types = list(/datum/action/conceal_organ/tail)

/datum/bodypart_overlay/mutant/tail
	/// By default tails are hidden by oversuits
	concealed = TRUE

/datum/bodypart_overlay/mutant/tail/can_draw_on_bodypart(mob/living/carbon/human/human)
	if (!concealed)
		return TRUE
	return ..()

/obj/item/organ/external/wings/moth
	actions_types = list(/datum/action/conceal_organ/wings)

/datum/bodypart_overlay/mutant/wings/moth/can_draw_on_bodypart(mob/living/carbon/human/human)
	if (!concealed)
		return ..()
	if (!human.wear_suit)
		return TRUE
	if (!(human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return TRUE
	return FALSE

/obj/item/organ/external/antennae
	actions_types = list(/datum/action/conceal_organ/antennae)

/datum/bodypart_overlay/mutant/antennae/can_draw_on_bodypart(mob/living/carbon/human/human)
	if (!concealed)
		return ..()
	if (human.head?.flags_inv & HIDEHAIR)
		return FALSE
	if (human.wear_mask?.flags_inv & HIDEHAIR)
		return FALSE
	return TRUE

/datum/action/conceal_organ
	name = "Toggle organ display"
	check_flags = AB_CHECK_HANDS_BLOCKED|AB_CHECK_IMMOBILE|AB_CHECK_CONSCIOUS
	button_icon = 'orbstation/icons/mob/species/organ_buttons.dmi'
	/// Icon state to use when organ is hidden
	var/icon_state_hidden = ""
	/// A nice name for the organ in question
	var/organ_name = "organ"
	/// Just to make sure you're not spamming the button
	var/rummaging = FALSE

/datum/action/conceal_organ/Grant(mob/grant_to)
	. = ..()
	if (!owner)
		return
	RegisterSignals(owner, list(COMSIG_MOB_EQUIPPED_ITEM, COMSIG_MOB_UNEQUIPPED_ITEM), PROC_REF(update_status_on_signal))
	RegisterSignal(owner, COMSIG_CARBON_GAIN_ORGAN, PROC_REF(update_display))

/datum/action/conceal_organ/Remove(mob/remove_from)
	. = ..()
	UnregisterSignal(remove_from, list(COMSIG_MOB_EQUIPPED_ITEM, COMSIG_MOB_UNEQUIPPED_ITEM, COMSIG_CARBON_GAIN_ORGAN))

/datum/action/conceal_organ/IsAvailable(feedback)
	. = ..()
	if (!get_organ())
		if (feedback)
			owner.balloon_alert(owner, "no [organ_name]!")
		return FALSE
	if (!is_covered(feedback))
		return FALSE
	return TRUE

/// Returns true if you're wearing a big coat, override to check for something else
/datum/action/conceal_organ/proc/is_covered(feedback)
	var/mob/living/carbon/human/human_owner = owner
	if (!istype(human_owner))
		if (feedback)
			owner.balloon_alert(owner, "can't wear clothes!")
		return FALSE
	if (!human_owner.wear_suit)
		if (feedback)
			owner.balloon_alert(owner, "no suit!")
		return FALSE
	if (!(human_owner.wear_suit.flags_inv & HIDEJUMPSUIT))
		if (feedback)
			owner.balloon_alert(owner, "unsuitable suit!")
		return FALSE
	return TRUE

/// Return the organ we want to hide
/datum/action/conceal_organ/proc/get_organ()
	return null

/datum/action/conceal_organ/Trigger(trigger_flags)
	. = ..()
	if (!.)
		return
	if (rummaging) // Here rather than in isAvailable because I don't care about changing the button tint
		return
	rummaging = TRUE
	if (!do_after(owner, 3 SECONDS))
		owner.balloon_alert(owner, "interrupted!")
		rummaging = FALSE
		return
	rummaging = FALSE
	playsound(owner, SFX_RUSTLE, 50, TRUE, -5)
	toggle_concealement()
	update_display()
	var/mob/living/carbon/carbon_owner = owner
	if (!istype(carbon_owner)) // How the hell did you get all the way here?
		return
	carbon_owner.update_body_parts()

/// Implement this to actually toggle the organ hiding
/datum/action/conceal_organ/proc/toggle_concealement()
	return

/// Return whether we are concealed or not
/datum/action/conceal_organ/proc/is_concealed()
	return FALSE

/// Updates the current name, icon, and description
/datum/action/conceal_organ/proc/update_display()
	if (is_concealed())
		button_icon_state = icon_state_hidden
		name = "Reveal [organ_name]"
		desc = "Release your [organ_name] from your suit for all to see."
	else
		button_icon_state = initial(button_icon_state)
		name = "Conceal [organ_name]"
		desc = "Tuck your [organ_name] into a bulky suit in order to hide it."
	build_all_button_icons()

/// Shows/Hides tail
/datum/action/conceal_organ/tail
	organ_name = "tail"
	button_icon_state = "no_tail"
	icon_state_hidden = "show_tail"

/datum/action/conceal_organ/tail/get_organ()
	return owner.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)

/datum/action/conceal_organ/tail/toggle_concealement()
	var/obj/item/organ/external/tail/tail = get_organ()
	tail.bodypart_overlay.concealed = !tail.bodypart_overlay.concealed

/datum/action/conceal_organ/tail/is_concealed()
	var/obj/item/organ/external/tail/tail = get_organ()
	return tail.bodypart_overlay.concealed

/// Shows/Hides wings
/datum/action/conceal_organ/wings
	organ_name = "wings"
	button_icon_state = "no_wings"
	icon_state_hidden = "show_wings"

/datum/action/conceal_organ/wings/get_organ()
	return owner.get_organ_slot(ORGAN_SLOT_EXTERNAL_WINGS)

/datum/action/conceal_organ/wings/toggle_concealement()
	var/obj/item/organ/external/wings/moth/wings = get_organ()
	wings.bodypart_overlay.concealed = !wings.bodypart_overlay.concealed

/datum/action/conceal_organ/wings/is_concealed()
	var/obj/item/organ/external/wings/moth/wings = get_organ()
	return wings.bodypart_overlay.concealed

/// Shows/Hides wings
/datum/action/conceal_organ/antennae
	organ_name = "Antennae"
	button_icon_state = "no_antennae"
	icon_state_hidden = "show_antennae"

/datum/action/conceal_organ/antennae/get_organ()
	return owner.get_organ_slot(ORGAN_SLOT_EXTERNAL_ANTENNAE)

/datum/action/conceal_organ/antennae/toggle_concealement()
	var/obj/item/organ/external/antennae/antennae = get_organ()
	antennae.bodypart_overlay.concealed = !antennae.bodypart_overlay.concealed

/datum/action/conceal_organ/antennae/is_concealed()
	var/obj/item/organ/external/antennae/antennae = get_organ()
	return antennae.bodypart_overlay.concealed

/// Returns true if your hair is hidden
/datum/action/conceal_organ/antennae/is_covered(feedback)
	var/mob/living/carbon/human/human_owner = owner
	if (!istype(human_owner))
		if (feedback)
			owner.balloon_alert(owner, "can't wear clothes!")
		return FALSE
	if (!(human_owner.head?.flags_inv & HIDEHAIR) && !(human_owner.wear_mask?.flags_inv & HIDEHAIR))
		if (feedback)
			owner.balloon_alert(owner, "cover your hair!")
		return FALSE
	return TRUE
