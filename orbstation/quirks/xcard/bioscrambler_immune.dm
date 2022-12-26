//alternative nasty effects for the Bioscrambler Anomaly, for use in the x-card quirk and in species unsuitable for limb-swapping
/obj/effect/anomaly/bioscrambler/proc/alt_swap(mob/living/carbon/human/victim)
	var/bad_effect = rand(1,3)
	var/zones
	var/picked_zone
	var/obj/item/bodypart/picked_part
	switch(bad_effect)
		if(1) //dismember random limb
			zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = victim.get_bodypart(picked_zone)
			if(picked_part)
				victim.visible_message(span_danger("[victim]'s [picked_part.plaintext_zone] violently rips from [victim.p_their()] body, disintegrating in a shower of blood!"), span_userdanger("Your [picked_part.plaintext_zone] violently rips from your body, disintegrating in a shower of blood!"))
				picked_part.dismember()
				qdel(picked_part)
		if(2) //break random bone
			zones = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = victim.get_bodypart(picked_zone)
			if(picked_part)
				to_chat(victim, span_userdanger("Your [picked_part.plaintext_zone] begins resonating violently!"))
				var/type_wound = pick(list(/datum/wound/blunt/critical, /datum/wound/blunt/severe, /datum/wound/blunt/moderate))
				picked_part.force_wound_upwards(type_wound)
		if(3) //deal toxin damage and cause temporary sickness
			to_chat(victim, span_userdanger("Your stomach churns as your body twists unnaturally!"))
			victim.vomit()
			victim.adjustToxLoss(30)
			victim.set_eye_blur_if_lower(40 SECONDS)
			victim.set_timed_status_effect(10 SECONDS, /datum/status_effect/dizziness)

//and the same thing again, for the bioscrambler armor. yes, the code is all copy-pasted there, too.
/obj/item/clothing/suit/armor/reactive/bioscrambling/proc/alt_swap(mob/living/carbon/human/victim)
	var/bad_effect = rand(1,3)
	var/zones
	var/picked_zone
	var/obj/item/bodypart/picked_part
	switch(bad_effect)
		if(1) //dismember random limb
			zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = victim.get_bodypart(picked_zone)
			if(picked_part)
				victim.visible_message(span_danger("[victim]'s [picked_part] violently rips from [victim.p_their()] body, disintegrating in a shower of blood!"), span_userdanger("Your [picked_part] violently rips from your body, disintegrating in a shower of blood!"))
				picked_part.dismember()
				qdel(picked_part)
		if(2) //break random bone
			zones = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = victim.get_bodypart(picked_zone)
			if(picked_part)
				to_chat(victim, span_userdanger("Your [picked_part] begins resonating violently!"))
				var/type_wound = pick(list(/datum/wound/blunt/critical, /datum/wound/blunt/severe, /datum/wound/blunt/moderate))
				picked_part.force_wound_upwards(type_wound)
		if(3) //deal toxin damage and cause temporary sickness
			to_chat(victim, span_userdanger("Your stomach churns as your body twists unnaturally!"))
			victim.vomit()
			victim.adjustToxLoss(30)
			victim.set_eye_blur_if_lower(40 SECONDS)
			victim.set_timed_status_effect(10 SECONDS, /datum/status_effect/dizziness)
	return
