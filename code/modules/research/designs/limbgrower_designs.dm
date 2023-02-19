/////////////////////////////////////
//////////Limb Grower Designs ///////
/////////////////////////////////////

/datum/design/leftarm
	name = "Left Arm"
	id = "arm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/arm/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_RATFOLK) //ORBSTATION EDIT

/datum/design/rightarm
	name = "Right Arm"
	id = "arm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/arm/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_RATFOLK) //ORBSTATION EDIT

/datum/design/leftleg
	name = "Left Leg"
	id = "leg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_RATFOLK, RND_CATEGORY_LIMBS_DIGITIGRADE) //ORBSTATION EDIT

/datum/design/rightleg
	name = "Right Leg"
	id = "leg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 25)
	build_path = /obj/item/bodypart/leg/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_HUMAN, SPECIES_LIZARD, SPECIES_MOTH, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_RATFOLK, RND_CATEGORY_LIMBS_DIGITIGRADE) //ORBSTATION EDIT

//Non-limb limb designs

/datum/design/heart
	name = "Heart"
	id = "heart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 30)
	build_path = /obj/item/organ/internal/heart
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/lungs
	name = "Lungs"
	id = "lungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/lungs
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/liver
	name = "Liver"
	id = "liver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/liver
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/stomach
	name = "Stomach"
	id = "stomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 15)
	build_path = /obj/item/organ/internal/stomach
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/appendix
	name = "Appendix"
	id = "appendix"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 5) //why would you need this
	build_path = /obj/item/organ/internal/appendix
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/eyes
	name = "Eyes"
	id = "eyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/eyes
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/ears
	name = "Ears"
	id = "ears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/ears
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

/datum/design/tongue
	name = "Tongue"
	id = "tongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/tongue
	category = list(SPECIES_HUMAN, RND_CATEGORY_INITIAL)

// Grows a fake lizard tail - not usable in lizard wine and other similar recipes.
/datum/design/lizard_tail
	name = "Lizard Tail"
	id = "liztail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/lizard/fake
	category = list(SPECIES_LIZARD)

/datum/design/lizard_tongue
	name = "Forked Tongue"
	id = "liztongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/internal/tongue/lizard
	category = list(SPECIES_LIZARD)

/datum/design/monkey_tail
	name = "Monkey Tail"
	id = "monkeytail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/monkey
	category = list(RND_CATEGORY_LIMBS_OTHER, RND_CATEGORY_INITIAL)

/datum/design/cat_tail
	name = "Cat Tail"
	id = "cattail"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20)
	build_path = /obj/item/organ/external/tail/cat
	category = list(SPECIES_HUMAN)

/datum/design/cat_ears
	name = "Cat Ears"
	id = "catears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/ears/cat
	category = list(SPECIES_HUMAN)

/datum/design/plasmaman_lungs
	name = "Plasma Filter"
	id = "plasmamanlungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/lungs/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_tongue
	name = "Plasma Bone Tongue"
	id = "plasmamantongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/tongue/bone/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_liver
	name = "Reagent Processing Crystal"
	id = "plasmamanliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/liver/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/plasmaman_stomach
	name = "Digestive Crystal"
	id = "plasmamanstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/stomach/bone/plasmaman
	category = list(SPECIES_PLASMAMAN)

/datum/design/ethereal_stomach
	name = "Biological Battery"
	id = "etherealstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/stomach/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/ethereal_tongue
	name = "Electrical Discharger"
	id = "etherealtongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/tongue/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/ethereal_lungs
	name = "Aeration Reticulum"
	id = "ethereallungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/lungs/ethereal
	category = list(SPECIES_ETHEREAL)

// Intentionally not growable by normal means - for balance conerns.
/datum/design/ethereal_heart
	name = "Crystal Core"
	id = "etherealheart"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/consumable/liquidelectricity/enriched = 20)
	build_path = /obj/item/organ/internal/heart/ethereal
	category = list(SPECIES_ETHEREAL)

/datum/design/armblade
	name = "Arm Blade"
	id = "armblade"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 75)
	build_path = /obj/item/melee/synthetic_arm_blade
	category = list(RND_CATEGORY_LIMBS_OTHER, RND_CATEGORY_HACKED)

