/**
* Traitor Bartender Item
* Use it to have a secret medical hud and meson capabilties
*/
/obj/item/clothing/glasses/hud/health/sunglasses/advanced_beer_goggles
	name = "beer goggles"
	icon_state = "sunhudbeer"
	inhand_icon_state = "sunglasses"
	desc = "A pair of sunglasses outfitted with apparatus to scan reagents, as well as providing an innate understanding of liquid viscosity while in motion. They feel slightly heavier than you'd expect."
	glass_colour_type = /datum/client_colour/glass_colour/gray
	clothing_traits = list(TRAIT_BOOZE_SLIDER, TRAIT_REAGENT_SCANNER, TRAIT_MESON_VISION)

/datum/uplink_item/role_restricted/advanced_beer_goggles
	name = "Advanced Beer Goggles"
	desc = "A pair of beer goggles secretly fitted with a medical hud and meson capabilities. "
	item = /obj/item/clothing/glasses/hud/health/sunglasses/advanced_beer_goggles
	cost = 2
	restricted_roles = list(JOB_BARTENDER)
	surplus = 25
