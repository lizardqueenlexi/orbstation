/**
 * shuffle_decay(): called by table shuffle code to optionally decay an item.
 *  This should be called after the item has been moved to its final destination.
 * returns: an item replacing this, null to delete, or the percent consumed (0-100)
 */
/obj/item/proc/shuffle_decay()
	return 0 // no action

// Todo: generate dirt based on certain food types, more mutations and decays


/// food/shuffle_decay: Generate trash, if any
/obj/item/food/shuffle_decay()
	if(ispath(trash_type))
		SStable_shuffle.extra_dirt(pick(/obj/effect/decal/cleanable/ants,/obj/effect/decal/cleanable/dirt),loc)
		return new trash_type(loc)
	return 0

/// match/shuffle_decay: burn out
/obj/item/match/shuffle_decay()
	lit = 1
	matchburnout()
	SStable_shuffle.extra_dirt(/obj/effect/decal/cleanable/ash,loc)
	return 100

/// cigarette/shuffle_decay: leave behind butt
/obj/item/clothing/mask/cigarette/shuffle_decay()
	if(ispath(type_butt))
		SStable_shuffle.extra_dirt(/obj/effect/decal/cleanable/ash,loc)
		return new type_butt(loc)
	return 0

/// cup/glass/shuffle_decay(): drink a percentage
/obj/item/reagent_containers/cup/glass/shuffle_decay()
	if(reagents?.total_volume)
		var/removal_pct = pick(0.25,0.5,0.5,0.5,0.75,1,1,1)
		reagents.remove_all(removal_pct * reagents.total_volume)
		update_icon()
		return 100 * removal_pct
	return 0

/// pill/shuffle_decay(): get swallowed (or patched, since patches are pills)
/obj/item/reagent_containers/pill/shuffle_decay()
	return null // delete me

/// soda_cans/shuffle_decay(): get drunk and optionally can-crushed
/obj/item/reagent_containers/cup/soda_cans/shuffle_decay()
	if(reagents?.total_volume)
		var/removal_pct = pick(0.25,0.5,0.5,0.5,0.75,1,1,1)

		// Crush de can
		if(removal_pct == 1 && prob(SStable_shuffle.prob_max))
			var/obj/item/trash/can/crushed_can = new /obj/item/trash/can(loc)
			crushed_can.icon_state = icon_state
			return crushed_can

		// Soh-dah
		reagents.flags |= OPENCONTAINER
		spillable = TRUE
		reagents.remove_all(removal_pct * reagents.total_volume)
		return 100 * removal_pct
	return 0

/// condiment/pack/shuffle_decay(): single use item gets consumed
/obj/item/reagent_containers/condiment/pack/shuffle_decay()
	reagents?.remove_all()
	return 100

/// condiment/shuffle_decay(): detect if we are salt/pepper and if so, lose some
/obj/item/reagent_containers/condiment/shuffle_decay()
	if(reagents?.total_volume && amount_per_transfer_from_this == 1) // should just be salt/pepper, not milk/flour etc
		var/removal_pct = rand(1,20) / 100
		reagents.remove_all(removal_pct * reagents.total_volume)
		return removal_pct * 100
	return 0
