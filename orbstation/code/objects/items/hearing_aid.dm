/// Allows deaf characters to hear as long as they are wearing an attached headset.
/obj/item/hearing_aid
	name = "headset hearing aid"
	icon = 'orbstation/icons/obj/items/accessibility.dmi'
	icon_state = "hearing_aid"
	desc = "Attach to a headset to provide auditory support for the hard of hearing."
	w_class = WEIGHT_CLASS_TINY

/obj/item/hearing_aid/interact_with_atom(obj/item/radio/headset/target_headset, mob/user, list/modifiers)
	if (!istype(target_headset))
		return
	if (!isturf(target_headset.loc))
		user.balloon_alert(user, "put headset down!") //They need to be outside your inventory or the trait won't apply
		return
	if (target_headset.hearing_aid)
		user.balloon_alert(user, "already upgraded!")
		return
	user.visible_message(span_notice("[user] starts attaching [src] to [target_headset]."))
	if (!do_after(user, 5 SECONDS, target = target_headset))
		user.balloon_alert(user, "interrupted!")
		return
	target_headset.hearing_aid = TRUE
	target_headset.update_appearance()
	user.balloon_alert(user, "hearing aid added")
	qdel(src)
	return ITEM_INTERACT_SUCCESS

// Start with one if you are deaf
/datum/quirk/item_quirk/deafness/add_unique()
	..()

	give_item_to_holder(/obj/item/hearing_aid, list(
		LOCATION_EYES,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))

// You can order more through cargo
/datum/supply_pack/goody/hearing_aid
	name = "Hearing Aid"
	desc = "Contains a single hearing aid attachment for a headset, for those hard of hearing."
	cost = PAYCHECK_CREW * 4
	contains = list(/obj/item/hearing_aid)

/obj/item/radio/headset
	///Set to true if this functions as a hearing aid
	var/hearing_aid = FALSE

// Apply a sound filter if this is helping with your deafness
/obj/item/radio/headset/equipped(mob/user, slot, initial)
	. = ..()
	if(!(slot_flags & slot))
		return
	if (!hearing_aid)
		return
	ADD_CLOTHING_TRAIT(user, TRAIT_DEAF_HEARING)
	user.sound_environment_override = SOUND_ENVIRONMENT_SEWER_PIPE

/obj/item/radio/headset/dropped(mob/user, silent)
	. = ..()
	if (!hearing_aid)
		return
	REMOVE_CLOTHING_TRAIT(user, TRAIT_DEAF_HEARING)
	if (user.sound_environment_override == SOUND_ENVIRONMENT_SEWER_PIPE)
		user.sound_environment_override = SOUND_ENVIRONMENT_NONE

/obj/item/radio/headset/examine(mob/user)
	. = ..()
	if (hearing_aid)
		. += "It has a hearing aid attached."

/mob/living/carbon/can_hear()
	. = ..()
	if (.)
		return
	if (!HAS_TRAIT(src, TRAIT_DEAF_HEARING))
		return FALSE
	if (health <= hardcrit_threshold) // I can't think of a more elegant solution than repeating this
		return FALSE
	if (!get_organ_slot(ORGAN_SLOT_EARS))
		return FALSE
	if (HAS_TRAIT_FROM(src, TRAIT_DEAF, EAR_DAMAGE)) // Just get it healed
		return FALSE
	return TRUE
