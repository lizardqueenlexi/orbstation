/**
 * Prank wand knocks you over as if pied and surrounds you with space lube
 */
/obj/item/gun/magic/wand/prank
	name = "wand of pratfalls"
	desc = "A comedy wand which is sure to get a laugh out of you, if not its victims."
	school = SCHOOL_CONJURATION
	ammo_type = /obj/item/ammo_casing/magic/prank
	icon_state = "nothingwand"
	base_icon_state = "nothingwand"
	fire_sound = 'sound/items/bikehorn.ogg'
	max_charges = 10

/obj/item/gun/magic/wand/prank/zap_self(mob/living/user)
	. = ..()
	var/obj/item/food/pie/cream/pie/magical/pie = new(src)
	pie.splat(user)
	charges--

/obj/item/ammo_casing/magic/prank
	projectile_type = /obj/projectile/magic/prank
	harmful = FALSE

/obj/projectile/magic/prank
	name = "bolt of pratfalls"
	icon = 'icons/obj/food/piecake.dmi'
	icon_state = "pie"
	/// Our internal pie
	var/obj/item/food/pie/cream/pie/magical/pie = new()

/obj/projectile/magic/prank/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	pie.splat(target)

/// This creates an extremely messy cream pie which your audience will love
/obj/item/food/pie/cream/pie/magical

/obj/item/food/pie/cream/pie/magical/splat(atom/movable/hit_atom)
	var/datum/reagents/lube = new /datum/reagents(1000)
	lube.add_reagent(/datum/reagent/lube, 100)
	lube.my_atom = get_turf(hit_atom)
	lube.create_foam(/datum/effect_system/fluid_spread/foam, DIAMOND_AREA(2))
	qdel(lube)
	var/laugh_sound = list('sound/items/SitcomLaugh1.ogg', 'sound/items/SitcomLaugh2.ogg', 'sound/items/SitcomLaugh3.ogg')
	playsound(hit_atom, laugh_sound, 100, FALSE)
	return ..()
