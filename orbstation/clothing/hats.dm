/// Ham Helmet, a helmet with the word ham on it
/obj/item/clothing/head/helmet/ham
	name = "ham helmet"
	desc = "Common Helmet with Ham written on it. Uh oh."
	icon = 'orbstation/icons/obj/helmet.dmi'
	worn_icon = 'orbstation/icons/obj/helmet.dmi'
	icon_state = "hamhelmeticon"
	worn_icon_state = "hamhelmetworn"
	armor_type = list(MELEE = 25, BULLET = 15, LASER = 35,ENERGY = 35, BOMB = 25, BIO = 0, FIRE = 50, ACID = 50, WOUND = 10)
	flags_cover = NONE
	flags_inv = HIDEHAIR
	clothing_flags = SNUG_FIT | PLASMAMAN_HELMET_EXEMPT | PLASMAMAN_PREVENT_IGNITION

	dog_fashion = /datum/dog_fashion/head/hamhelmet

/datum/armor/ham_helmet
	melee = 25
	bullet = 15
	laser = 15
	energy = 35
	bomb = 25
	fire = 50
	acid  = 50
	wound = 10

/obj/item/paper/guides/hamhelmet
	name = "paper- 'Ham Helmet Warranty'"
	default_raw_text = "<h1>WEARABLE OR YOUR MONEY BACK!</h1><p>WE THE PROUD MAKERS OF HAM HELMETS ASSURE YOU THAT \
		THIS HAM HELMET IS 100% WEARABLE AND SAFE NO MATTER THE SPECIES AS LONG AS THAT SPECIES IS \
		CHANGLING, CLON, DOG, ETHERAL, ELGEYEM, FELINID, FLYPERSON, HUMAN, \
		JELLYPERSON, MERCURIAN, MONKEY, PLASMAMAN, PODPERSON, RATFOLK, ZETAN, SAIYAN, \
		SKELLETON, TIZIRAN, TIZIRAN (NON-DIGITRADE), TIZIRAN (SKELLETON), TROLL, \
		WIZARD, VAMPIRE, OR ZETAN.</p>"

/datum/dog_fashion/head/hamhelmet
	icon_file = 'orbstation/icons/obj/helmet.dmi'
	obj_icon_state = "hamhelmetian"
	name = "Ham Hunter REAL_NAME"
	desc = "NAME is wearing the Ham Helmet again..."
	emote_see = list("thinks about ham." )
