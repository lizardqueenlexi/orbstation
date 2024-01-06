// Amber Focus

/// Proximity thresholds for the various icon states. (See set_proximity_icon())
#define FOCUS_PROXIMITY_HOT 3
#define FOCUS_PROXIMITY_WARM 8
#define FOCUS_PROXIMITY_COOL 16

/datum/heretic_knowledge/amber_focus
	desc = "Allows you to transmute a sheet of glass and a pair of eyes to create an Amber Focus. \
		A focus must be worn in order to cast more advanced spells. \
		When worn, the eye will blink faster in reaction to nearby untapped influences."

/obj/item/clothing/neck/heretic_focus
	icon = 'orbstation/icons/obj/items/clothing/heretic_amulet.dmi'
	icon_state = "eldritch_necklace_0"
	worn_icon_state = "eldritch_necklace_inactive"
	worn_icon = 'orbstation/icons/obj/items/clothing/heretic_amulet_worn.dmi'
	///Name used to generate icon state
	var/focus_icon_name = "eldritch_necklace"

/obj/item/clothing/neck/heretic_focus/moon_amulette
	icon = 'orbstation/icons/obj/items/clothing/heretic_amulet.dmi'
	icon_state = "moon_amulette_0"
	worn_icon_state = "moon_amulette_inactive"

/obj/item/clothing/neck/heretic_focus/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_NECK || !ishuman(user) || !IS_HERETIC(user))
		stop_tracking()
		return

	// Update the worn icon.
	icon_state = "[focus_icon_name]_1"
	worn_icon_state = "[focus_icon_name]_active"
	user.update_worn_neck()

	START_PROCESSING(SSfastprocess, src)

/obj/item/clothing/neck/heretic_focus/dropped(mob/user)
	. = ..()
	stop_tracking()

/obj/item/clothing/neck/heretic_focus/Destroy()
	. = ..()
	STOP_PROCESSING(SSfastprocess, src)

/obj/item/clothing/neck/heretic_focus/process()
	// if there's no influences left to track, no need to process! But we'll keep the eye open to obscure that there's no influences left.
	if(!length(GLOB.reality_smash_track.smashes))
		icon_state = "[focus_icon_name]_1"
		return PROCESS_KILL

	var/closest_influence = 255
	for(var/obj/effect/heretic_influence/smash as anything in GLOB.reality_smash_track.smashes)
		if(smash.z != loc.z) // don't bother with influences on a different z-level
			continue
		var/distance_to_influence = get_dist(loc, smash)
		if(distance_to_influence < closest_influence)
			closest_influence = distance_to_influence

	icon_state = set_proximity_icon(closest_influence)

/// Change icon state (blink speed) of the focus based on how close it is to the closest influence.
/obj/item/clothing/neck/heretic_focus/proc/set_proximity_icon(closest_influence)
	switch(closest_influence)
		if(0 to FOCUS_PROXIMITY_HOT)
			return "[focus_icon_name]_4" // eye stays open
		if(FOCUS_PROXIMITY_HOT to FOCUS_PROXIMITY_WARM)
			return "[focus_icon_name]_3" // eye blinks rapidly
		if(FOCUS_PROXIMITY_WARM to FOCUS_PROXIMITY_COOL)
			return "[focus_icon_name]_2" // eye blinks sometimes

	return  "[focus_icon_name]_1" // eye blinks rarely

///  Heretics can examine the focus for clarification on how close the nearest influence is.
/obj/item/clothing/neck/heretic_focus/examine(mob/user)
	. = ..()
	if(!IS_HERETIC(user))
		return

	if(icon_state == "[focus_icon_name]_1")
		. += span_red("There are no untapped influences nearby.")
		return

	if(icon_state == "[focus_icon_name]_2")
		. += span_notice("There is an untapped influence somewhere around here...")
		return

	if(icon_state == "[focus_icon_name]_3")
		. += span_boldnotice("There is an untapped influence nearby!")
		return

	if(icon_state == "[focus_icon_name]_4")
		. += span_boldnicegreen("The untapped influence is just within reach!")
		return

/// Stops processing and closes the eye.
/obj/item/clothing/neck/heretic_focus/proc/stop_tracking()
	STOP_PROCESSING(SSfastprocess, src)
	icon_state = "[focus_icon_name]_0"
	worn_icon_state = "[focus_icon_name]_inactive"

#undef FOCUS_PROXIMITY_HOT
#undef FOCUS_PROXIMITY_WARM
#undef FOCUS_PROXIMITY_COOL

// Codex Cicatrix

/datum/heretic_knowledge/codex_cicatrix
	desc = "Allows you to transmute a bible, a fountain pen, and hide from an animal (or human) to create a Codex Cicatrix. \
		The Codex Cicatrix can be used when draining influences to gain additional knowledge, but comes at greater risk of being noticed. \
		It can also be used to draw and remove transmutation runes easier, \
		and can be examined to see the number of ghosts currently present."

/// Heretics can examine the codex to see how many ghosts there are, and how many ghosts are orbiting them.
/obj/item/codex_cicatrix/examine(mob/user)
	. = ..()
	if(!IS_HERETIC(user))
		return

	var/num_ghosts = length(GLOB.current_observers_list) + length(GLOB.dead_player_list)
	var/num_orbiters = 0
	for(var/mob/dead/ghost in user.orbiters?.orbiter_list)
		if(!ghost.client) // skip over orbiters who aren't actually connected
			continue
		num_orbiters++

	. += "Faded text is written on a dusty page..."
	. += span_cult("Spirits following you: <b>[num_orbiters] / [num_ghosts]</b>")
