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