/// Design disks and designs - for adding limbs and organs to the limbgrower.
/obj/item/disk/design_disk/limbs
	name = "Limb Design Disk"
	desc = "A disk containing limb and organ designs for a limbgrower."
	icon_state = "datadisk1"
	/// List of all limb designs this disk contains.
	var/list/limb_designs = list()

/obj/item/disk/design_disk/limbs/Initialize(mapload)
	. = ..()
	max_blueprints = limb_designs.len
	for(var/design in limb_designs)
		var/datum/design/new_design = design
		blueprints += new new_design

/datum/design/limb_disk
	name = "Limb Design Disk"
	desc = "Contains designs for various limbs."
	id = "limbdesign_parent"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/disk/design_disk/limbs
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

/obj/item/disk/design_disk/limbs/felinid
	name = "Felinid Organ Design Disk"
	limb_designs = list(/datum/design/cat_tail, /datum/design/cat_ears)

/datum/design/limb_disk/felinid
	name = "Felinid Organ Design Disk"
	desc = "Contains designs for felinid organs for the limbgrower - Felinid ears and tail."
	id = "limbdesign_felinid"
	build_path = /obj/item/disk/design_disk/limbs/felinid

/obj/item/disk/design_disk/limbs/lizard
	name = "Lizard Organ Design Disk"
	limb_designs = list(/datum/design/lizard_tail, /datum/design/lizard_tongue)

/datum/design/limb_disk/lizard
	name = "Lizard Organ Design Disk"
	desc = "Contains designs for lizard organs for the limbgrower - Lizard tongue, and tail"
	id = "limbdesign_lizard"
	build_path = /obj/item/disk/design_disk/limbs/lizard

/obj/item/disk/design_disk/limbs/plasmaman
	name = "Plasmaman Organ Design Disk"
	limb_designs = list(/datum/design/plasmaman_stomach, /datum/design/plasmaman_liver, /datum/design/plasmaman_lungs, /datum/design/plasmaman_tongue)

/datum/design/limb_disk/plasmaman
	name = "Plasmaman Organ Design Disk"
	desc = "Contains designs for plasmaman organs for the limbgrower - Plasmaman tongue, liver, stomach, and lungs."
	id = "limbdesign_plasmaman"
	build_path = /obj/item/disk/design_disk/limbs/plasmaman

/obj/item/disk/design_disk/limbs/ethereal
	name = "Ethereal Organ Design Disk"
	limb_designs = list(/datum/design/ethereal_stomach, /datum/design/ethereal_tongue, /datum/design/ethereal_lungs)

/datum/design/limb_disk/ethereal
	name = "Ethereal Organ Design Disk"
	desc = "Contains designs for ethereal organs for the limbgrower - Ethereal tongue and stomach."
	id = "limbdesign_ethereal"
	build_path = /obj/item/disk/design_disk/limbs/ethereal

/// ORBSTATION DESIGNS

//Jellyperson limbs
/datum/design/jelly_leftarm
	name = "Left Arm"
	id = "jelarm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_rightarm
	name = "Right Arm"
	id = "jelarm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/arm/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_leftleg
	name = "Left Leg"
	id = "jelleg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

/datum/design/jelly_rightleg
	name = "Right Leg"
	id = "jelleg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 25)
	build_path = /obj/item/bodypart/leg/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_JELLYPERSON)

//Podperson limbs
/datum/design/pod_leftarm
	name = "Left Arm"
	id = "podarm/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/arm/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_rightarm
	name = "Right Arm"
	id = "podarm/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/arm/right
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_leftleg
	name = "Left Leg"
	id = "podleg/left"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/leg/left
	category = list(RND_CATEGORY_INITIAL, SPECIES_PODPERSON)

/datum/design/pod_rightleg
	name = "Right Leg"
	id = "podleg/right"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 25)
	build_path = /obj/item/bodypart/leg/right
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
	build_path = /obj/item/bodypart/head
	category = list(SPECIES_JELLYPERSON)

/datum/design/pod_head
	name = "Head"
	id = "podhead"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/cellulose = 30, /datum/reagent/medicine/neurine = 20)
	build_path = /obj/item/bodypart/head
	category = list(SPECIES_PODPERSON)

