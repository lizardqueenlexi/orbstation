/obj/item/melee/powerfist
	force = 15 // Little bit less, mostly we want the knockback and not the damage

/datum/uplink_item/dangerous/doublesword
	purchasable_from = UPLINK_NUKE_OPS

/obj/vehicle/sealed/car/clowncar
	escape_time = 15 SECONDS // Actually longer, but we removed the requirement to stay still

/obj/vehicle/sealed/car/clowncar/Initialize(mapload)
	. = ..()
	emag_act() // Always use emag behaviour, it's silly for this item to upgrade something anyway

/datum/armor/mod_theme_infiltrator // More similar to nuke op, still a bit better
	melee = 20
	bullet = 30
	laser = 20
	energy = 20
	bomb = 40
	fire = 50
	acid = 90
	wound = 25

// This item is incompatible with using LOOC for consent and thus should not be enabled
/datum/uplink_item/device_tools/hypnotic_grenade
	purchasable_from = NONE

// While this item has uses that are not inherently against the nature of orbstation, the most effective ones all are so until a transformation x-card exists this should not be enabled
/datum/uplink_item/role_restricted/modified_syringe_gun
	purchasable_from = NONE

