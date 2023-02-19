// Orbstation additions to the techweb.

/datum/techweb_node
	//Extra items to be unlocked by an existing techweb node
	var/list/orb_design_ids = list()

/datum/techweb_node/New()
	design_ids += orb_design_ids
	return ..()

/datum/techweb_node/adv_surgery
	orb_design_ids = list(
		"surgery_height_manip"
	)

/datum/techweb_node/xenoorgan_biotech
	design_ids = list(
		"limbdesign_basic"
	)
	display_name = "Basic Non-human Biology"
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500) //I really feel this one was too expensive at base, it's just organs
	discount_experiments = list(
		/datum/experiment/scanning/random/cytology/easy = 1000,
	)

/datum/techweb_node/nonhuman_advanced
	id = "nonhuman_advanced"
	display_name = "Advanced Non-human Biology"
	description = "Deeper studies into the unique organs of our crewmates."
	prereq_ids = list("xenoorgan_bio")
	design_ids = list(
		"limbdesign_advanced",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	discount_experiments = list(
		/datum/experiment/scanning/points/slime/hard = 4000,
	)

/datum/techweb_node/head_synthesis
	id = "head_synth"
	display_name = "Head Synthesis"
	description = "The limb grower might be more useful if it could grow new heads as well."
	prereq_ids = list("xenoorgan_bio")
	design_ids = list(
		"limbdesign_heads",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/xenomorph_biotech
	id = "xenomorph_bio"
	display_name = "Xeno-organ Biology"
	description = "Preliminary research into the mysterious physiology of the xenomorph species."
	prereq_ids = list("adv_biotech")
	design_ids = list(
		"limbdesign_xeno",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	required_experiments = list(/datum/experiment/dissection/xenomorph)
