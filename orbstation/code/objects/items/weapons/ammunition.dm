/datum/crafting_recipe/a357
	name = ".357 bullet"
	result = /obj/item/ammo_casing/a357
	reqs = list(
		/obj/item/ammo_casing/a357_brass = 1, //
		/datum/reagent/gunpowder = 20, // This is the current amount required for the Improvised shotshells
		/obj/item/stack/sheet/plasteel = 1,
	)
	tool_behaviors = list(TOOL_WIRECUTTER)
	time = 1 SECONDS
	category = CAT_WEAPON_AMMO

/obj/item/ammo_casing/a357
	desc = "A .357 Magnum bullet. Loud, Brutal, Efficient."
	icon = 'orbstation/icons/obj/weapons/ammunition.dmi'
	icon_state = "a357"

/obj/item/ammo_casing/a357_brass
	name = ".357 unloaded casing"
	desc = "A fresh new brass case for a .357 shell. Necessary for making new rounds, but not enough on it's own."
	icon = 'orbstation/icons/obj/weapons/ammunition.dmi'
	icon_state = "brassa357"
	caliber = CALIBER_357
	projectile_type = null

/obj/projectile/bullet/c38/special_hotload
	name = ".38 Special Hot Load bullet"
	damage = 40

/obj/item/ammo_casing/c38/special_hotload
	name = ".38 Special Hot Load bullet casing"
	desc = "a syndicate .38 special round that's packed with as much gunpowder as the shortened case can handle. not safe for use in normal revolvers, but packs a bigger wallop."
	caliber = CALIBER_38
	click_cooldown_override = 0.15 SECONDS
	projectile_type = /obj/projectile/bullet/c38/special_hotload
