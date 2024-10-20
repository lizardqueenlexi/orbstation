/**
 * Friendlier smite, pop off someone's limb and make it attack them.
 * It's not VERY friendly.
 */
/datum/action/cooldown/spell/touch/animate_limb
	name = "Animate Limb"
	desc = "This spell charges your hand with an unholy energy \
		that can be used to cause a touched victim's limb to turn on them."
	button_icon_state = "void_magnet"
	sound = 'sound/effects/magic/disintegrate.ogg'

	school = SCHOOL_EVOCATION
	cooldown_time = 30 SECONDS
	cooldown_reduction_per_rank = 6 SECONDS
	hand_path = /obj/item/melee/touch_attack/animate_limb

/datum/action/cooldown/spell/touch/animate_limb/cast_on_hand_hit(obj/item/melee/touch_attack/hand, atom/victim, mob/living/carbon/caster)
	if (!iscarbon(victim))
		caster.balloon_alert(caster, "invalid target")
		return FALSE

	var/mob/living/carbon/limb_enjoyer = victim
	if (limb_enjoyer.can_block_magic(antimagic_flags))
		caster.visible_message(
			span_warning("The feedback blows [caster]'s arm off!"),
			span_userdanger("The spell bounces from [limb_enjoyer]'s skin back into your arm!"),)
		caster.flash_act()
		var/obj/item/bodypart/to_dismember = caster.get_holding_bodypart_of_item(hand)
		to_dismember?.dismember()
		to_dismember?.animate_atom_living(limb_enjoyer)
		return TRUE

	var/list/parts = list()
	for (var/obj/item/bodypart/to_remove as anything in limb_enjoyer.bodyparts)
		if (to_remove.body_zone == BODY_ZONE_HEAD || to_remove.body_zone == BODY_ZONE_CHEST)
			continue
		if (to_remove.bodypart_flags & BODYPART_UNREMOVABLE)
			continue
		parts += to_remove
	if (!length(parts))
		caster.balloon_alert(caster, "no limbs!")
		return

	var/obj/item/bodypart/to_remove = pick(parts)
	to_remove.dismember()
	to_remove.animate_atom_living(caster)
	to_remove.visible_message(span_warning("[victim]'s [to_remove] falls to the ground... and then rears up to attack!"))
	return TRUE

/obj/item/melee/touch_attack/animate_limb
	name = "\improper reanimating touch"
	desc = "This hand of mine glows with a fiendish power!"
	icon_state = "disintegrate"
	inhand_icon_state = "disintegrate"
