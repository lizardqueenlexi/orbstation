// Brood mothers now get 6 eggs each, after that they only get more by eating people
/datum/action/cooldown/mob_cooldown/lay_eggs
	/// How many eggs you get, these don't come back so use them wisely
	var/eggs_count = 6

/datum/action/cooldown/mob_cooldown/lay_eggs/proc/update_desc()
	desc = initial(desc)
	desc += "<BR> You can lay [eggs_count] more of these eggs."

/datum/action/cooldown/mob_cooldown/lay_eggs/IsAvailable(feedback = FALSE)
	. = ..()
	if (!.)
		return FALSE
	if (eggs_count <= 0)
		if (feedback)
			owner.balloon_alert(owner, "no eggs left!")
		return FALSE
	return TRUE

/datum/action/cooldown/mob_cooldown/lay_eggs/lay_egg()
	. = ..()
	eggs_count--
	announce_remaining()
	build_all_button_icons()

/datum/action/cooldown/mob_cooldown/lay_eggs/proc/announce_remaining()
	owner.balloon_alert(owner, "[eggs_count] eggs remaining")

/datum/action/cooldown/mob_cooldown/lay_eggs/update_button_status(status_only, force)
	. = ..()
	update_desc()

/datum/action/cooldown/mob_cooldown/lay_eggs/enriched
	eggs_count = INFINITY // Has its own tracking and this makes keeping it modular easier

// Tracked with a different count
/datum/action/cooldown/mob_cooldown/lay_eggs/enriched/update_desc()
	desc = initial(desc)
	desc += "<BR> You can lay [charges] more of these eggs."

// Tracked with a different count
/datum/action/cooldown/mob_cooldown/lay_eggs/enriched/announce_remaining()
	owner.balloon_alert(owner, "[charges] eggs remaining")
