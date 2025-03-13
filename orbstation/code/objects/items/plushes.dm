// Parent type for "crew member" plushies.
/obj/item/toy/plush/crew
	name = "crew plush"
	desc = "A peculiar plush supposedly depicting a member of Orbstation's crew. How did you get this?"
	icon = 'orbstation/icons/obj/items/plushes.dmi'

// Breeding your co-workers is against server rules.
/obj/item/toy/plush/crew/plop(obj/item/toy/plush/Daddy)
	return FALSE

/obj/item/toy/plush/crew/felfyplushie
	name = "\improper Felfy plushie"
	desc = "A stuffed toy resembling cargo's favorite ratfolk, Able to say Erm in thirteen languages!"
	icon_state = "felfyplush"
	attack_verb_continuous = list("squeaks", "erms", "blushes")
	attack_verb_simple = list("squeak", "erm", "blush")
	gender = FEMALE

/obj/item/toy/plush/crew/pennyplushie
	name = "\improper Lady Penelope Dreadful plushie"
	desc = "A cuddly toy depicting the rare and famous catgirl Lady Penelope Dreadful, commissioned during an ill-fated merchandising attempt. It is of exceedingly poor quality, and appears to be full of ground-up fibreglass."
	icon_state = "pennyplush"
	attack_verb_continuous = list("ohohos", "bites", "treats")
	attack_verb_simple = list("ohoho", "bite", "treat")
	gender = FEMALE
	/// Chance to release microfilaments on interaction
	var/asbestos_hug_chance = 5
	/// Chance to release microfilaments on impact
	var/asbestos_hurl_chance = 20

/obj/item/toy/plush/crew/pennyplushie/attack_self(mob/user)
	. = ..()
	if (!prob(asbestos_hug_chance))
		return
	release_asbestos()

/obj/item/toy/plush/crew/pennyplushie/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if (!prob(asbestos_hurl_chance))
		return
	release_asbestos()

/// Share penny's special treat
/obj/item/toy/plush/crew/pennyplushie/proc/release_asbestos()
	visible_message(span_warning("[src] releases a cloud of asbestos fibres!"))
	var/datum/effect_system/fluid_spread/smoke/bad/asbestos/smoke = new
	smoke.set_up(1, holder = src, location = src)
	smoke.start()

/// Penny's asbestos cloud spawner
/datum/effect_system/fluid_spread/smoke/bad/asbestos
	effect_type = /obj/effect/particle_effect/fluid/smoke/bad/asbestos

/// Penny's asbestos cloud
/obj/effect/particle_effect/fluid/smoke/bad/asbestos
	lifetime = 6 SECONDS
	color = COLOR_OFF_WHITE

/// Admin-only Penny plushie. Not to be abused.
/obj/item/toy/plush/crew/pennyplushie/premium
	name = "\improper Legendary Lady Penelope Dreadful plushie"
	desc = "A one-of-a-kind, highly collectible plushie of everyone's favorite catgirl, stuffed not only with asbestos fibers but \
		solid gold as well. Extremely heavy."
	hitsound = 'sound/items/weapons/blastcannon.ogg'
	force = 50
	throwforce = 50
	resistance_flags = INDESTRUCTIBLE
	item_flags = SLOWS_WHILE_IN_HAND
	slowdown = 2
	custom_price = 9999999
	custom_premium_price = 9999999
	throw_speed = 1
	squeak_override = list('sound/effects/grillehit.ogg' = 1)

/obj/item/toy/plush/crew/pennyplushie/premium/Initialize(mapload)
	. = ..()
	src.add_filter("rayorbs", 5, list("type" = "rays", "color" = "#e4c30b", "size" = 30, "density" = 20, "y" = -5))
	animate(get_filter("rayorbs"), offset = 10, time = 3 SECONDS, loop = -1)

/// If the plushie is cut open, a massive pile of gold comes out.
/obj/item/toy/plush/crew/pennyplushie/premium/attackby(obj/item/I, mob/living/user, params)
	var/was_stuffed = stuffed
	. = ..()
	if(!was_stuffed || stuffed)
		return
	user.visible_message(span_warning("A massive pile of gold spills out of the plushie!"))
	for(var/i in 1 to 3)
		var/obj/item/stack/sheet/mineral/gold/gold_stack = new /obj/item/stack/sheet/mineral/gold(drop_location())
		gold_stack.amount = 50
	force = 0
	throwforce = 0
	item_flags = NONE
	hitsound = 'sound/items/toy_squeak/toysqueak1.ogg'

