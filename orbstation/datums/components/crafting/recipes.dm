/datum/crafting_recipe/boggle
	name = "Boggle Goggles"
	result = /obj/item/clothing/glasses/boggle
	time = 2 SECONDS
	reqs = list(/obj/item/organ/internal/eyes = 1, /obj/item/stack/sheet/cloth = 1)
	category = CAT_MISC

/datum/crafting_recipe/lance
	name = "Explosive Lance (Grenade)"
	result = /obj/item/spear/explosive
	reqs = list(/obj/item/spear = 1,
				/obj/item/grenade = 1)
	blacklist = list(/obj/item/spear/bonespear, /obj/item/spear/bamboospear)
	parts = list(/obj/item/spear = 1,
				/obj/item/grenade = 1)
	time = 1.5 SECONDS
	category = CAT_WEAPON_MELEE

