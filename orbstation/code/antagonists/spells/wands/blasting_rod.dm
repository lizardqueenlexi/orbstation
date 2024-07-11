/// A revolver with infinite ammo, pretending to be a wand.
/obj/item/gun/blasting_rod
	name = "Rod of Blasting"
	desc = "A wand at the cutting edge of magical research. Conjures holes in targets with startling speed and accuracy by aetherically accelerating small pieces of metal."
	icon_state = "c38"
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	fire_delay = 1 SECONDS
	obj_flags = NONE
	unique_reskin = list(
		"Default" = "c38",
		"Fitz Special" = "c38_fitz",
		"Police Positive Special" = "c38_police",
		"Blued Steel" = "c38_blued",
		"Stainless Steel" = "c38_stainless",
		"Gold Trim" = "c38_trim",
		"Golden" = "c38_gold",
		"The Peacemaker" = "c38_peacemaker",
		"Black Panther" = "c38_panther"
	)

/obj/item/gun/blasting_rod/Initialize(mapload)
	. = ..()
	chambered = new /obj/item/ammo_casing/blasting(src)

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
