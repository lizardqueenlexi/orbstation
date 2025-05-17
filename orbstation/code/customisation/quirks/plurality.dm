// PLURALITY QUIRK
// TODO: figure out how to let people set up system member names on the character prefs page.
// ^ This is hard.

/datum/quirk/item_quirk/plurality
	name = "Plurality"
	desc = "You are a system of multiple people who share the same body. \
	You start with an unlocked plural system chip in your bag, which you can use in-hand \
	to set up the names of your system members. The system name will be automatically set to \
	your character name, and cannot be modififed unless the chip is unlocked by an ID with \
	Head of Personnel access. The chip will be locked once attached to an ID. \
	Examine the chip for more information."
	icon = FA_ICON_USER_GROUP
	value = 0
	medical_record_text = "Patient is a plural person."

/datum/quirk/item_quirk/plurality/add_unique()
	var/obj/item/plural_system_chip/new_system_chip = new
	new_system_chip.locked = FALSE
	new_system_chip.system_name_locked = TRUE
	new_system_chip.update_appearance()

	give_item_to_holder(new_system_chip, list(
		LOCATION_EYES,
		LOCATION_BACKPACK,
		LOCATION_HANDS,
	))

// Plural system chip item, used to store information on plural systems.

/obj/item/plural_system_chip
	name = "plural system chip"
	desc = "A chip used to store data on plural system members. Can be attached to an \
	identification card in order to allow it to switch between the names of the members, \
	and removed from the card with a screwdriver. A Head of Personnel's ID can be swiped on \
	the chip to lock and unlock it, allowing users to edit, add, or remove members to or from \
	the system."
	icon = 'orbstation/icons/obj/items/misc.dmi'
	icon_state = "plural_chip_1"
	w_class = WEIGHT_CLASS_TINY
	armor_type = /datum/armor/plural_system_chip
	resistance_flags = FIRE_PROOF | ACID_PROOF
	req_access = list(ACCESS_HOP)

	/// Whether the chip is locked or unlocked. When unlocked, it can be used in-hand to edit/add/remove system member names.
	var/locked = TRUE
	/// The name of the plural system, which is displayed on the ID card in {braces} at all times.
	var/system_name
	/// The name of the system's current fronter, which will be displayed on the ID card in place of the registered name.
	var/fronter_name
	/// List of system member names. When the chip is attached to an ID, using the ID in-hand will allow the user to switch between these names.
	var/list/system_member_names = list()
	/// When TRUE, prevents the system name from being modified. Used for the roundstart chips given by the plurality quirk. Set to FALSE when a HoP ID is swiped on the chip.
	var/system_name_locked = FALSE

/obj/item/plural_system_chip/update_icon_state()
	icon_state = "plural_chip"
	icon_state += "_[locked]"
	return ..()

