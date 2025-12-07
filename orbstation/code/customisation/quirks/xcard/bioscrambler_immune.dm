//alternative nasty effects for the Bioscrambler Anomaly, for use in the x-card quirk and in species unsuitable for limb-swapping
/mob/living/carbon/proc/alt_swap()
	var/bad_effect = rand(1,3)
	var/zones
	var/picked_zone
	var/obj/item/bodypart/picked_part
	switch(bad_effect)
		if(1) //dismember random limb
			zones = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = get_bodypart(picked_zone)
			if(picked_part)
				visible_message(span_danger("[src]'s [picked_part.plaintext_zone] violently rips from [src.p_their()] body!"), span_userdanger("Your [picked_part.plaintext_zone] violently rips from your body!"))
				picked_part.dismember()
		if(2) //break random bone
			zones = list(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
			picked_zone = pick(zones)
			picked_part = get_bodypart(picked_zone)
			if(picked_part)
				to_chat(src, span_userdanger("Your [picked_part.plaintext_zone] begins resonating violently!"))
				var/type_wound = pick(list(/datum/wound/blunt/bone/critical, /datum/wound/blunt/bone/severe, /datum/wound/blunt/bone/moderate))
				picked_part.force_wound_upwards(type_wound)
		if(3) //deal toxin damage and cause temporary sickness
			to_chat(src, span_userdanger("Your stomach churns as your body twists unnaturally!"))
			vomit()
			adjust_tox_loss(20)
			set_eye_blur_if_lower(20 SECONDS)
			set_timed_status_effect(10 SECONDS, /datum/status_effect/dizziness)
