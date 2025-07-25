
/obj/item/buster_sword
	name = "colossal sword"
	desc = "Too big, too thick, too heavy, and too rough. This is more like a raw hunk of iron. Couldn't possibly be lifted by anyone."
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	icon_state = "buster_sword"
	w_class = WEIGHT_CLASS_HUGE
	drag_slowdown = 2
	tk_throw_range = 1
	tk_throw_range = 1
	throw_speed = 1
	drop_sound = 'sound/items/handling/tools/crowbar_drop.ogg'
	/// Damage to deal to someone this is dragged across
	force = 15
	throwforce = 15
	wound_bonus = 5
	exposed_wound_bonus = 10
	sharpness = SHARP_EDGED
	hitsound = 'sound/items/weapons/slice.ogg'
	mob_throw_hit_sound = 'sound/items/weapons/slice.ogg'
	/// Chance to destroy floor tiles while moving
	var/break_floor_chance = 15

/obj/item/buster_sword/equipped(mob/user, slot, initial)
	. = ..()
	balloon_alert(user, "too heavy!")
	user.dropItemToGround(src)

/obj/item/buster_sword/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change)
	. = ..()
	if (!isturf(old_loc) || !isturf(loc))
		return
	var/turf/left_tile = get_turf(old_loc)
	if (!isfloorturf(left_tile))
		return
	if (!has_gravity())
		return

	for (var/mob/living/crossed in loc)
		if (ishuman(crossed))
			if (crossed.body_position == LYING_DOWN)
				melee_attack_chain(pulledby, crossed)
			continue
		if (crossed.mob_size > MOB_SIZE_HUMAN)
			continue
		melee_attack_chain(pulledby, crossed)

	if (prob(100 - break_floor_chance))
		playsound(src, 'sound/effects/stonedoor_openclose.ogg', 25, vary = TRUE)
		return
	left_tile.break_tile()
	playsound(src, 'sound/items/electronic_assembly_empty.ogg', 25, vary = TRUE)

/obj/item/buster_sword_core
	name = "hyperdense core"
	desc = "An ancient-looking assemblage of some extremely dense alloy. There's an inscription across the edge."
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	icon_state = "buster_sword_unassembled"
	w_class = WEIGHT_CLASS_HUGE
	force = 5
	throwforce = 15
	throw_range = 1
	tk_throw_range = 1
	throw_speed = 1
	drop_sound = 'sound/items/handling/tools/crowbar_drop.ogg'
	pickup_sound = 'sound/items/handling/tools/crowbar_pickup.ogg'

/obj/item/buster_sword_core/examine_more(mob/user)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(start_learning_recipe), user)

/obj/item/buster_sword_core/proc/start_learning_recipe(mob/user)
	if(!user.mind)
		return
	if(user.mind.has_crafting_recipe(user = user, potential_recipe = /datum/crafting_recipe/buster_sword))
		return
	balloon_alert(user, "reading inscription...")
	if(do_after(user, 10 SECONDS, src))
		user.mind.teach_crafting_recipe(/datum/crafting_recipe/buster_sword)
		balloon_alert(user, "success!")
		to_chat(user, span_notice("You learned how to make a new weapon... though it doesn't seem very practical."))

/datum/crafting_recipe/buster_sword
	name = "Colossal Sword"
	result = /obj/item/buster_sword
	crafting_flags = parent_type::crafting_flags | CRAFT_MUST_BE_LEARNED
	tool_behaviors = list(TOOL_WRENCH, TOOL_SCREWDRIVER, TOOL_WELDER)
	reqs = list(
		/obj/item/buster_sword_core = 1,
		/obj/item/stack/sheet/iron = 100,
		/obj/item/stack/rods = 20,
		/obj/item/stack/sheet/plasteel = 20,
		/obj/item/stack/sheet/mineral/titanium = 10,
	)
	time = 10 SECONDS
	category = CAT_WEAPON_MELEE

/datum/market_item/misc/buster_sword_core
	name = "Ancient Alloy"
	desc = "One-of-a-kind archeological sample of super-dense alloy modern techniques simply cannot replicate. There has to be some kind of practical use for something like this!"
	item = /obj/item/buster_sword_core
	price_min = CARGO_CRATE_VALUE * 4
	price_max = CARGO_CRATE_VALUE * 6
	stock_max = 1
	availability_prob = 30