/obj/item/plural_system_chip/attack_self(mob/user)
	if(user.incapacitated)
		return
	if(!user.is_holding(src))
		return
	if(locked)
		to_chat(user, span_warning("[src] is locked and cannot be modified right now. It can be unlocked by an ID card with Head of Personnel access."))
		balloon_alert(user, "locked")
		return
	if(!system_name)
		var/new_system_name
		if(system_name_locked)
			new_system_name = user.mind.name ? user.mind.name : user.name
			update_system_name(new_system_name)
			to_chat(user, span_notice("The chip's associated system name was automatically set to [new_system_name]."))
			// no return here because we're jumping right into the Choose Action menu
		else
			new_system_name = tgui_input_text(user, "Input the new system name:", "Set System Name", max_length = 42)
			if(!new_system_name)
				return
			update_system_name(new_system_name)
			to_chat(user, span_notice("Successfully set the chip's associated system name to [new_system_name]."))
			return
	var/popup_input = tgui_input_list(user, "Choose Action", "Plural System Interface", list("Add Member", "Remove Member", "Edit Member", "Clear Members", "Edit System Name"))
	switch(popup_input)
		if("Add Member")
			var/new_member_name = tgui_input_text(user, "Input the name of the new system member:", "Add Member", max_length = 42)
			if(!new_member_name)
				return
			if(new_member_name == "Show ID") // kinda hacky way of preventing some weirdness with the ID
				to_chat(user, span_warning("ERROR: Invalid member name."))
				return
			if(new_member_name in system_member_names)
				to_chat(user, span_warning("ERROR: Duplicate member name."))
				return
			system_member_names |= new_member_name
			to_chat(user, span_notice("Successfully added new member [new_member_name] to the chip's associated system."))
			return
		if("Remove Member")
			if(!system_member_names.len)
				to_chat(user, span_warning("ERROR: There are no members registered with [system_name]."))
				return
			var/selected_member = tgui_input_list(user, "Select system member to remove:", "Remove Member", system_member_names)
			if(!selected_member || !(selected_member in system_member_names))
				return
			system_member_names -= selected_member
			to_chat(user, span_notice("Successfully removed member [selected_member] from the chip's associated system."))
			return
		if("Edit Member")
			if(!system_member_names.len)
				to_chat(user, span_warning("ERROR: There are no members registered with [system_name]."))
				return
			var/selected_member = tgui_input_list(user, "Select system member to edit:", "Select Member", system_member_names)
			if(!selected_member)
				return
			var/edited_member_name = tgui_input_text(user, "Input the new name of [selected_member]:", "Edit Member", max_length = 30)
			if(!edited_member_name)
				return
			if(!(selected_member in system_member_names))
				to_chat(user, span_warning("ERROR: Could not find member [selected_member] in [system_name]."))
				return
			system_member_names -= selected_member
			system_member_names |= edited_member_name
			to_chat(user, span_notice("Successfully renamed member [selected_member] to [edited_member_name]."))
			return
		if("Clear Members")
			if(!system_member_names.len)
				to_chat(user, span_warning("ERROR: There are no members registered with [system_name]."))
				return
			var/clear_confirmation = tgui_alert(user, "Do you really want to clear all members from the system?", "Clear Members", list("Yes", "No"))
			if(clear_confirmation == "Yes")
				system_member_names.Cut()
				to_chat(user, span_notice("Successfully cleared all members from [system_name]."))
			return
		if("Edit System Name")
			if(system_name_locked)
				to_chat(user, span_warning("ERROR: This chip cannot have its system name changed without being swiped first by an ID with Head of Personnel access."))
				return
			var/new_system_name = tgui_input_text(user, "Input the new system name:", "Edit System Name", max_length = 20)
			if(!new_system_name)
				return
			to_chat(user, span_notice("Successfully changed the chip's associated system name from [system_name] to [new_system_name]."))
			update_system_name(new_system_name)
			return

/// Changes the system_name variable and automatically updates the name of the chip to include it.
/obj/item/plural_system_chip/proc/update_system_name(new_system_name)
	system_name = new_system_name
	name = "[initial(name)] {[system_name]}"

/obj/item/plural_system_chip/attackby(obj/item/item, mob/user, params)
	if(!item.GetID())
		return

	if(!allowed(user))
		balloon_alert(user, "access denied!")
		return

	locked = !locked
	system_name_locked = FALSE
	balloon_alert(user, locked ? "locked" : "unlocked")
	update_appearance()
	return

// Code that allows ID cards to have plural system chips attached to them and interface with them to change the label of the ID.

/obj/item/card/id
	/// Attached plural system chip, if any.
	var/obj/item/plural_system_chip/plural_system
	/// Whether a plural system chip can be added to the ID.
	var/plural_system_compatible = TRUE

/obj/item/card/id/Destroy()
	QDEL_NULL(plural_system)
	return ..()

/obj/item/card/id/equipped(mob/user, slot, initial = FALSE)
	. = ..()
	if(plural_system && slot == ITEM_SLOT_ID)
		RegisterSignal(user, COMSIG_MOVABLE_MESSAGE_GET_NAME_PART, PROC_REF(return_plural_message_name_part))

/obj/item/card/id/dropped(mob/user, silent = FALSE)
	. = ..()
	if(plural_system)
		UnregisterSignal(user, list(COMSIG_HUMAN_GET_VISIBLE_NAME, COMSIG_MOVABLE_MESSAGE_GET_NAME_PART))

/obj/item/card/id/proc/return_visible_plural_label()
		var/name_string = plural_system.fronter_name ? plural_system.fronter_name : registered_name
		return "[name_string]'s ID Card {[plural_system.system_name]}"

