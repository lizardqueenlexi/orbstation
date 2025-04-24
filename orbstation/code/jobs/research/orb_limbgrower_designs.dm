/// ORBSTATION DESIGNS

//Jellyperson limbs
/datum/design/jelly_leftarm
	name = "Left Arm"
	id = "jelarm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/left/jelly
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_rightarm
	name = "Right Arm"
	id = "jelarm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/right/jelly
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_leftleg
	name = "Left Leg"
	id = "jelleg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/left/jelly
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_rightleg
	name = "Right Leg"
	id = "jelleg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/right/jelly
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

//Podperson limbs
/datum/design/pod_leftarm
	name = "Left Arm"
	id = "podarm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/arm/left/pod
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_rightarm
	name = "Right Arm"
	id = "podarm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/arm/right/pod
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_leftleg
	name = "Left Leg"
	id = "podleg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/leg/left/pod
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_rightleg
	name = "Right Leg"
	id = "podleg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/leg/right/pod
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

//Slimeperson limbs
/datum/design/slime_leftarm
	name = "Left Arm"
	id = "sliarm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/left
	category = list(SPECIES_SLIMEPERSON)

/datum/design/slime_rightarm
	name = "Right Arm"
	id = "sliarm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/right
	category = list(SPECIES_SLIMEPERSON)

/datum/design/slime_leftleg
	name = "Left Leg"
	id = "slileg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list(SPECIES_SLIMEPERSON)

/datum/design/slime_rightleg
	name = "Right Leg"
	id = "slileg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/right
	category = list(SPECIES_SLIMEPERSON)

/// Heads

/datum/design/head
	name = "Head"
	id = "head"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 30, /datum/reagent/medicine/neurine = 20)
	build_path = /obj/item/bodypart/head
	category = list(SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_RATFOLK)

/datum/design/jelly_head
	name = "Head"
	id = "jelhead"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 30, /datum/reagent/medicine/neurine = 20)
	build_path = /obj/item/bodypart/head/jelly
	category = list(SPECIES_JELLYPERSON)

/datum/design/pod_head
	name = "Head"
	id = "podhead"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 30, /datum/reagent/medicine/neurine = 20)
	build_path = /obj/item/bodypart/head/pod
	category = list(SPECIES_PODPERSON)

/// Organs

//Ratfolk organs
/datum/design/rat_eyes
	name = "Rat Eyes"
	id = "rateyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/yuck = 10) //organic slurry is the essence of crawling around maintenance, really
	build_path = /obj/item/organ/eyes/ratfolk
	category = list(SPECIES_RATFOLK)

/datum/design/rat_ears
	name = "Rat Ears"
	id = "ratears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/ears/ratfolk
	category = list(SPECIES_RATFOLK)

/datum/design/rat_stomach
	name = "Rat Stomach"
	id = "ratstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 15, /datum/reagent/consumable/enzyme = 10)
	build_path = /obj/item/organ/stomach/ratfolk
	category = list(SPECIES_RATFOLK)

//Moth organ (there's only one!)
/datum/design/moth_eyes
	name = "Moth Eyes"
	id = "motheyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/eyes/moth
	category = list(SPECIES_MOTH)

//Jelly organs
/datum/design/jelly_tongue
	name = "Jelly Tongue"
	id = "jellytongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10)
	build_path = /obj/item/organ/tongue/jelly
	category = list(SPECIES_JELLYPERSON)

/datum/design/jelly_eyes
	name = "Jelly Eyes"
	id = "jellyeyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10)
	build_path = /obj/item/organ/eyes/jelly
	category = list(SPECIES_JELLYPERSON)

/datum/design/jelly_lungs
	name = "Vacuole"
	id = "jellylungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/lungs/slime
	category = list(SPECIES_JELLYPERSON)

