/// Turns any gloves into radio gloves.
/obj/item/radio_glove_assembly
	name = "translation glove assembly"
	icon = 'orbstation/icons/obj/items/accessibility.dmi'
	icon_state = "glove_wires"
	desc = "Use on any pair of gloves to attach sign language translation cables."
	w_class = WEIGHT_CLASS_TINY
	/// "Gloves" which don't cover your fingers and look silly with the overlay attached
	var/static/list/gloves_blacklist = typecacheof(list(
		/obj/item/clothing/gloves/boxing,
		/obj/item/clothing/gloves/bracer,
		/obj/item/clothing/gloves/rapid,
	))

/obj/item/radio_glove_assembly/interact_with_atom(obj/item/clothing/gloves/target_gloves, mob/user, list/modifiers)
	if (!istype(target_gloves))
		return
	if (is_type_in_typecache(target_gloves, gloves_blacklist))
		user.balloon_alert(user, "incompatible!")
		return
	if (!isturf(target_gloves.loc))
		user.balloon_alert(user, "put gloves down!") //They need to be outside your inventory or the trait won't apply
		return
	if (target_gloves.clothing_traits && (TRAIT_CAN_SIGN_ON_COMMS in target_gloves.clothing_traits))
		user.balloon_alert(user, "already upgraded")
		return
	user.visible_message(span_notice("[user] starts attaching [src] to [target_gloves]."))
	if (!do_after(user, 5 SECONDS, target = target_gloves))
		user.balloon_alert(user, "interrupted!")
		return
	if (!target_gloves.clothing_traits)
		target_gloves.clothing_traits = list()
	target_gloves.clothing_traits += TRAIT_CAN_SIGN_ON_COMMS
	target_gloves.update_appearance()
	user.balloon_alert(user, "assembly added")
	qdel(src)
	return ITEM_INTERACT_SUCCESS

/obj/item/clothing/gloves/update_overlays()
	. = ..()
	if (!clothing_traits || !(TRAIT_CAN_SIGN_ON_COMMS in clothing_traits))
		return
	. += mutable_appearance('orbstation/icons/obj/items/accessibility.dmi', "glove_wires")

/obj/item/clothing/gloves/examine(mob/user)
	. = ..()
	if (clothing_traits && (TRAIT_CAN_SIGN_ON_COMMS in clothing_traits))
		. += "<br>They have a sign language interpreting assembly attached."

// Replace the existing crafting recipe because it's redundant
/datum/crafting_recipe/radiogloves
	name = "Radio Glove Assembly"
	result = /obj/item/radio_glove_assembly
	reqs = list(/obj/item/stack/cable_coil = 2,
				/obj/item/radio = 1)
