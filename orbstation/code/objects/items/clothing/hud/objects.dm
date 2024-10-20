/obj/item/clothing/glasses/hud/health/eyepatch
	name = "eyepatch Medical HUD"
	desc = "Give that missing eye something to do with Medical HUD Patch."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "medpatch"
	base_icon_state = "medpatch"
	inhand_icon_state = null
	actions_types = list(/datum/action/item_action/flip)

/obj/item/clothing/glasses/hud/health/eyepatch/attack_self(mob/user, modifiers)
	. = ..()
	icon_state = (icon_state == base_icon_state) ? "[base_icon_state]_flipped" : base_icon_state
	user.update_worn_glasses()

/obj/item/clothing/glasses/hud/health/sunglasses/gars
	name = "medical HUD gar glasses"
	desc = "GAR glasses with a Medical HUD."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "gar_med"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/health/sunglasses/gars/giga
	name = "giga Medical HUD gar glasses"
	desc = "GIGA GAR glasses with a Medical HUD."
	icon_state = "gigagar_med"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/hud/health/meson
	name = "med gar mesons"
	desc = "Now you'll know how close you were to killing the monster that'll take you down."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "gar_mesonmed"
	inhand_icon_state = "gar_meson"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	clothing_traits = list(TRAIT_MADNESS_IMMUNE)
	vision_flags = SEE_TURFS
	color_cutoffs = list(30, 20, 5)
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/diagnostic/eyepatch
	name = "eyepatch Diagnostic HUD"
	desc = "They always warn you that robotics can take an eye out. They never told you about the sick eyepatches though."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "diagpatch"
	base_icon_state = "diagpatch"
	inhand_icon_state = null
	actions_types = list(/datum/action/item_action/flip)

/obj/item/clothing/glasses/hud/diagnostic/eyepatch/attack_self(mob/user, modifiers)
	. = ..()
	icon_state = (icon_state == base_icon_state) ? "[base_icon_state]_flipped" : base_icon_state
	user.update_worn_glasses()

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars
	name = "diagnostic HUD gar glasses"
	desc = "Gar glasses with a Diagnostic HUD."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "gar_diag"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/hud/diagnostic/sunglasses/gars/giga
	name = "giga Diagnostic HUD gar glasses"
	desc = "Giga Gar glasses with a Diagnostic HUD."
	icon_state = "gigagar_diag"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/science/eyepatch
	name = "eyepatch Science HUD"
	desc = "Does everything science goggles can, with only one eye"
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "scipatch"
	base_icon_state = "scipatch"
	inhand_icon_state = null
	actions_types = list(/datum/action/item_action/flip)

/obj/item/clothing/glasses/science/eyepatch/attack_self(mob/user, modifiers)
	. = ..()
	icon_state = (icon_state == base_icon_state) ? "[base_icon_state]_flipped" : base_icon_state
	user.update_worn_glasses()

/obj/item/clothing/glasses/sunglasses/chemical/gars
	name = "science HUD gar glasses"
	desc = "Gar glasses with a Science HUD."
	icon = 'orbstation/icons/obj/items/clothing/glasses.dmi'
	worn_icon = 'orbstation/icons/obj/items/clothing/glasses_worn.dmi'
	icon_state = "gar_sci"
	inhand_icon_state = "gar_black"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb_continuous = list("slices")
	attack_verb_simple = list("slice")
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/clothing/glasses/sunglasses/chemical/gars/giga
	name = "giga Science HUD gar glasses"
	desc = "Giga Gar glasses with a Science HUD."
	icon_state = "gigagar_sci"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	name = "eyepatch Security HUD"
	desc = "The cooler looking cousin of security HUDSunglasses. Through a marvel of engineering, it even protects your good eye from flashes!"

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	name = "security HUD gar glasses"
	desc = "Gar glasses with a security HUD."

/obj/item/clothing/glasses/hud/security/sunglasses/gars/giga
	name = "giga security HUD gar glasses"
	desc = "Giga Gar glasses with a security HUD."

//removed a flippant joke about police brutality
/obj/item/clothing/glasses/hud/spacecop
	name = "aviators"
	desc = "You can be my wingman anytime."

// changed to match aviators
/obj/item/clothing/glasses/hud/spacecop/hidden
	desc = "Bullshit, You can be my wingman."
