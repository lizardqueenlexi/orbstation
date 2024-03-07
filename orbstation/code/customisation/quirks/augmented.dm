/datum/quirk/augmented
	name = "Fully Augmented"
	desc = "You never asked for this. Or maybe you did. Either way, all your limbs are cybernetic. They are civilian grade, and provide no armour."
	icon = FA_ICON_PLUG_CIRCLE_BOLT
	value = 0
	medical_record_text = "During physical examination, patient was found to have fully augmented, but unarmored, limbs."

/datum/quirk/augmented/add_unique()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/left/robot/quirk)
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/right/robot/quirk)
	if(human_holder.bodytype & BODYSHAPE_DIGITIGRADE)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/left/robot/digitigrade/quirk)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/right/robot/digitigrade/quirk)
	else
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/left/robot/quirk)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/right/robot/quirk)

/datum/quirk/augmented/post_add()
	to_chat(quirk_holder, span_boldannounce("All your limbs have been replaced with cybernetic parts. They are roughly analogous to organic limbs. However, \
	you need to use a welding tool and cables to repair them, instead of standard medical treatment. They are also civilian grade, providing no armour."))

/obj/item/bodypart/arm/left/robot/quirk
	name = "civilian grade cyborg left arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour."
	burn_modifier = 1
	brute_modifier = 1

/obj/item/bodypart/arm/right/robot/quirk
	name = "civilian grade cyborg right arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour."
	burn_modifier = 1
	brute_modifier = 1

/obj/item/bodypart/leg/left/robot/quirk
	name = "civilian grade cyborg left left"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour."
	burn_modifier = 1
	brute_modifier = 1

/obj/item/bodypart/leg/right/robot/quirk
	name = "civilian grade cyborg right left"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour."
	burn_modifier = 1
	brute_modifier = 1

/obj/item/bodypart/leg/left/robot/digitigrade/quirk
	name = "civilian grade digitigrade robotic left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour. This one is shaped like a digitigrade Tiziran leg."

/obj/item/bodypart/leg/right/robot/digitigrade/quirk
	name = "civilian grade digitigrade robotic left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Civilian grade, thus has no armour. This one is shaped like a digitigrade Tiziran leg."
