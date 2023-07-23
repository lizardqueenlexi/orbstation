// This disabler works with mind shields or a security armband
/obj/item/gun/energy/disabler/departmental
	name = "deputy disabler"
	desc = "A self-defence weapon which weakens organic targets. Only functions in conjunction with an NT official armband."
	pin = /obj/item/firing_pin/implant/mindshield_deputy

/obj/item/firing_pin/implant/mindshield_deputy
	name = "deputy firing pin"
	desc = "This Security firing pin authorizes the weapon for mindshield-implanted users, or those wearing a less permanent armband."

/obj/item/firing_pin/implant/pin_auth(mob/living/user)
	if (HAS_TRAIT(user, TRAIT_DEPUTISED))
		return TRUE
	return ..()

// Adds a trait to armbands
/obj/item/clothing/accessory/armband/accessory_equipped(obj/item/clothing/under/U, mob/living/user)
	ADD_TRAIT(user, TRAIT_DEPUTISED, REF(src))

/obj/item/clothing/accessory/armband/accessory_dropped(obj/item/clothing/under/U, mob/living/user)
	REMOVE_TRAIT(user, TRAIT_DEPUTISED, REF(src))

// Departmental sec belt doesn't have a baton or grenade in it
/obj/item/storage/belt/security/departmental

/obj/item/storage/belt/security/departmental/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/restraints/handcuffs(src)
	update_appearance()

// Adds capability of closet to talk on radio when unlocked
/obj/structure/closet/secure_closet/security
	var/radio_channel
	var/dept_name

/obj/structure/closet/secure_closet/security/after_open(mob/living/user, force)
	. = ..()
	if (!user || force || !radio_channel || !dept_name)
		return


	var/obj/item/card/id/used_id = user.get_idcard(TRUE)
	var/opener_name = used_id ? used_id.registered_name : user.name

	var/obj/machinery/announcement_system/announcer = pick(GLOB.announcement_systems)
	announcer.announce_locker_access(opener_name, dept_name, radio_channel)

/// Announces a department's security locker has been opened
/obj/machinery/announcement_system/proc/announce_locker_access(name, dept_name, channel)
	if (!is_operational)
		return
	broadcast("[dept_name] Security Resources have been requisitioned by [name].", list(channel, RADIO_CHANNEL_SECURITY))

// Change the contents of dep sec lockers
/obj/structure/closet/secure_closet/security/cargo
	req_access = list()
	req_one_access = list(ACCESS_SECURITY, ACCESS_CARGO)
	radio_channel = RADIO_CHANNEL_SUPPLY
	dept_name = "Cargo"

/obj/structure/closet/secure_closet/security/cargo/PopulateContents()
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/gun/energy/disabler/departmental(src)
	new /obj/item/storage/belt/security/departmental(src)
	new /obj/item/clothing/accessory/armband/cargo(src)
	new /obj/item/clothing/accessory/armband/cargo(src)
	new /obj/item/encryptionkey/headset_cargo(src)
	new /obj/item/storage/box/zipties(src)

/obj/structure/closet/secure_closet/security/engine
	req_access = list()
	req_one_access = list(ACCESS_SECURITY, ACCESS_ENGINEERING)
	radio_channel = RADIO_CHANNEL_ENGINEERING
	dept_name = "Engineering"

/obj/structure/closet/secure_closet/security/engine/PopulateContents()
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/gun/energy/disabler/departmental(src)
	new /obj/item/storage/belt/security/departmental(src)
	new /obj/item/clothing/accessory/armband/engine(src)
	new /obj/item/clothing/accessory/armband/engine(src)
	new /obj/item/encryptionkey/headset_eng(src)
	new /obj/item/storage/box/zipties(src)

/obj/structure/closet/secure_closet/security/science
	req_access = list()
	req_one_access = list(ACCESS_SECURITY, ACCESS_SCIENCE)
	radio_channel = RADIO_CHANNEL_SCIENCE
	dept_name = "Research"

/obj/structure/closet/secure_closet/security/science/PopulateContents()
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/gun/energy/disabler/departmental(src)
	new /obj/item/storage/belt/security/departmental(src)
	new /obj/item/clothing/accessory/armband/science(src)
	new /obj/item/clothing/accessory/armband/science(src)
	new /obj/item/encryptionkey/headset_sci(src)
	new /obj/item/storage/box/zipties(src)

/obj/structure/closet/secure_closet/security/med
	req_access = list()
	req_one_access = list(ACCESS_SECURITY, ACCESS_MEDICAL)
	radio_channel = RADIO_CHANNEL_MEDICAL
	dept_name = "Medical"

/obj/structure/closet/secure_closet/security/med/PopulateContents()
	new /obj/item/clothing/glasses/hud/security/sunglasses(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/gun/energy/disabler/departmental(src)
	new /obj/item/storage/belt/security/departmental(src)
	new /obj/item/clothing/accessory/armband/medblue(src)
	new /obj/item/clothing/accessory/armband/medblue(src)
	new /obj/item/encryptionkey/headset_med(src)
	new /obj/item/storage/box/zipties(src)

// Mapping access helpers
/obj/effect/mapping_helpers/airlock/access/any/security/cargo/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SECURITY, ACCESS_CARGO)
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/security/engine/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SECURITY, ACCESS_ENGINEERING)
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/security/science/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SECURITY, ACCESS_SCIENCE)
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/security/med/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SECURITY, ACCESS_MEDICAL)
	return access_list
