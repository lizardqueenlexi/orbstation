/datum/quirk/pain_insensitivity
	name = "Pain Insensitivity"
	desc = "You can't feel pain at all. You have little sense of your own health, and have to manually check your injuries to tell whether you're hurt. You are also less perceptive of wounds and other injuries to yourself. On the bright side, being conscious for surgery doesn't bother you that much."
	icon = "heart-crack"
	value = -8
	mob_trait = TRAIT_NO_PAIN
	gain_text = "<span class='notice'>Your pains all fade away.</span>"
	lose_text = "<span class='danger'>You suddenly feel all of your aches and pains.</span>"
	medical_record_text = "Patient demonstrates a complete insensitivity to pain, and is likely to cause themselves injury - monitor suit sensors closely."

/mob/living/carbon/human/proc/manual_update_health_doll()
	if(!client || !hud_used)
		return
	if(!hud_used.healthdoll)
		return
	hud_used.healthdoll.cut_overlays()
	if(stat == DEAD)
		hud_used.healthdoll.icon_state = "healthdoll_DEAD"
		return

	hud_used.healthdoll.icon_state = "healthdoll_OVERLAY"
	for(var/obj/item/bodypart/body_part as anything in bodyparts)
		var/icon_num = 0

		if(SEND_SIGNAL(body_part, COMSIG_BODYPART_UPDATING_HEALTH_HUD, src) & COMPONENT_OVERRIDE_BODYPART_HEALTH_HUD)
			continue

		var/damage = body_part.burn_dam + body_part.brute_dam
		var/comparison = (body_part.max_damage/5)
		if(damage)
			icon_num = 1
		if(damage > (comparison))
			icon_num = 2
		if(damage > (comparison*2))
			icon_num = 3
		if(damage > (comparison*3))
			icon_num = 4
		if(damage > (comparison*4))
			icon_num = 5
		if(has_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy))
			icon_num = 0
		if(icon_num)
			hud_used.healthdoll.add_overlay(mutable_appearance('icons/hud/screen_gen.dmi', "[body_part.body_zone][icon_num]"))
	for(var/t in get_missing_limbs()) //Missing limbs
		hud_used.healthdoll.add_overlay(mutable_appearance('icons/hud/screen_gen.dmi', "[t]6"))
	for(var/t in get_disabled_limbs()) //Disabled limbs
		hud_used.healthdoll.add_overlay(mutable_appearance('icons/hud/screen_gen.dmi', "[t]7"))

//overrides the pain message for conscious surgery, and removes the chance of screaming
/datum/surgery_step/display_pain(mob/living/target, pain_message, mechanical_surgery = FALSE)
	if(target.stat < UNCONSCIOUS)
		if(!HAS_TRAIT(target, TRAIT_NO_PAIN))
			to_chat(target, span_userdanger(pain_message))
			if(prob(30) && !mechanical_surgery)
				target.emote("scream")
		else
			to_chat(target, span_warning(pain_message))

//overrides the normal handling for attacking with a severe or critical fracture
/datum/wound/blunt/attack_with_hurt_hand(mob/M, atom/target, proximity)
	SIGNAL_HANDLER

	if(victim.get_active_hand() != limb || !victim.combat_mode || !ismob(target) || severity <= WOUND_SEVERITY_MODERATE)
		return

	// With a severe or critical wound, you have a 15% or 30% chance to proc pain on hit
	if(prob((severity - 1) * 15))
		// And you have a 70% or 50% chance to actually land the blow, respectively
		if(prob(70 - 20 * (severity - 1)))
			if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
				to_chat(victim, span_userdanger("The fracture in your [limb.plaintext_zone] shoots with pain as you strike [target]!"))
			else
				to_chat(victim, span_warning("You hear an odd <i>crack</i> from your [limb.plaintext_zone] as you strike [target]."))
			limb.receive_damage(brute=rand(1,5))
		else
			if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
				victim.visible_message(span_danger("[victim] weakly strikes [target] with [victim.p_their()] broken [limb.plaintext_zone], recoiling from pain!"), \
				span_userdanger("You fail to strike [target] as the fracture in your [limb.plaintext_zone] lights up in unbearable pain!"), vision_distance=COMBAT_MESSAGE_RANGE)
				INVOKE_ASYNC(victim, /mob.proc/emote, "scream")
				victim.Stun(0.5 SECONDS)
			else
				victim.visible_message(span_danger("[victim] weakly strikes [target] with [victim.p_their()] broken [limb.plaintext_zone], not even noticing the pain..."), \
				span_warning("You fail to strike [target] as your [limb.plaintext_zone] goes limp with a loud <i>crack</i>. Hmm..."), vision_distance=COMBAT_MESSAGE_RANGE)
			limb.receive_damage(brute=rand(3,7))
			return COMPONENT_CANCEL_ATTACK_CHAIN

