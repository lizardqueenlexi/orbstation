/**
 * Traitor Chaplain item.
 * Use it on someone then retreat to your base and do a magic spell which 'curses' them.
 * Reusable but only once per person.
 */
/obj/item/cursed_tome
	name = "cursed tome"
	desc = "It awaits an owner."
	icon = 'icons/obj/storage/book.dmi'
	icon_state = "tome"
	inhand_icon_state = "holybook"
	worn_icon_state = "bible"
	lefthand_file = 'icons/mob/inhands/items/books_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/books_righthand.dmi'
	/// Owner of the tome
	var/datum/weakref/weak_owner
	/// Current target
	var/datum/weakref/current_target
	/// List of people we have already marked or cursed
	var/list/past_targets = list()
	/// Block spam clicks
	var/drawing_rune = FALSE

// Attach an owner
/obj/item/cursed_tome/attack_self(mob/user, modifiers)
	if (weak_owner)
		return ..()

	to_chat(user, span_revenwarning("You loose a drop of blood onto the first page, and feel a connection form. The tome disguises itself as a more ordinary text."))
	name = "holy book"
	icon_state = "holybook"
	inhand_icon_state = "holybook"
	desc = "Apply to head repeatedly."
	update_appearance()
	weak_owner = WEAKREF(user)

/obj/item/cursed_tome/examine(mob/user)
	var/mob/living/owner = weak_owner?.resolve()
	if (owner && owner == user)
		return list("Use this unholy text on a living being to mark their soul, or on the ground to scribe a rune which will place a curse upon marked victims.")
	return ..()

// Don't notify the person we touched yet.
/obj/item/cursed_tome/attack(mob/living/target_mob, mob/living/user, params)
	if (target_mob == user)
		user.balloon_alert(user, "bad idea")
		return
	if (!iscarbon(target_mob))
		user.balloon_alert(user, "beneath your notice!")
		return
	var/datum/weakref/weak_reference = WEAKREF(target_mob)
	if (past_targets[weak_reference])
		user.balloon_alert(user, "already cursed!")
		return
	if (weak_reference == current_target)
		user.balloon_alert(user, "already marked!")
		return
	user.balloon_alert(user, "marking [target_mob]...")
	if (!do_after(user, 2 SECONDS, target = target_mob))
		user.balloon_alert(user, "interrupted!")
		return

	user.balloon_alert(user, "marked [target_mob]!")
	current_target = weak_reference

/obj/item/cursed_tome/afterattack(turf/target_turf, mob/user, proximity, params)
	. = ..()
	if (!isturf(target_turf) || !proximity)
		return
	var/mob/living/owner = weak_owner?.resolve()
	if (owner != user)
		return
	var/mob/living/target = current_target?.resolve()
	if (!target)
		user.balloon_alert(user, "no target!")
		return COMPONENT_CANCEL_ATTACK_CHAIN
	if (drawing_rune)
		user.balloon_alert(user, "already busy!")
		return COMPONENT_CANCEL_ATTACK_CHAIN

	draw_rune(user, target_turf)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/obj/item/cursed_tome/proc/draw_rune(mob/user, turf/target_turf)
	user.visible_message(span_notice("[user] starts mumbling and waving their arms over the ground!"))
	drawing_rune = TRUE
	user.balloon_alert(user, "drawing rune...")
	if (!do_after(user, 3 SECONDS, target_turf))
		user.balloon_alert(user, "interrupted!")
		drawing_rune = FALSE
		return FALSE

	user.balloon_alert(user, "rune complete")
	playsound(src, 'sound/magic/enter_blood.ogg', 100, FALSE)
	drawing_rune = FALSE
	new /obj/effect/curse_rune(target_turf, src, current_target)
	current_target = null

/// Where the magic happens
/obj/effect/curse_rune
	name = "curse rune"
	desc = "An odd collection of symbols drawn in what seems to be blood."
	anchored = TRUE
	icon = 'icons/obj/antags/cult/rune.dmi'
	icon_state = "1"
	interaction_flags_atom = INTERACT_ATOM_ATTACK_HAND
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = SIGIL_LAYER
	color = RUNE_COLOR_RED
	/// Tome which created this rune
	var/datum/weakref/tome_ref
	/// Person who we're casting a spell on
	var/datum/weakref/target_ref
	/// Stops spam clicking
	var/is_in_use = FALSE

/obj/effect/curse_rune/Initialize(mapload, obj/item/cursed_tome/tome, datum/weakref/target)
	. = ..()
	tome_ref = WEAKREF(tome)
	target_ref = target

/obj/effect/curse_rune/can_interact(mob/living/user)
	. = ..()
	if(!.)
		return
	if(is_in_use)
		return FALSE

/obj/effect/curse_rune/interact(mob/living/user)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(inflict_curse), user)
	return TRUE

/obj/effect/curse_rune/proc/inflict_curse(mob/living/caster)
	var/mob/living/carbon/target = target_ref?.resolve()
	if (!target)
		visible_message(span_revennotice("The rune fizzles and fades."))
		deplete_rune()
		return

	caster.visible_message(span_revenwarning("[caster] begins an eldritch chant!"))
	if (!do_after(caster, 5 SECONDS, target = src, interaction_key = "curse rune casting"))
		caster.balloon_alert(caster, "interrupted!")
		return

	var/obj/item/cursed_tome/tome = tome_ref?.resolve()
	if (tome)
		tome.current_target = null
		if (tome.past_targets[target_ref])
			visible_message(span_revennotice("The rune fizzles and fades."))
			deplete_rune()
			return
		tome.past_targets[target_ref] = TRUE

	visible_message(span_revenwarning("[src] flares with light! You feel a malicious force rush past you..."))
	playsound(get_turf(src), 'sound/effects/ghost.ogg', 100, TRUE)

	if (!QDELETED(target))
		var/random_curse = pick(GLOB.orb_mysterious_brain_traumas)
		var/resilience = prob(70) ? TRAUMA_RESILIENCE_SURGERY : TRAUMA_RESILIENCE_LOBOTOMY
		to_chat(target, span_revendanger("A chill runs down your spine!"))
		target.gain_trauma(random_curse, resilience)
		playsound(get_turf(target), 'sound/effects/ghost.ogg', 100, TRUE)

	deplete_rune()

/obj/effect/curse_rune/proc/deplete_rune()
	new /obj/effect/curse_rune_expended(get_turf(src))
	qdel(src)

/obj/effect/curse_rune_expended
	name = "depleted rune"
	desc = "The leftovers of some unwholesome occult ritual."
	anchored = TRUE
	icon = 'icons/obj/antags/cult/rune.dmi'
	icon_state = "1"
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	layer = SIGIL_LAYER
	color = RUNE_COLOR_DARKRED
	alpha = 125

/// You should probably be able to buy it
/datum/uplink_item/role_restricted/cursed_tome
	name = "Cursed Tome"
	desc = "An ancient grimoire holding forbidden supernatural rituals. \
		The book can place a mark on someone's soul, enabling its bearer to perform a ritual which will scar their essence in unpredictable ways. \
		Beware, for the spirits are capricious and their effect on your victims can sometimes be helpful rather than harmful."
	item = /obj/item/cursed_tome
	cost = 6
	restricted_roles = list(JOB_CHAPLAIN, JOB_CURATOR)
	surplus = 5
