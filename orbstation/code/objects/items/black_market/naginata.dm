/*
 * A cool black market spear
 */
/obj/item/spear/naginata
	icon_state = "naginata0"
	inhand_icon_state = "naginata0"
	base_icon_state = "naginata0"
	icon_prefix = "naginata"
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	lefthand_file = 'orbstation/icons/obj/weapons/inhand_left.dmi'
	righthand_file = 'orbstation/icons/obj/weapons/inhand_right.dmi'
	worn_icon = 'orbstation/icons/obj/weapons/worn_back.dmi'
	name = "naginata"
	desc = "Cheap imitation of an old Earth weapon. No good for throwing, but its fine balance allows for excellent defense, especially against thrown objects."
	throwforce = 4 // bad aerodynamics
	throw_speed = 2
	armour_penetration = 10
	force_unwielded = 8
	force_wielded = 21 // slight improvement over most other spears
	custom_materials = list(/datum/material/iron=1700)
	block_chance = 0

/obj/item/spear/naginata/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		if(attack_type == MELEE_ATTACK)
			final_block_chance = 25 // actually designed as a melee weapon
		if(attack_type == THROWN_PROJECTILE_ATTACK)
			final_block_chance = 35 //don't have to worry as much about hatchets
	return ..()

/// Allows you to buy it
/datum/market_item/weapon/naginata
	name = "Naginata"
	desc = "Authentic recreation of an old Earth weapon."
	item = /obj/item/spear/naginata

	price_min = CARGO_CRATE_VALUE * 1.5
	price_max = CARGO_CRATE_VALUE * 2.5
	stock_max = 3
	availability_prob = 40
