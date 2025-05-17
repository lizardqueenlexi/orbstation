//Winter coats for several additional jobs, imported from Skyrat

//Bartender
/obj/item/clothing/suit/hooded/wintercoat/bartender
	icon = 'orbstation/icons/obj/items/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/suits_worn.dmi'
	name = "bartender's winter coat"
	desc = "A heavy jacket made from wool originally stolen from the chef's goat. This new design is made to fit the classic suit-and-tie aesthetic, but without the hypothermia."
	icon_state = "coatbar"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
		/obj/item/toy,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/lighter,
		/obj/item/reagent_containers/cup/glass/shaker,
		/obj/item/reagent_containers/cup/glass/flask,
		/obj/item/rag,
		/obj/item/gun/ballistic/shotgun/doublebarrel,)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/bartender

/obj/item/clothing/head/hooded/winterhood/bartender
	icon = 'orbstation/icons/obj/items/clothing/hats.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/hats_worn.dmi'
	icon_state = "winterhood_bar"

//Clown
/obj/item/clothing/suit/hooded/wintercoat/clown
	icon = 'orbstation/icons/obj/items/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/suits_worn.dmi'
	name = "clown's winter coat"
	desc = "A brightly-colored coat fit for the station's resident jester."
	icon_state = "coatclown"
	allowed = list(
		/obj/item/bikehorn,
		/obj/item/megaphone/clown,
		/obj/item/toy/crayon,
		/obj/item/grown/bananapeel,
		/obj/item/stamp/clown,
	)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/clown

/obj/item/clothing/head/hooded/winterhood/clown
	icon = 'orbstation/icons/obj/items/clothing/hats.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/hats_worn.dmi'
	desc = "A jingly red and green winter coat hood."
	icon_state = "winterhood_clown"

//Mime
/obj/item/clothing/suit/hooded/wintercoat/mime
	icon = 'orbstation/icons/obj/items/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/suits_worn.dmi'
	name = "mime's winter coat"
	desc = "A warm winter coat in muted colors."
	icon_state = "coatmime"
	allowed = list(
		/obj/item/stamp/mime,
		/obj/item/toy/crayon/mime,
		/obj/item/toy/crayon/spraycan/mimecan,
		/obj/item/reagent_containers/cup/glass/bottle/bottleofnothing,
	)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/mime

/obj/item/clothing/head/hooded/winterhood/mime
	icon = 'orbstation/icons/obj/items/clothing/hats.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/hats_worn.dmi'
	desc = "A black and white coat hood."
	icon_state = "winterhood_mime"

//Cosmic Coat
/obj/item/clothing/suit/hooded/wintercoat/cosmic
	icon = 'orbstation/icons/obj/items/clothing/suits.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/suits_worn.dmi'
	name = "cosmic winter coat"
	desc = "A warm winter coat shimmering with the light of the stars."
	icon_state = "coatcosmic"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/cosmic

/obj/item/clothing/head/hooded/winterhood/cosmic
	icon = 'orbstation/icons/obj/items/clothing/hats.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/hats_worn.dmi'
	desc = "A coat hood dotted with stars."
	icon_state = "winterhood_cosmic"
