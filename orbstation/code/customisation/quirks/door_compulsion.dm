/datum/quirk/door_closer
	name = "Compulsive Door Closer"
	desc = "There is something that troubles you about walking through airlocks and doors. You absolutely must close them behind you. You can however, close your eyes to push through this."
	icon = FA_ICON_DOOR_CLOSED
	value = 3
	mob_trait = TRAIT_DOOR_CLOSER
	gain_text = "<span class='danger'>You feel very strongly about passing through doorways.</span>"
	lose_text = "<span class='notice'>You no longer feel very strongly about doorways.</span>"
	medical_record_text = "Patient seems to have superstitions involving doorways."
	mail_goodies = list(/obj/item/clothing/gloves/color/white)

/datum/quirk/door_closer/add()
	. = ..()
	quirk_holder.AddElement(/datum/element/door_closer_quirk)
	quirk_holder.allow_eye_control(name)

/datum/quirk/door_closer/remove()
	. = ..()
	quirk_holder.RemoveElement(/datum/element/door_closer_quirk)
	quirk_holder.remove_eye_control(name)

/// element that is attached to people with the trait door closer that checks if the mob has left a tile with a door on it so that it can close it
/datum/element/door_closer_quirk
	/// list of doors that should not be closed automatically, blast doors, shutters, and firelocks mostly
	var/static/list/secure_doors = list(/obj/machinery/door/poddoor, /obj/machinery/door/firedoor, /obj/machinery/door/window)

/datum/element/door_closer_quirk/Attach(datum/target)
	. = ..()

	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE
	secure_doors = typecacheof(secure_doors)
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(close_door))

/datum/element/door_closer_quirk/Detach(datum/target, ...)
	. = ..()

	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)

/datum/element/door_closer_quirk/proc/close_door(mob/living/leaver, turf/old_turf)
	SIGNAL_HANDLER

	if(IS_UNCONSCIOUS(leaver))
		return
	if(HAS_TRAIT(leaver, TRAIT_HANDS_BLOCKED))
		return
	if(leaver.is_blind())
		return
	for(var/obj/machinery/door/to_close in old_turf.contents)
		if(is_type_in_typecache(to_close, secure_doors))
			continue
		INVOKE_ASYNC(to_close, TYPE_PROC_REF(/obj/machinery/door, close))
