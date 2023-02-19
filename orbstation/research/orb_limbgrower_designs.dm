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
	snout_to_insert.add_to_limb(limb)
