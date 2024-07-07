// ORBSTATION CODE: FACEHUGGER XCARD //

/// Injects some nasty toxins into our victim -- used when the target has the xeno immunity x card option
/// target -- the target of the bite
/obj/item/clothing/mask/facehugger/proc/venomous_bite(mob/living/carbon/target)
	target.visible_message(span_danger("[src] bites [target]'s face, injecting acidic venom!"), \
		span_userdanger("[src] bites your face, injecting acidic venom!"), \
		span_userdanger("You feel [src] bite your face, injecting acidic venom!"))

	// initial bite damage
	target.reagents?.add_reagent(/datum/reagent/toxin/acid/, 7)
	target.reagents?.add_reagent(/datum/reagent/toxin/histamine/, 5)

	// lingering venom
	target.reagents?.add_reagent(/datum/reagent/toxin/xenotoxin, 10)
