//Code largely copied from the "tongue tied" quirk. This one is much simpler, though.

/datum/quirk/robot_voice
	name = "Artificial Voice Box"
	desc = "Your tongue and throat were damaged beyond repair in some past incident, and now you have a robotic voice box to replace them. \
	Note that your robotic voice box cannot be removed."
	icon = FA_ICON_WALKIE_TALKIE
	value = 0 //the robot tongue is capable of speaking every language but does not actually grant them to you - so it doesn't do much
	medical_record_text = "Patient has a robotic voice box installed."

/datum/quirk/robot_voice/add_unique()
	var/mob/living/carbon/human/human_holder = quirk_holder
	/*var/obj/item/organ/internal/tongue/old_tongue = human_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	old_tongue.Remove(human_holder)
	qdel(old_tongue)*/

	var/obj/item/organ/internal/tongue/robot/new_tongue = new(get_turf(human_holder))
	new_tongue.Insert(human_holder, movement_flags = DELETE_IF_REPLACED)
	// Only tongues of people with this quirk can't be removed. Manually spawned or found tongues can be.
	new_tongue.organ_flags |= ORGAN_UNREMOVABLE

/datum/quirk/robot_voice/remove()
	var/obj/item/organ/internal/tongue/robot/quirk_tongue = quirk_holder.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(!istype(quirk_tongue))
		return

	var/obj/item/organ/internal/tongue/new_tongue_type = /obj/item/organ/internal/tongue
	if(iscarbon(quirk_holder))
		var/mob/living/carbon/carbon_quirky = quirk_holder
		new_tongue_type = carbon_quirky.dna?.species?.mutanttongue
	if(!new_tongue_type)
		return

	var/obj/item/organ/internal/tongue/new_tongue = new new_tongue_type()
	//quirk_tongue.Remove(quirk_holder, TRUE)
	new_tongue.Insert(quirk_holder, TRUE, movement_flags = DELETE_IF_REPLACED)
	//qdel(quirk_tongue)
