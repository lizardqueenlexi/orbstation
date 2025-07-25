
// When any antag datum is applied to anything, yell if it is given to someone who has the captain's spare ID or the safe code.
/datum/mind/add_antag_datum(datum_type_or_instance, team)
	. = ..()
	if (!.)
		return
	if (!has_spare_ID_access())
		return
	message_admins("[current] became an antagonist, but may be the Acting Captain!")

#define SPARE_ID_ITEMS list(/obj/item/card/id/advanced/gold/captains_spare, /obj/item/paper/paperslip/corporate/fluff/spare_id_safe_code)
/// Returns true if this mind owns an item which would allow you to get the captain's spare ID
/datum/mind/proc/has_spare_ID_access()
	if (!current)
		return FALSE
	for (var/obj/item in current.get_all_contents())
		if (!is_type_in_list(item, SPARE_ID_ITEMS))
			continue
		return TRUE
	return FALSE
#undef SPARE_ID_ITEMS

// Also do it when the safe code is given out.
/datum/controller/subsystem/job/promote_to_captain(mob/living/carbon/human/new_captain, acting_captain = FALSE)
	. = ..()
	if (!acting_captain)
		return
	if (!new_captain.is_antag())
		return
	message_admins("[new_captain] became Acting Captain, but may be an antagonist!")
