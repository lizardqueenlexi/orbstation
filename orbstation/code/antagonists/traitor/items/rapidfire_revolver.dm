/obj/item/gun/ballistic/revolver/rapidfire //The Gun
	name = "DonkCo. New Syndie"
	desc = "A Donk Corporation take on the classic Syndicate choice of a .357 Magnum revolver. It has a match trigger and an extended, textured hammer designed for quick fanning, but the shortened barrel decreases effective accuracy outside of close quarters. It uses .38 Special Hot Load rounds instead of the usual .357 caliber rounds."
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	icon_state = "rapidfire_revolver"
	initial_caliber = CALIBER_38
	spread = 23
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/rapidfire_revolver

/obj/item/ammo_box/magazine/internal/cylinder/rapidfire_revolver //The magazine
	name = "DonkCo. New Syndie cylinder"
	ammo_type = /obj/item/ammo_casing/c38/special_hotload
	caliber = CALIBER_38
	max_ammo = 6

/datum/uplink_item/dangerous/rapidfire //Lets you buy it
	name = "DonkCo. New Syndie"
	desc = "A Donk Corporation take on the classic Syndicate choice of a .357 Magnum revolver. It has a match trigger and an extended, textured hammer designed for quick fanning, but the shortened barrel decreases effective accuracy outside of close quarters. It uses .38 Special Hot Load rounds instead of the usual .357 caliber rounds."
	item = /obj/item/gun/ballistic/revolver/rapidfire
	cost = 11
	surplus = 50
	progression_minimum = 30 MINUTES
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND

/obj/item/ammo_box/c38/special_hotload //The speedloader
	name = "Speed Loader (.38 Special Hot Load)"
	desc = "Designed to quickly reload the DonkCo. New Syndie."
	ammo_type = /obj/item/ammo_casing/c38/special_hotload
	max_ammo = 6
	caliber = CALIBER_38
	multiple_sprites = AMMO_BOX_PER_BULLET
	item_flags = NO_MAT_REDEMPTION
	ammo_band_color = "#d01010"

/datum/uplink_item/ammo/special_hotload //Lets you buy the speedloader
	name = ".38 Special Hot Load Speed Loader"
	desc = "A speed loader that contains seven additional .38 Special Hot Load rounds; usable with the DonkCo. New Syndie. \
			For when you really need to fan that hammer."
	progression_minimum = 30 MINUTES
	item = /obj/item/ammo_box/c38/special_hotload
	cost = 3
	uplink_item_flags = SYNDIE_TRIPS_CONTRABAND
