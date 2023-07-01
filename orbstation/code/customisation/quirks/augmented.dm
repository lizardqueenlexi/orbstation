/datum/quirk/augmented
	name = "Fully Augmented"
	desc = "You never asked for this. Or maybe you did. Either way, all your limbs are cybernetic."
	icon = FA_ICON_PLUG_CIRCLE_BOLT
	value = 0
	medical_record_text = "During physical examination, patient was found to have fully augmented limbs."

/datum/quirk/augmented/add_unique()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/left/robot/)
	human_holder.del_and_replace_bodypart(new /obj/item/bodypart/arm/right/robot/)
	if(human_holder.bodytype & BODYTYPE_DIGITIGRADE)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/left/robot/digitigrade)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/right/robot/digitigrade)
	else
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/left/robot/)
		human_holder.del_and_replace_bodypart(new /obj/item/bodypart/leg/right/robot/)

/datum/quirk/augmented/post_add()
	to_chat(quirk_holder, span_boldannounce("All your limbs have been replaced with cybernetic parts. They are roughly analogous to organic limbs. However, \
	you need to use a welding tool and cables to repair them, instead of standard medical treatment."))
