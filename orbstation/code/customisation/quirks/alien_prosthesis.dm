/datum/quirk/alien_prosthesis
	name = "Alien Prosthesis"
	desc = "Due to a life-saving medical procedure, one of your limbs has been replaced with the limb of another species. It might be weird, but it mostly just looks cool."
	icon = FA_ICON_HAND_HOLDING_MEDICAL
	value = 0
	var/slot_string = "limb"
	medical_record_text = "A lifesaving medical experiment in the patient's past has left them with an unusual alien limb."

	var/list/species_whitelist = list(
		/datum/species/lizard,
		/datum/species/ethereal,
		/datum/species/moth,
		/datum/species/abductor,
		/datum/species/fly,
		/datum/species/jelly,
		/datum/species/jelly/slime,
		/datum/species/pod,
		/datum/species/ratfolk,
		/datum/species/shadow,
	)

/datum/quirk/alien_prosthesis/add_unique()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/bodypart/prosthetic

	var/limb_slot = pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	var/list/bodypart_list = fill_bodypart_list(limb_slot)

	if(!bodypart_list.len)
		stack_trace("Bodypart list for alien prosthesis is empty!")
		return

	var/limbtype = pick(bodypart_list)

	prosthetic = new limbtype()

	prosthetic.species_color = sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]") //make it a random color

	human_holder.del_and_replace_bodypart(prosthetic)

/datum/quirk/alien_prosthesis/proc/fill_bodypart_list(slot)
	var/list/bodypart_list = list()
	var/mob/living/carbon/human/human_holder = quirk_holder

	for(var/datum/species/part_species as anything in species_whitelist)
		if(human_holder.dna?.species == part_species) //don't use parts from your selected species!
			continue
		var/datum/species/this_species = new part_species()
		if(this_species.bodypart_overrides[slot])
			bodypart_list += this_species.bodypart_overrides[slot]

	return bodypart_list