/obj/item/card/id/proc/return_visible_plural_name()
		var/name_string = plural_system.fronter_name ? plural_system.fronter_name : registered_name
		return "[name_string] {[plural_system.system_name]}"

/obj/item/card/id/proc/return_plural_message_name_part(mob/living/carbon/human/source, list/stored_name, visible_name)
	SIGNAL_HANDLER
	if(visible_name)
		return
	var/voice_name = source.GetVoice()
	if(source.name != voice_name)
		voice_name += " (as {[plural_system.system_name]})"
	stored_name[NAME_PART_INDEX] = voice_name

/obj/item/card/id/advanced/chameleon
	plural_system_compatible = FALSE

/obj/item/card/id/attack_self(mob/user)
	if(user.incapacitated)
		return
	if(!user.is_holding(src))
		return
	// if there is a plural system chip attached and the system has members, shows a popup through which the user can select a member to display as the current fronter
	if(plural_system?.system_member_names.len && plural_system_compatible)
		var/list/menu_options = plural_system.system_member_names.Copy()
		menu_options |= "Show ID"
		var/popup_input = tgui_input_list(user, "Select the current fronter:", "Plural System Interface", menu_options)
		if(!popup_input)
			return
		if(popup_input != "Show ID")
			plural_system.fronter_name = popup_input
			balloon_alert(user, "[popup_input]")
			to_chat(user, span_notice("You set [plural_system]'s current fronter to [plural_system.fronter_name]."))
			update_label()
			return
	..() // if there is no plural system chip or the "Show ID" option was chosen, just show the ID like normal

/obj/item/card/id/attackby(obj/item/item, mob/user, params)
	if(!istype(item, /obj/item/plural_system_chip))
		return ..()

	if(!plural_system_compatible)
		to_chat(user, span_warning("This ID card is incompatible with plural system chips."))
		return

	var/obj/item/plural_system_chip/new_chip = item

	if(plural_system)
		to_chat(user, span_warning("There's already a plural system chip installed. Use a screwdriver to remove it."))
		return
	if(!registered_name)
		to_chat(user, span_warning("ERROR: [src] has no registered name. Take it to an identification console."))
		return
	if(!new_chip.system_member_names.len)
		to_chat(user, span_warning("[new_chip] has no system members registered with it."))
		return
	if(!user.transferItemToLoc(new_chip, src))
		return

	plural_system = new_chip
	to_chat(user, span_notice("You insert [plural_system] into [src]."))
	plural_system.fronter_name = plural_system.system_member_names[1]
	plural_system.locked = TRUE
	plural_system.update_appearance()
	update_label()
	playsound(src, 'sound/machines/pda_button/pda_button1.ogg', 50, TRUE)

/obj/item/card/id/screwdriver_act(mob/living/user, obj/item/screwtool)
	if(!plural_system)
		to_chat(user, span_warning("There's no plural system chip installed."))
		return
	UnregisterSignal(user, list(COMSIG_HUMAN_GET_VISIBLE_NAME, COMSIG_MOVABLE_MESSAGE_GET_NAME_PART))
	user.put_in_hands(plural_system)
	to_chat(user, span_notice("You remove [plural_system] from [src]."))
	plural_system.fronter_name = null
	plural_system = null
	update_label()
	playsound(src, 'sound/machines/pda_button/pda_button2.ogg', 50, TRUE)

// Adds a box of plural system chips to the HoP's locker.

/obj/item/storage/box/plural_system_chips
	name = "box of plural system chips"
	desc = "Contains several plural system chips, used for containing data on plural systems and their members."
	illustration = "id"

/obj/item/storage/box/plural_system_chips/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/plural_system_chip(src)

/obj/structure/closet/secure_closet/hop/PopulateContents()
	..()
	new /obj/item/storage/box/plural_system_chips(src)

// Adds a goodie case containing a single plural system chip, which can be bought at cargo for a small fee.

/datum/supply_pack/goody/plural_system_chip
	name = "Plural System Chip"
	desc = "Contains a single plural system chip. The chip must be swiped by an ID card with Head of Personnel access to be unlocked and configured."
	cost = PAYCHECK_CREW * 4
	contains = list(/obj/item/plural_system_chip)

/datum/armor/plural_system_chip
	fire = 100
	acid = 100
