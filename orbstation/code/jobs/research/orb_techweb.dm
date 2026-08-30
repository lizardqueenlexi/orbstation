// Framework for Orbstation additions to the techweb.
/datum/techweb_node
	//Extra items to be unlocked by an existing techweb node
	var/list/orb_unlocked_designs = list()

/datum/techweb_node/New()
	unlocked_designs += orb_unlocked_designs
	return ..()
