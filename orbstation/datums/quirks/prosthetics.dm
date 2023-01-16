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
	prosarmL = prosarmL || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/armL)
	prosarmR = prosarmR || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/armR)
	proslegL = proslegL || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/legL)
	proslegR = proslegR || quirk_holder.client?.prefs?.read_preference(/datum/preference/choiced/limb/legR)
	//cant fucking believe this works at all how did this happen
	switch(prosarmL)
		if("robot")
			prosarmL = new /obj/item/bodypart/arm/left/robot
		if("surplus")
			prosarmL = new /obj/item/bodypart/arm/left/robot/surplus
	switch(prosarmR)
		if("robot")
			prosarmR = new /obj/item/bodypart/arm/right/robot
		if("surplus")
			prosarmR = new /obj/item/bodypart/arm/right/robot/surplus
	switch(proslegL)
		if("robot")
			proslegL = new /obj/item/bodypart/leg/left/robot
		if("surplus")
			proslegL = new /obj/item/bodypart/leg/left/robot/surplus
		if("digitigrade")
			proslegL = new /obj/item/bodypart/leg/left/robot/digitigrade
	switch(proslegR)
		if("robot")
			proslegR = new /obj/item/bodypart/leg/right/robot
		if("surplus")
			proslegR = new /obj/item/bodypart/leg/right/robot/surplus
		if("digitigrade")
			proslegR = new /obj/item/bodypart/leg/right/robot/digitigrade
	human_holder.del_and_replace_bodypart(prosarmL)
	human_holder.del_and_replace_bodypart(prosarmR)
	human_holder.del_and_replace_bodypart(proslegL)
	human_holder.del_and_replace_bodypart(proslegR)
	//for some FREAKING reason it doesnt seem to call the above 4 lines if you are readied at roundstart
	//i dont know why. it doesnt break for the regular prosthetic limbs quirk..
	//maybe it will fix itself when this shit is finally decoupled from the quirk


/datum/quirk/prosthetic_limb/post_add()
	to_chat(quirk_holder, span_boldannounce("Hello, I'm Regular Debug Text in Orbstation."))
