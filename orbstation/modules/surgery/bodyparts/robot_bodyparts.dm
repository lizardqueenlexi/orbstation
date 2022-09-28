//Robotic body parts for Orbstation

/obj/item/bodypart/r_leg/robot/digitigrade
	name = "digitigrade robotic right leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. This one is shaped like a digitigrade Tiziran leg."
	icon_static =  'orbstation/icons/mob/augmentation/augments.dmi'
	icon = 'orbstation/icons/mob/augmentation/augments.dmi'
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_DIGITIGRADE | BODYTYPE_ROBOTIC
	limb_id = BODYPART_ID_DIGITIGRADE
	icon_state = "digitigrade_r_leg"

/obj/item/bodypart/r_leg/robot/digitigrade/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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

/obj/item/bodypart/l_leg/robot/digitigrade
	name = "digitigrade robotic left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. This one is shaped like a digitigrade Tiziran leg."
	icon_static =  'orbstation/icons/mob/augmentation/augments.dmi'
	icon = 'orbstation/icons/mob/augmentation/augments.dmi'
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_DIGITIGRADE | BODYTYPE_ROBOTIC
	limb_id = BODYPART_ID_DIGITIGRADE
	icon_state = "digitigrade_l_leg"

/obj/item/bodypart/l_leg/robot/digitigrade/update_limb(dropping_limb = FALSE, is_creating = FALSE)
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