///Overrides the handling for snapping someone's limb back into place
/datum/wound/blunt/moderate/chiropractice(mob/living/carbon/human/user)
	var/time = base_treat_time

	if(!do_after(user, time, target=victim, extra_checks = CALLBACK(src, .proc/still_exists)))
		return

	if(prob(65))
		user.visible_message(span_danger("[user] snaps [victim]'s dislocated [limb.plaintext_zone] back into place!"), span_notice("You snap [victim]'s dislocated [limb.plaintext_zone] back into place!"), ignored_mobs=victim)
		to_chat(victim, span_userdanger("[user] snaps your dislocated [limb.plaintext_zone] back into place!"))
		if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
			victim.emote("scream")
		limb.receive_damage(brute=20, wound_bonus=CANT_WOUND)
		qdel(src)
	else
		if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
			user.visible_message(span_danger("[user] wrenches [victim]'s dislocated [limb.plaintext_zone] around painfully!"), span_danger("You wrench [victim]'s dislocated [limb.plaintext_zone] around painfully!"), ignored_mobs=victim)
			to_chat(victim, span_userdanger("[user] wrenches your dislocated [limb.plaintext_zone] around painfully!"))
		else
			user.visible_message(span_danger("[user] wrenches [victim]'s dislocated [limb.plaintext_zone] around!"), span_danger("You wrench [victim]'s dislocated [limb.plaintext_zone] around!"), ignored_mobs=victim)
			to_chat(victim, span_userdanger("[user] wrenches your dislocated [limb.plaintext_zone] around! It's not really that bad."))
		limb.receive_damage(brute=10, wound_bonus=CANT_WOUND)
		chiropractice(user)

///Overrides the handling for snapping someone's limb even further out of place
/datum/wound/blunt/moderate/malpractice(mob/living/carbon/human/user)
	var/time = base_treat_time

	if(!do_after(user, time, target=victim, extra_checks = CALLBACK(src, .proc/still_exists)))
		return

	if(prob(65))
		user.visible_message(span_danger("[user] snaps [victim]'s dislocated [limb.plaintext_zone] with a sickening crack!"), span_danger("You snap [victim]'s dislocated [limb.plaintext_zone] with a sickening crack!"), ignored_mobs=victim)
		to_chat(victim, span_userdanger("[user] snaps your dislocated [limb.plaintext_zone] with a sickening crack!"))
		if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
			victim.emote("scream")
		limb.receive_damage(brute=25, wound_bonus=30)
	else
		if(!HAS_TRAIT(victim, TRAIT_NO_PAIN))
			user.visible_message(span_danger("[user] wrenches [victim]'s dislocated [limb.plaintext_zone] around painfully!"), span_danger("You wrench [victim]'s dislocated [limb.plaintext_zone] around painfully!"), ignored_mobs=victim)
			to_chat(victim, span_userdanger("[user] wrenches your dislocated [limb.plaintext_zone] around painfully!"))
		else
			user.visible_message(span_danger("[user] wrenches [victim]'s dislocated [limb.plaintext_zone] around!"), span_danger("You wrench [victim]'s dislocated [limb.plaintext_zone] around!"), ignored_mobs=victim)
			to_chat(victim, span_userdanger("[user] wrenches your dislocated [limb.plaintext_zone] around! It's not really that bad."))
		limb.receive_damage(brute=10, wound_bonus=CANT_WOUND)
		malpractice(user)
