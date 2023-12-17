//The various species design disks combined.
/obj/item/disk/design_disk/limbs/basic
	name = "Basic Non-human Design Disk"
	limb_designs = list(
		/datum/design/cat_tail,
		/datum/design/cat_ears,
		/datum/design/lizard_tail,
		/datum/design/lizard_tongue,
		/datum/design/plasmaman_stomach,
		/datum/design/plasmaman_liver,
		/datum/design/plasmaman_tongue,
		/datum/design/ethereal_tongue,
		/datum/design/moth_eyes,
		/datum/design/rat_ears,
		/datum/design/jelly_eyes,
		/datum/design/jelly_tongue,
		)

/obj/item/disk/design_disk/limbs/advanced
	name = "Advanced Non-human Design Disk"
	limb_designs = list(
		/datum/design/plasmaman_lungs,
		/datum/design/ethereal_stomach,
		/datum/design/ethereal_lungs,
		/datum/design/rat_stomach,
		/datum/design/rat_eyes,
		/datum/design/moth_wings,
		/datum/design/jelly_lungs,
	)

/obj/item/disk/design_disk/limbs/heads
	name = "Head Synthesis Design Disk"
	limb_designs = list(
		/datum/design/head,
		/datum/design/jelly_head,
		/datum/design/pod_head,
		)

/obj/item/disk/design_disk/limbs/xeno
	name = "Xeno-organ Design Disk"
	limb_designs = list(
		/datum/design/xenomorph_tongue,
		/datum/design/xenomorph_eyes,
		/datum/design/xenomorph_liver,
		/datum/design/plasma_vessel,
		/datum/design/hivenode,
		/datum/design/resinspinner,
		)

//Attach an appropriate snout to a printed head that should have one
/obj/machinery/limbgrower/proc/attach_snout(obj/item/bodypart/limb)
	if(!istype(limb))
		return
	var/obj/item/organ/external/snout_to_insert
	if(limb.limb_id == SPECIES_LIZARD)
		snout_to_insert = new /obj/item/organ/external/snout(loc)
	else
		snout_to_insert = new /obj/item/organ/external/snout_rat(loc)
	snout_to_insert.bodypart_insert(limb)

// Techweb nodes
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
	required_experiments = list(/datum/experiment/autopsy/xenomorph)
