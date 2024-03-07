//Mech Fabricator designs
/datum/design/digi_borg_l_leg
	name = "Digitigrade Cyborg Left Leg"
	id = "digi_borg_l_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/left/robot/digitigrade
	materials = list(/datum/material/iron=10000)
	construction_time = 200
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CYBER_LIMBS
	)

/datum/design/digi_borg_r_leg
	name = "Digitigrade Cyborg Right Leg"
	id = "digi_borg_r_leg"
	build_type = MECHFAB
	build_path = /obj/item/bodypart/leg/right/robot/digitigrade
	materials = list(/datum/material/iron=10000)
	construction_time = 200
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG + RND_SUBCATEGORY_MECHFAB_CYBORG_CYBER_LIMBS
	)

//Research nodes
/datum/techweb_node/digi_borg
	id = "digi_borg"
	starting_node = TRUE
	display_name = "Digitigrade Robotic Legs"
	description = "Digitigrade robotic legs, as an alternative to the plantigrade model."
	design_ids = list(
		"digi_borg_l_leg",
		"digi_borg_r_leg",
	)

// Actual items
/obj/item/bodypart/leg/right/robot/digitigrade
	name = "digitigrade robotic right leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. This one is shaped like a digitigrade Tiziran leg."
	icon_static =  'orbstation/icons/mob/augmentation/augments.dmi'
	icon = 'orbstation/icons/mob/augmentation/augments.dmi'
	bodyshape = BODYSHAPE_HUMANOID | BODYSHAPE_DIGITIGRADE
	limb_id = BODYPART_ID_DIGITIGRADE
	icon_state = "digitigrade_r_leg"

/obj/item/bodypart/leg/right/robot/digitigrade/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/obj/item/clothing/shoes/worn_shoes = human_owner.get_item_by_slot(ITEM_SLOT_FEET)
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		var/shoes_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE
		if((worn_shoes == null) || (worn_shoes.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)))
			shoes_compatible = TRUE

		if((uniform_compatible && suit_compatible && shoes_compatible) || (suit_compatible && shoes_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = BODYPART_ID_ROBOTIC

/obj/item/bodypart/leg/left/robot/digitigrade
	name = "digitigrade robotic left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. This one is shaped like a digitigrade Tiziran leg."
	icon_static =  'orbstation/icons/mob/augmentation/augments.dmi'
	icon = 'orbstation/icons/mob/augmentation/augments.dmi'
	bodytype = BODYSHAPE_HUMANOID | BODYSHAPE_DIGITIGRADE | BODYTYPE_ROBOTIC
	limb_id = BODYPART_ID_DIGITIGRADE
	icon_state = "digitigrade_l_leg"

/obj/item/bodypart/leg/left/robot/digitigrade/update_limb(dropping_limb = FALSE, is_creating = FALSE)
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		var/obj/item/clothing/shoes/worn_shoes = human_owner.get_item_by_slot(ITEM_SLOT_FEET)
		var/uniform_compatible = FALSE
		var/suit_compatible = FALSE
		var/shoes_compatible = FALSE
		if(!(human_owner.w_uniform) || (human_owner.w_uniform.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON))) //Checks uniform compatibility
			uniform_compatible = TRUE
		if((!human_owner.wear_suit) || (human_owner.wear_suit.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)) || !(human_owner.wear_suit.body_parts_covered & LEGS)) //Checks suit compatability
			suit_compatible = TRUE
		if((worn_shoes == null) || (worn_shoes.supports_variations_flags & (CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON)))
			shoes_compatible = TRUE

		if((uniform_compatible && suit_compatible && shoes_compatible) || (suit_compatible && shoes_compatible && human_owner.wear_suit?.flags_inv & HIDEJUMPSUIT)) //If the uniform is hidden, it doesnt matter if its compatible
			limb_id = BODYPART_ID_DIGITIGRADE

		else
			limb_id = BODYPART_ID_ROBOTIC