//Alien organs
//I'd love if these had their own category, but the limbgrower UI is pretty bad and won't support that right now.
/datum/design/xenomorph_tongue
	name = "Alien Tongue"
	id = "alientongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/acid/fluacid = 20)
	build_path = /obj/item/organ/tongue/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/xenomorph_eyes
	name = "Alien Eyes"
	id = "alieneyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/acid/fluacid = 20)
	build_path = /obj/item/organ/eyes/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/xenomorph_liver
	name = "Alien Liver"
	id = "alienliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20, /datum/reagent/toxin/acid/fluacid = 30)
	build_path = /obj/item/organ/liver/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/plasma_vessel
	name = "Plasma Vessel"
	id = "alienplasmavessel"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/toxin/plasma = 100)
	build_path = /obj/item/organ/alien/plasmavessel
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/hivenode
	name = "Hive Node"
	id = "hivenode"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/consumable/ethanol/hiveminderaser = 100)
	build_path = /obj/item/organ/alien/hivenode
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/resinspinner
	name = "Resin Spinner"
	id = "resinspinner"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/cellulose = 100) //cellulose might be a bit silly, but...
	build_path = /obj/item/organ/alien/resinspinner
	category = list(RND_CATEGORY_LIMBS_OTHER)

/// External Organs

/datum/design/moth_wings
	name = "Moth Wings"
	id = "mothwings"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 30)
	build_path = /obj/item/organ/wings/moth
	category = list(SPECIES_MOTH)
	research_icon = 'icons/mob/human/species/moth/moth_wings.dmi'
	research_icon_state = "m_moth_wings_monarch_BEHIND"

/// Disks

/datum/design/limb_disk/basic
	name = "Basic Non-human Design Disk"
	desc = "Contains designs for the specialized organs of many of the species Nanotrasen employs."
	id = "limbdesign_basic"
	build_path = /obj/item/disk/design_disk/limbs/basic

/datum/design/limb_disk/advanced
	name = "Advanced Non-human Design Disk"
	desc = "Contains designs for the specialized organs of many of the species Nanotrasen employs."
	id = "limbdesign_advanced"
	build_path = /obj/item/disk/design_disk/limbs/advanced

/datum/design/limb_disk/heads
	name = "Head Synthesis Design Disk"
	desc = "Contains designs for growing synthetic heads for a variety of species."
	id = "limbdesign_heads"
	build_path = /obj/item/disk/design_disk/limbs/heads

/datum/design/limb_disk/xeno
	name = "Xeno-organ Design Disk"
	desc = "Contains designs to replicate the basic organs of the xenomorph species."
	id = "limbdesign_xeno"
	build_path = /obj/item/disk/design_disk/limbs/xeno

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
		/datum/design/slime_leftarm,
		/datum/design/slime_leftleg,
		/datum/design/slime_rightarm,
		/datum/design/slime_rightleg,
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
	var/obj/item/organ/snout_to_insert
	if(limb.limb_id == SPECIES_LIZARD)
		snout_to_insert = new /obj/item/organ/snout(loc)
	else
		snout_to_insert = new /obj/item/organ/snout_rat(loc)
	snout_to_insert.bodypart_insert(limb)

// Techweb nodes
/datum/techweb_node/xenoorgan_biotech
	id="xeno_basic"
	design_ids = list(
		"limbdesign_basic"
	)
	display_name = "Basic Non-human Biology"
	description = "Study on the simpler organs of our non-human crewmates."
	prereq_ids = list("bio_scan")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_2_POINTS) //I really feel this one was too expensive at base, it's just organs
	discount_experiments = list(
		/datum/experiment/scanning/random/cytology/easy = TECHWEB_TIER_1_POINTS,
	)

/datum/techweb_node/nonhuman_advanced
	id = "nonhuman_advanced"
	display_name = "Advanced Non-human Biology"
	description = "Deeper studies into the unique organs of our crewmates."
	prereq_ids = list("xeno_basic")
	design_ids = list(
		"limbdesign_advanced",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_3_POINTS)
	discount_experiments = list(
		/datum/experiment/scanning/points/slime/hard = TECHWEB_TIER_3_POINTS,
	)

/datum/techweb_node/head_synthesis
	id = "head_synthesis"
	display_name = "Head Synthesis"
	description = "The limb grower might be more useful if it could grow new heads as well."
	prereq_ids = list("nonhuman_advanced")
	design_ids = list(
		"limbdesign_heads",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_4_POINTS)

/datum/techweb_node/xenomorph_biotech
	id = "xenomorph_bio"
	display_name = "Xeno-organ Biology"
	description = "Preliminary research into the mysterious physiology of the xenomorph species."
	prereq_ids = list("head_synthesis")
	design_ids = list(
		"limbdesign_xeno",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = TECHWEB_TIER_5_POINTS)
	required_experiments = list(/datum/experiment/autopsy/xenomorph)
