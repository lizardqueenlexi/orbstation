/// A revolver with infinite ammo, pretending to be a wand.
/obj/item/gun/blasting_rod
	name = "Rod of Blasting"
	desc = "A wand at the cutting edge of magical research. Conjures holes in targets with startling speed and accuracy by aetherically accelerating small pieces of metal."
	icon_state = "c38"
	fire_sound = 'sound/items/weapons/gun/revolver/shot_alt.ogg'
	fire_delay = 1 SECONDS
	obj_flags = NONE

/obj/item/gun/blasting_rod/Initialize(mapload)
	. = ..()
	chambered = new /obj/item/ammo_casing/blasting(src)

	AddComponent(/datum/component/reskinable_item, /datum/atom_skin/blasting_rod)

/obj/item/gun/blasting_rod/handle_chamber(empty_chamber, from_firing, chamber_next_round)
	chambered.newshot()

/obj/item/ammo_casing/blasting
	name = "enchanted casing"
	desc = "A lump of runed metal."
	projectile_type = /obj/projectile/bullet/blasting

/obj/projectile/bullet/blasting
	name = "bolt of blasting"
	damage = 20
	embed_type = null

/datum/atom_skin/blasting_rod
	abstract_type = /datum/atom_skin/blasting_rod
	change_base_icon_state = TRUE

/datum/atom_skin/blasting_rod/default
	preview_name = "Default"
	new_icon_state = "c38"

/datum/atom_skin/blasting_rod/fitz
	preview_name = "Fitz Special"
	new_icon_state = "c38_fitz"

/datum/atom_skin/blasting_rod/police
	preview_name = "Police Positive Special"
	new_icon_state = "c38_police"

/datum/atom_skin/blasting_rod/blued
	preview_name = "Blued Steel"
	new_icon_state = "c38_blued"

/datum/atom_skin/blasting_rod/blued
	preview_name = "Stainless Steel"
	new_icon_state = "c38_stainless"

/datum/atom_skin/blasting_rod/trim
	preview_name = "Gold Trim"
	new_icon_state = "c38_trim"

/datum/atom_skin/blasting_rod/gold
	preview_name = "Golden"
	new_icon_state = "c38_gold"

/datum/atom_skin/blasting_rod/peacemaker
	preview_name = "The Peacemaker"
	new_icon_state = "c38_peacemaker"

/datum/atom_skin/blasting_rod/panther
	preview_name = "Black Panther"
	new_icon_state = "c38_panther"
