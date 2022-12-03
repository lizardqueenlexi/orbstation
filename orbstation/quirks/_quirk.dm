///sends signal whenever a quirk is added
/datum/quirk/add_to_holder(mob/living/new_holder, quirk_transfer)
	. = ..()
	if(!.)
		return FALSE
	SEND_SIGNAL(new_holder, COMSIG_QUIRK_ADDED, src)
