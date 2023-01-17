/datum/quirk/prosthetics
	name = "Prosthetics"
	desc = "Hello, I'm Regular Debug Text in Orbstation."
	icon = "flask"
	value = -3
	medical_record_text = "Hello, I'm Regular Debug Text in Orbstation."
	hardcore_value = 3
	var/prosarmL
	var/prosarmR
	var/proslegL
	var/proslegR

/datum/quirk/prosthetics/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	prosarmL = prosarmL || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/arm/L)
	prosarmR = prosarmR || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/arm/R)
	proslegL = proslegL || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/leg/L)
	proslegR = proslegR || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/leg/R)
	//cant fucking believe this works at all how did this happen
	switch(prosarmL)
		if("robot")
			prosarmL = new /obj/item/bodypart/arm/left/robot
			human_holder.del_and_replace_bodypart(prosarmL)
		if("surplus")
			prosarmL = new /obj/item/bodypart/arm/left/robot/surplus
			human_holder.del_and_replace_bodypart(prosarmL)
	switch(prosarmR)
		if("robot")
			prosarmR = new /obj/item/bodypart/arm/right/robot
			human_holder.del_and_replace_bodypart(prosarmR)
		if("surplus")
			prosarmR = new /obj/item/bodypart/arm/right/robot/surplus
			human_holder.del_and_replace_bodypart(prosarmR)
	switch(proslegL)
		if("robot")
			proslegL = new /obj/item/bodypart/leg/left/robot
			human_holder.del_and_replace_bodypart(proslegL)
		if("surplus")
			proslegL = new /obj/item/bodypart/leg/left/robot/surplus
			human_holder.del_and_replace_bodypart(proslegL)
		if("digitigrade")
			proslegL = new /obj/item/bodypart/leg/left/robot/digitigrade
			human_holder.del_and_replace_bodypart(proslegL)
	switch(proslegR)
		if("robot")
			proslegR = new /obj/item/bodypart/leg/right/robot
			human_holder.del_and_replace_bodypart(proslegR)
		if("surplus")
			proslegR = new /obj/item/bodypart/leg/right/robot/surplus
			human_holder.del_and_replace_bodypart(proslegR)
		if("digitigrade")
			proslegR = new /obj/item/bodypart/leg/right/robot/digitigrade
			human_holder.del_and_replace_bodypart(proslegR)

	//for some FREAKING reason it doesnt replace limbs if you are readied at roundstart
	//i dont know why. it doesnt break for the regular prosthetic limbs quirk..
	//maybe it will fix itself when this shit is finally decoupled from the quirk


/datum/quirk/prosthetic_limb/post_add()
	to_chat(quirk_holder, span_boldannounce("Hello, I'm Regular Debug Text in Orbstation."))
