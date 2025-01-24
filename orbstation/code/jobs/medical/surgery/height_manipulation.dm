//Surgery to change your height. Yes, this is silly.

/datum/surgery/advanced/height_manipulation
	name = "Height manipulation"
	desc = "An ill-advised cosmetic procedure that lengthens or shortens the spine, allowing the patient's height to be changed."
	surgery_flags = SURGERY_REQUIRE_RESTING | SURGERY_REQUIRE_LIMB | SURGERY_REQUIRES_REAL_LIMB
	possible_locs = list(BODY_ZONE_CHEST)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/saw,
		/datum/surgery_step/manipulate_spine,
		/datum/surgery_step/repair_spine,
		/datum/surgery_step/close,
	)

/datum/surgery_step/manipulate_spine
	name = "lengthen spine (bonesetter) / shorten spine (saw)"
	repeatable = TRUE
	implements = list(
		/obj/item/bonesetter = 100,
		/obj/item/crowbar/power = 50,
		/obj/item/crowbar = 20,
	)
	time = 4 SECONDS
	var/current_type
	var/implements_shorten = list(
		/obj/item/circular_saw = 100,
		/obj/item/melee/arm_blade = 75,
		/obj/item/fireaxe = 50,
		/obj/item/hatchet = 35,
		/obj/item/knife/butcher = 25,
	)
	preop_sound = list(
		/obj/item/bonesetter = 'sound/items/handling/surgery/organ2.ogg',
		/obj/item/crowbar/power = 'sound/items/tools/jaws_pry.ogg',
		/obj/item/crowbar = 'sound/items/tools/ratchet.ogg',
		/obj/item/circular_saw = 'sound/items/handling/surgery/saw.ogg',
		/obj/item/melee/arm_blade = 'sound/items/weapons/bladeslice.ogg',
		/obj/item/fireaxe = 'sound/items/weapons/bladeslice.ogg',
		/obj/item/hatchet = 'sound/items/weapons/bladeslice.ogg',
		/obj/item/knife/butcher = 'sound/items/weapons/bladeslice.ogg',
	)
	success_sound = 'sound/items/handling/surgery/organ1.ogg'

/datum/surgery_step/manipulate_spine/New()
	..()
	implements = implements + implements_shorten

/datum/surgery_step/manipulate_spine/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/mob/living/carbon/human/human_target = target
	if(!istype(human_target)) //just in case...
		return SURGERY_STEP_FAIL
	if(implement_type in implements_shorten)
		current_type = "shorten"
		if(human_target.mob_height <= HUMAN_HEIGHT_SHORTEST)
			to_chat(user, span_warning("You don't think you can make [target] any shorter..."))
			return SURGERY_STEP_FAIL
		display_results(
			user,
			target,
			span_notice("You begin to cut away excess bone in [target]'s spine..."),
			span_notice("[user] begins to cut away excess bone in [target]'s spine with [tool]."),
			span_notice("[user] begins to cut away excess bone in [target]'s spine."),
		)
		display_pain(target, "Your [parse_zone(user.zone_selected)] aches with pain!")
	else
		current_type = "lengthen"
		if(human_target.mob_height >= HUMAN_HEIGHT_TALLEST)
			to_chat(user, span_warning("You don't think you can make [target] any taller..."))
			return SURGERY_STEP_FAIL
		display_results(
			user,
			target,
			span_notice("You begin to stretch out [target]'s spine..."),
			span_notice("[user] begins to stretch out [target]'s spine with [tool]."),
			span_notice("[user] begins to stretch out [target]'s spine."),
		)
		display_pain(target, "You can feel your spine being stretched out!")

/datum/surgery_step/manipulate_spine/success(mob/living/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/mob/living/carbon/human/human_target = target
	if(current_type == "lengthen")
		display_results(
			user,
			target,
			span_notice("You lengthen [target]'s spine."),
			span_notice("[user] lengthens [target]'s spine!"),
			span_notice("[user] lengthens [target]'s spine!"),
		)
		human_target.set_mob_height(human_target.mob_height+2) //each height is 2 values apart, so this raises height by one step
	else if(current_type == "shorten")
		display_results(
			user,
			target,
			span_notice("You shorten [target]'s spine."),
			span_notice("[user] shortens [target]'s spine!"),
			span_notice("[user] shortens [target]'s spine!"),
		)
		human_target.set_mob_height(human_target.mob_height-2)
	return ..()

/datum/surgery_step/manipulate_spine/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	..()
	target.apply_damage(20, BRUTE, "[target_zone]", wound_bonus=10)
	display_pain(target, "It feels like something just broke in your [parse_zone(target_zone)]!")

/datum/surgery_step/repair_spine
	name = "repair spine (bone gel)"
	implements = list(
		/obj/item/stack/medical/bone_gel = 100,
		/obj/item/stack/sticky_tape/surgical = 70,
		/obj/item/stack/sticky_tape/super = 30,
		/obj/item/stack/sticky_tape = 10)
	time = 40

/datum/surgery_step/repair_spine/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(
		user,
		target,
		span_notice("You begin to mend the bone in [target]'s [parse_zone(user.zone_selected)]..."),
		span_notice("[user] begins to mend the bone in [target]'s [parse_zone(user.zone_selected)] with [tool]."),
		span_notice("[user] begins to mend the bone in [target]'s [parse_zone(user.zone_selected)]."),
	)
	display_pain(target, "Your [parse_zone(user.zone_selected)] aches with pain!")

/datum/surgery_step/repair_spine/success(mob/living/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	if(isstack(tool))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)
	display_results(
		user,
		target,
		span_notice("You successfully mend the bone in [target]'s [parse_zone(target_zone)]."),
		span_notice("[user] successfully mends the bone in [target]'s [parse_zone(target_zone)] with [tool]!"),
		span_notice("[user] successfully mends the bone in [target]'s [parse_zone(target_zone)]!"),
	)
	return ..()

/datum/surgery_step/repair_spine/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/surgery/surgery, fail_prob = 0)
	..()
	if(isstack(tool))
		var/obj/item/stack/used_stack = tool
		used_stack.use(1)

// Allow it to be researched
/datum/design/surgery/height_manipulation
	name = "Height Manipulation"
	desc = "An ill-advised cosmetic procedure that lengthens or shortens the spine, allowing the patient's height to be changed."
	id = "surgery_height_manip"
	surgery = /datum/surgery/advanced/height_manipulation
	research_icon_state = "surgery_chest"

/datum/techweb_node/adv_surgery
	orb_design_ids = list(
		"surgery_height_manip"
	)
