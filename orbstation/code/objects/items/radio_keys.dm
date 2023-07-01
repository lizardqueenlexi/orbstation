// A set of extra encryption keys for orbstation

/obj/item/encryptionkey/felinid
	name = "\improper Felimimetic translation key"
	desc = "An encryption key that automatically encodes felimimetic heard through the radio into common. The signal's rather scratchy."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/nekomimetic
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/ratfolk
	name = "\improper Ratfolk translation key"
	desc = "An encryption key that automatically encodes ratvaric heard through the radio into common. The signal's a little squeaky."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/ratvaric
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/common
	name = "\improper Galactic Common translation key"
	desc = "An encryption key that automatically translates common heard through the radio. The signal's bog standard."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/common
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/human
	name = "\improper Human translation key"
	desc = "An encryption key that automatically translates Sol Standard heard through the radio into common. The signal's very persistent."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/solcom
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/slime
	name = "\improper Slime translation key"
	desc = "An encryption key that automatically translates slimetongue heard through the radio. The signal's strangely wet."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/slime
	greyscale_config = null
	greyscale_colors = null

/obj/item/encryptionkey/pod
	name = "\improper Podperson translation key"
	desc = "An encryption key that automatically translates sylvan heard through the radio. The signal sounds like rustling leaves."
	icon_state = "translation_cypherkey"
	translated_language = /datum/language/sylvan
	greyscale_config = null
	greyscale_colors = null

// Goodie packs for each key

// CURRENTLY DISABLED. I may add these back in later.
/*
/datum/supply_pack/goody/felinid_encryption_key
	desc = "A hi-tech radio encryption key that allows the wearer to understand felimimetic when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/ratfolk)

/datum/supply_pack/goody/ratfolk_encryption_key
	name = "Ratvaric radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand ratvaric when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/ratfolk)

/datum/supply_pack/goody/common_encryption_key
	name = "Galactic Common radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand galactic common when the radio is worn."
	cost = PAYCHECK_CREW * 16 //expensive because Common is already widely spoken - less demand
	contains = list(/obj/item/encryptionkey/common)

/datum/supply_pack/goody/human_encryption_key
	name = "Sol Standard radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand Sol Standard when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/human)

/datum/supply_pack/goody/slime_encryption_key
	name = "Slime radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand slimetongue when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/slime)

/datum/supply_pack/goody/podperson_encryption_key
	name = "Sylvan radio encryption key"
	desc = "A hi-tech radio encryption key that allows the wearer to understand sylvan when the radio is worn."
	cost = PAYCHECK_CREW * 12
	contains = list(/obj/item/encryptionkey/pod)

/datum/supply_pack/misc/translation_key_pack
	name = "Surplus Translation Key Crate"
	desc = "Crew having trouble understanding each other? This box contains three high-tech radio translation keys, \
			in fine condition despite sitting in a dusty warehouse for four years. You don't get to pick the languages \
			they translate to, but they're at a discount!"
	cost = CARGO_CRATE_VALUE * 7.5
	contains = list()

/// list of keys that might appear, slightly weighted
	var/list/key_types = list(
		/obj/item/encryptionkey/moth = 3,
		/obj/item/encryptionkey/tiziran = 3,
		/obj/item/encryptionkey/ethereal = 3,
		/obj/item/encryptionkey/felinid = 3,
		/obj/item/encryptionkey/ratfolk = 3,
		/obj/item/encryptionkey/human = 3,
		/obj/item/encryptionkey/plasmaman = 2,
		/obj/item/encryptionkey/slime = 2,
		/obj/item/encryptionkey/pod = 2,
		/obj/item/encryptionkey/common = 1,
	)

/datum/supply_pack/misc/translation_key_pack/fill(obj/structure/closet/crate/new_crate)
	. = ..()
	var/list/rng_key_list = key_types.Copy()
	for(var/i in 1 to 3)
		var/randomize_key = pick_weight(rng_key_list)
		rng_key_list -= randomize_key
		new randomize_key(new_crate)
*/