/obj/item/toy/plush/crew/fishplushie
	name = "\improper Fish plushie"
	desc = "A fuzzy toy of Research's most scrungled roboticist, Fish. Matching Chip plushie coming soon!"
	icon_state = "fishplush"
	attack_verb_continuous = list("bites", "squeaks", "spins")
	attack_verb_simple = list("bite", "squeak", "spin")
	squeak_override = list('sound/items/weapons/laser.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/crew/ivonaplushie
	name = "\improper Ivona plushie"
	desc = "A plushed toy of mining's largest reptile, Ivona. Somehow smells just like the ash and brimstone of Lavaland."
	icon_state = "ivonaplush"
	attack_verb_continuous = list("growls", "chomps", "slashes")
	attack_verb_simple = list("growl", "chomp", "slash")
	squeak_override = list('sound/items/weapons/kinetic_accel.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/crew/glupplushie
	name = "\improper Glup Shitto Doll"
	desc = "Multitudes of this likeness of famous actor Glup Shitto were made, only for the film to be cancelled mid-shoot. \
		To this date, Glup Shitto has never appeared on the big screen as the Head of Personnel."
	icon_state = "glupplush"
	gender = FEMALE

/obj/item/toy/plush/crew/nancyplushie
	name = "\improper Cuddle-me Nancy"
	desc = "Part of a line of toys based on real doctors, designed to put anxious patients at ease. \
		This model was quietly removed from circulation without explanation, but one seems to have ended up here."
	icon_state = "nancyplush"
	attack_verb_continuous = list("bump~s", "thump~s", "stings")
	attack_verb_simple = list("bump~", "thump~", "sting")
	gender = FEMALE
	/// Are we currently changing shape?
	var/transforming = FALSE
	/// Whose DNA have we got stored?
	var/list/absorbed_dna = list("Nancy")
	/// Who has DNA? Note: This is a naive check, fish fingers and fishing rods will contain the DNA of Fish
	var/static/list/plushie_dna = list(
		"Felfy" = /obj/item/toy/plush/crew/felfyplushie,
		"Fish" = /obj/item/toy/plush/crew/fishplushie,
		"Glup" = /obj/item/toy/plush/crew/glupplushie,
		"Ivona" = /obj/item/toy/plush/crew/ivonaplushie,
		"Penelope" = /obj/item/toy/plush/crew/pennyplushie,
	)

// Absorb DNA Sting
/obj/item/toy/plush/crew/nancyplushie/interact_with_atom(atom/target, mob/user, list/modifiers)
	var/matched_name
	for (var/blorbo in plushie_dna)
		if (findtext(target.name, blorbo))
			matched_name = blorbo
			break
	if (!matched_name || (matched_name in absorbed_dna))
		return
	balloon_alert_to_viewers("giggle~")
	absorbed_dna |= matched_name
	flick("nancyflash", src)
	return ITEM_INTERACT_SUCCESS

// Transform
/obj/item/toy/plush/crew/nancyplushie/attack_self(mob/user)
	. = ..()
	if (transforming || length(absorbed_dna) < 2)
		return
	var/list/options = list()
	for (var/name in absorbed_dna)
		var/datum/radial_menu_choice/choice = new()
		choice.name = name
		if (name in plushie_dna)
			var/atom/plush_type = plushie_dna[name]
			choice.image = image(icon = initial(plush_type.icon), icon_state = initial(plush_type.icon_state))
		else
			choice.image = image(icon = initial(icon), icon_state = initial(icon_state))
		options += list("[choice.name]" = choice)

	var/picked_blorbo = show_radial_menu(user, user, options, require_near = TRUE)
	if (!picked_blorbo)
		return TRUE
	transforming = TRUE
	user.dropItemToGround(src)
	balloon_alert_to_viewers("giggle~")
	Shake()
	addtimer(CALLBACK(src, PROC_REF(changeling_transform), picked_blorbo), 2.5 SECONDS, TIMER_DELETE_ME)
	return TRUE

/// Become someone else
/obj/item/toy/plush/crew/nancyplushie/proc/changeling_transform(picked_blorbo)
	playsound(src, 'sound/effects/cartoon_sfx/cartoon_pop.ogg', 100, vary = TRUE)
	transforming = FALSE
	if (picked_blorbo in plushie_dna)
		var/atom/plush_type = plushie_dna[picked_blorbo]
		name = initial(plush_type.name)
		desc = initial(plush_type.desc)
		icon = initial(plush_type.icon)
		icon_state = initial(plush_type.icon_state)
		return

	name = initial(name)
	desc = initial(desc)
	icon = initial(icon)
	icon_state = initial(icon_state)
	return

/obj/item/toy/plush/amoungplushie
	name = "amoung plushie"
	desc = "A cuddly toy depicting the dangerous and rare alien species, the Amoung. Seems kinda sus."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "amoungplush"
	attack_verb_continuous = list("suses", "stabs", "ejects")
	attack_verb_simple = list("sus", "stab", "eject")
	squeak_override = list('sound/mobs/non-humanoids/alien/alien_organ_cut.ogg' = 1)

/obj/item/toy/plush/tbhplushie
	name = "tbh plushie"
	desc = "A cuddly critter plushie. Its wide-eyed stare gives you a warm fuzzy feeling."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "tbhplush"
	attack_verb_continuous = list("yippees", "stares", "paws")
	attack_verb_simple = list("yippee", "stare", "paw")
	squeak_override = list('orbstation/sound/tbh_yippee.ogg' = 1)

/obj/item/toy/plush/milkinz
	name = "milkinz"
	desc = "A milk-soaked cat plushie. Its sad eyes bore into you despite its crusty exterior."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "milkinz"
	force = 5
	throwforce = 5
	attack_verb_continuous = list("squelches", "slaps", "slops")
	attack_verb_simple = list("squelch", "slap", "slop")
	squeak_override = list('sound/misc/splort.ogg' = 1)
