//Hopefully a fair trade on stats to give it a little less melee, bullet, and acid for full fire resist
/datum/armor/gorlex_coat
	melee = 20
	bullet = 20
	laser = 30
	energy = 40
	bomb = 25
	fire = 100
	acid = 70
	wound = 10

/obj/item/clothing/suit/armor/gorlexcoat
	name = "gorlex longcoat"
	desc = "A heavy fireproof coat created for the marauders, a nanofiber weave located below the fabric reinforces it against most forms of attack."
	icon_state = "gorlex_trench"
	inhand_icon_state = null
	icon = 'orbstation/icons/obj/items/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/suits_worn.dmi'
	blood_overlay_type = "armor"
	armor_type = /datum/armor/gorlex_coat
	resistance_flags = FIRE_PROOF
	allowed = list(
	/obj/item/tank/internals/plasma,
	/obj/item/flamethrower/full/tank,
	/obj/item/grenade/chem_grenade/incendiary,
	/obj/item/gun/ballistic/automatic/pistol
	)

/obj/item/clothing/under/syndicateoveralls/fireproof
	name = "Fireproofed tactical overalls"
	desc = "A non-descript and slightly suspicious pair of tactical overalls , this particular pair seems to be reinforced to protect against intense flames"
	icon_state = "syndicate_overalls"
	has_sensor = NO_SENSORS
	armor_type = /datum/armor/clothing_under/under_syndicate
	resistance_flags = FIRE_PROOF
	alt_covers_chest = TRUE
	icon = 'orbstation/icons/obj/items/clothing/orb_syndicate.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/orb_syndicate_worn.dmi'

/obj/item/pushbroom/syndicate
	name = "tactical push broom"
	desc = "A DonkCo brand variant of the normal push broom, it's bristles have been replaced with a carbon nanofiber that is dangerously sharp, plus it can still push dust!"
	icon = 'orbstation/icons/obj/items/tactibroom.dmi'
	icon_state = "tactbroom0"
	base_icon_state = "tactbroom"
	lefthand_file = 'orbstation/icons/obj/items/tactbroom_lefthand.dmi'
	righthand_file = 'orbstation/icons/obj/items/tactbroom_righthand.dmi'
	force = 15
	throwforce = 10
	throw_speed = 3
	throw_range = 7
	block_chance = 50
	wound_bonus = 8
	armour_penetration = 35
	block_sound = 'sound/weapons/parry.ogg'
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_continuous = list("sweeps", "brushes off", "slashes", "cuts")
	attack_verb_simple = list("sweep", "brush off", "slash", "cut")
	resistance_flags = FLAMMABLE

/obj/item/reagent_containers/spray/syndicate/lube
	name = "suspicious spray bottle (superlube)"
	desc = "A spray bottle, with a high performance plastic nozzle. The bottle feels exceptionally greasy and slippery."
	icon = 'icons/obj/medical/chemical.dmi'
	icon_state = "sprayer_sus_8"
	inhand_icon_state = "sprayer_sus"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	spray_range = 4
	stream_range = 2
	volume = 100
	list_reagents = list(/datum/reagent/lube/superlube = 100)
