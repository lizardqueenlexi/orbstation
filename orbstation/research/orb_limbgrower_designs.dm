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

//The various species design disks combined. They were going to get unwieldy soon.
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