/// Organs

//Ratfolk organs
/datum/design/rat_eyes
	name = "Rat Eyes"
	id = "rateyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/yuck = 10) //organic slurry is the essence of crawling around maintenance, really
	build_path = /obj/item/organ/internal/eyes/ratfolk
	category = list(SPECIES_RATFOLK)

/datum/design/rat_ears
	name = "Rat Ears"
	id = "ratears"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/ears/ratfolk
	category = list(SPECIES_RATFOLK)

/datum/design/rat_stomach
	name = "Rat Stomach"
	id = "ratstomach"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 15, /datum/reagent/consumable/enzyme = 10)
	build_path = /obj/item/organ/internal/stomach/ratfolk
	category = list(SPECIES_RATFOLK)

//Moth organ (there's only one!)
/datum/design/moth_eyes
	name = "Moth Eyes"
	id = "motheyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10)
	build_path = /obj/item/organ/internal/eyes/moth
	category = list(SPECIES_MOTH)

//Jelly organs
/datum/design/jelly_tongue
	name = "Jelly Tongue"
	id = "jellytongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10)
	build_path = /obj/item/organ/internal/tongue/jelly
	category = list(SPECIES_JELLYPERSON)

/datum/design/jelly_eyes
	name = "Jelly Eyes"
	id = "jellyeyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10)
	build_path = /obj/item/organ/internal/eyes/jelly
	category = list(SPECIES_JELLYPERSON)

/datum/design/jelly_lungs
	name = "Vacuole"
	id = "jellylungs"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/toxin/slimejelly = 10, /datum/reagent/toxin/plasma = 20)
	build_path = /obj/item/organ/internal/lungs/slime
	category = list(SPECIES_JELLYPERSON)

//Alien organs
//I'd love if these had their own category, but the limbgrower UI is pretty bad and won't support that right now.
/datum/design/xenomorph_tongue
	name = "Alien Tongue"
	id = "alientongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/acid/fluacid = 20)
	build_path = /obj/item/organ/internal/tongue/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/xenomorph_eyes
	name = "Alien Eyes"
	id = "alieneyes"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 10, /datum/reagent/toxin/acid/fluacid = 20)
	build_path = /obj/item/organ/internal/eyes/night_vision/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/xenomorph_liver
	name = "Alien Liver"
	id = "alienliver"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 20, /datum/reagent/toxin/acid/fluacid = 30)
	build_path = /obj/item/organ/internal/liver/alien
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/plasma_vessel
	name = "Plasma Vessel"
	id = "alienplasmavessel"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/toxin/plasma = 100)
	build_path = /obj/item/organ/internal/alien/plasmavessel
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/hivenode
	name = "Hive Node"
	id = "hivenode"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/consumable/ethanol/hiveminderaser = 100)
	build_path = /obj/item/organ/internal/alien/hivenode
	category = list(RND_CATEGORY_LIMBS_OTHER)

/datum/design/resinspinner
	name = "Resin Spinner"
	id = "resinspinner"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 50, /datum/reagent/toxin/acid/fluacid = 50, /datum/reagent/cellulose = 100) //cellulose might be a bit silly, but...
	build_path = /obj/item/organ/internal/alien/resinspinner
	category = list(RND_CATEGORY_LIMBS_OTHER)

/// External Organs

/datum/design/moth_wings
	name = "Moth Wings"
	id = "mothwings"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/c2/synthflesh = 30)
	build_path = /obj/item/organ/external/wings/moth
	category = list(SPECIES_MOTH)
	research_icon = 'icons/mob/species/moth/moth_wings.dmi'
	research_icon_state = "m_moth_wings_monarch_BEHIND"

/// Disks

/datum/design/limb_disk/basic
	name = "Basic Non-human Design Disk"
	desc = "Contains designs for the specialized organs of many of the species NanoTrasen employs."
	id = "limbdesign_basic"
	build_path = /obj/item/disk/design_disk/limbs/basic

/datum/design/limb_disk/advanced
	name = "Advanced Non-human Design Disk"
	desc = "Contains designs for the specialized organs of many of the species NanoTrasen employs."
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
