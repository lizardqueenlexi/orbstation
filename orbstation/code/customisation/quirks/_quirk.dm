///sends signal whenever a quirk is added
/datum/quirk/add_to_holder(mob/living/new_holder, quirk_transfer, client/client_source, unique)
	. = ..()
	if(!.)
		return FALSE
	SEND_SIGNAL(new_holder, COMSIG_QUIRK_ADDED, src)
