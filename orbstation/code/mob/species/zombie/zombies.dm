/datum/species/zombie/infectious
	damage_modifier = 0 // upstream this is 20, which means you need 120 damage to KO a zombie, which kills it, we decreased it to 0

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/zombie/infectious,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/zombie/infectious,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/zombie/infectious,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/zombie/infectious,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/zombie/infectious,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/zombie/infectious
	)

	var/old_hair_head_flags = NONE

/obj/item/bodypart/head/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks

/obj/item/bodypart/chest/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks

/obj/item/bodypart/arm/left/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks

/obj/item/bodypart/arm/right/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks

/obj/item/bodypart/leg/left/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks

/obj/item/bodypart/leg/right/zombie/infectious
	brute_modifier = 1.25 // romerol zombies are weak to brute-force attacks
