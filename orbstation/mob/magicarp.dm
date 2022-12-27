// Removes some disruptive spells from the chaos magicarp
GLOBAL_LIST_INIT(orb_chaos_magicarp_spell_types, list(
	/obj/projectile/magic/animate = "dancing",
	/obj/projectile/magic/arcane_barrage = "arcane",
	/obj/projectile/magic/door = "unbarred",
	/obj/projectile/magic/fireball = "blazing",
	/obj/projectile/magic/resurrection = "vital",
	/obj/projectile/magic/spellblade = "vorpal",
	/obj/projectile/magic/teleport = "warping",
	/obj/projectile/magic/babel = "babbling",
))

/mob/living/basic/carp/magic/chaos/spell_list()
	return GLOB.orb_chaos_magicarp_spell_types
