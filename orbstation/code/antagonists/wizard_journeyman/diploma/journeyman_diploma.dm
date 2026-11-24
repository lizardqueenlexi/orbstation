/// Let's you draft wizard spells as a journeyman
/obj/item/wizard_diploma
	name = "wizarding certificate"
	desc = "An unearthly diploma confirming the achievements of a young wizard."
	icon = 'icons/obj/signs.dmi'
	icon_state = "goldenplaque"
	inhand_icon_state = "blankplaque"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE

	/// The number of spells you can pick remaining
	var/picks_remaining = 4
	/// The mind that first used this. Automatically assigned when a wizard spawns.
	var/datum/mind/owner
	/// A list of all purchased options
	var/list/owned_spells = list()
	/// A list of all drafted spellbook options
	var/list/entries = list()

/obj/item/wizard_diploma/Initialize(mapload)
	. = ..()
	prepare_spells()

/obj/item/wizard_diploma/Destroy(force)
	owner = null
	entries.Cut()
	return ..()

/// Instantiates our list of spellbook entries.
/obj/item/wizard_diploma/proc/prepare_spells()
	var/list/spells_offensive = list()
	var/list/spells_defensive = list()
	var/list/spells_other = list()

	var/entry_types = subtypesof(/datum/diploma_spell)
	for(var/type in entry_types)
		var/datum/diploma_spell/possible_entry = new type()
		if(!possible_entry.can_be_purchased())
			qdel(possible_entry)
			continue

		switch(possible_entry.category)
			if (DIPLOMA_SPELL_OFFENSIVE)
				spells_offensive[type] = possible_entry.weight
			if (DIPLOMA_SPELL_DEFENSIVE)
				spells_defensive[type] = possible_entry.weight
			if (DIPLOMA_SPELL_OTHER)
				spells_other[type] = possible_entry.weight

	for(var/i in 1 to 4)
		entries += random_spell_from(spells_offensive)
		entries += random_spell_from(spells_defensive)
		entries += random_spell_from(spells_other)

/// Returns a random spell instance from a list of types
/obj/item/wizard_diploma/proc/random_spell_from(list/from_list)
	var/spell_type = pick_weight(from_list)
	from_list[spell_type] = 0
	return new spell_type()

/obj/item/wizard_diploma/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "SpellDiploma")
		ui.open()

/obj/item/wizard_diploma/ui_data(mob/user)
	var/list/data = list()
	data["owner"] = (owner) ? owner.name : "SIGN HERE"
	data["picks"] = picks_remaining
	data["owned_spells"] = owned_spells
	return data

/obj/item/wizard_diploma/ui_static_data(mob/user)
	var/list/data = list()
	var/list/entry_data = list()
	for(var/datum/diploma_spell/entry as anything in entries)
		var/list/individual_entry_data = list()
		individual_entry_data["name"] = entry.name
		individual_entry_data["desc"] = entry.desc
		individual_entry_data["ref"] = REF(entry)
		individual_entry_data["requires_wizard_garb"] = entry.requires_wizard_garb
		individual_entry_data["category"] = entry.category
		individual_entry_data["buy_word"] = entry.buy_word
		entry_data += list(individual_entry_data)

	data["spells"] = entry_data
	return data

/obj/item/wizard_diploma/examine(mob/user)
	. = ..()
	if(owner)
		. += {"A large signature confirms that this belongs to "[owner]"."}
	else
		. += "It doesn't appear to have been issued to anyone in particular."

/obj/item/wizard_diploma/attack_self(mob/user)
	if(!owner)
		if(!user.mind)
			return
		to_chat(user, span_notice("You eagerly sign [src]."))
		owner = user.mind
		return
	if(user.mind != owner)
		to_chat(user, span_warning("The words swim in front of your eyes."))
		return
	return ..()

/obj/item/wizard_diploma/ui_act(action, params)
	. = ..()
	if(.)
		return

	var/mob/living/carbon/human/wizard = usr
	if(!istype(wizard))
		to_chat(wizard, span_warning("You have no idea what to do with this."))
		return FALSE

	// Actions that are always available
	switch(action)
		if("purchase")
			var/datum/diploma_spell/entry = locate(params["spellref"]) in entries
			return purchase_entry(entry, wizard)

/// Attempts to purchased the passed entry [to_buy] for [user].
/obj/item/wizard_diploma/proc/purchase_entry(datum/diploma_spell/to_buy, mob/living/carbon/human/user)
	if (picks_remaining <= 0)
		return FALSE
	if(!istype(to_buy))
		CRASH("Diploma attempted to buy an invalid entry. Got: [to_buy ? "[to_buy] ([to_buy.type])" : "null"]")
	if(!to_buy.buy_spell(user, src))
		return FALSE

	var/datum/antagonist/wizard_journeyman/wizard = owner.has_antag_datum(/datum/antagonist/wizard_journeyman)
	if (wizard)
		wizard.learned_spells += to_buy.name
	owned_spells += REF(to_buy)
	picks_remaining--
	return TRUE
