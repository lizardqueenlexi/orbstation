// changing examine text so that you know that the brain will not work, further implimentation is inside of ai_core.drm, robot_parts.dm, and transformer.dm
/obj/item/brain_processor/organic/examine(mob/user)
	. = ..()
	if(brainmob && HAS_TRAIT(brain, TRAIT_XCARD_BORG_IMMUNE))
		. += span_notice("This brain is not compatible with cyborg technology.")

/obj/item/organ/brain/examine(mob/user)
	. = ..()
	if(HAS_TRAIT(src, TRAIT_XCARD_BORG_IMMUNE))
		. += span_notice("This brain is not compatible with cyborg technology.")


