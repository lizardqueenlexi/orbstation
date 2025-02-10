//" Among Us Promise "
//I promise you, in full not part
//That Among Us Creatures come first in my heart
//Whether it be night or day
//A game of Among Us, I'd love to play!
//Recite this promise if you would drop everything to play a game of "Among Us" - no matter the costs.

/mob/living/basic/amoung //default color is red, others are defined below
	name = "amoung"
	desc = "What a fascinating and strange little creature. Probably harmless?"
	icon = 'orbstation/icons/mob/amoung.dmi'
	icon_state = "amoung"
	icon_living = "amoung"
	icon_dead = "amoung_dead"
	speed = 1
	response_help_continuous = "bumps"
	response_help_simple = "bump"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "attacks"
	response_harm_simple = "attack"
	speak_emote = list("communicates")
	maxHealth = 25
	health = 25
	friendly_verb_continuous = "nudges"
	friendly_verb_simple = "nudge"
	mob_biotypes = MOB_ORGANIC
	gold_core_spawnable = FRIENDLY_SPAWN
	verb_say = "communicates"
	verb_ask = "communicates"
	verb_exclaim = "communicates"
	verb_yell = "communicates"
	gender = NEUTER
	hud_type = /datum/hud/dextrous
	held_items = list(null, null)
	greyscale_colors = "#ffffff"
	ai_controller = /datum/ai_controller/basic_controller/amoung
	// They're wearing space suits
	unsuitable_atmos_damage = 0
	unsuitable_cold_damage = 0
	unsuitable_heat_damage = 0
	/// Do we have hands?
	var/has_hands = TRUE
	/// List of possible amongus colours.
	var/static/list/amoung_colors = list(
		"red" = "#ff0033",
		"blue" = "#3366ff",
		"green" = "#10802d",
		"pink" = "#ee55ba",
		"yellow" = "#e9ea53",
		"black" = "#3f484e",
		"white" = "#d6e1f0",
		"purple" = "#6b30bc",
		"brown" = "#72491e",
		"cyan" = "#39e2dd",
		"lime" = "#50f038"
	)

/mob/living/basic/amoung/Initialize(mapload)
	. = ..()
	randomise_colour()
	give_hands()
	if (prob(2))
		make_impostor()
	set_greyscale(new_config=/datum/greyscale_config/amoung)
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_SHOE)

/mob/living/basic/amoung/melee_attack(atom/target, list/modifiers, ignore_cooldown)
	. = ..()
	if (!. || !ai_controller?.blackboard[BB_AMOUNG_IMPOSTOR] || HAS_TRAIT(src, TRAIT_PACIFISM))
		return
	if (!istype(target, /mob/living/basic/amoung))
		return
	var/mob/living/victim = target
	visible_message(span_boldwarning("[src] snaps [target]'s neck!"))
	playsound(victim, 'sound/effects/wounds/crack1.ogg', 100)
	victim.death()

/// Get some fingers
/mob/living/basic/amoung/proc/give_hands()
	if (!has_hands)
		return
	add_traits(list(TRAIT_ADVANCEDTOOLUSER, TRAIT_CAN_STRIP), ROUNDSTART_TRAIT)
	AddElement(/datum/element/dextrous)
	AddComponent(/datum/component/personal_crafting)
	AddComponent(/datum/component/basic_inhands)

/// Picks a random colour for our amoung
/mob/living/basic/amoung/proc/randomise_colour()
	var/our_color = pick(amoung_colors)
	set_greyscale(colors=list(amoung_colors[our_color]))

/// You are the impostor
/mob/living/basic/amoung/proc/make_impostor()
	ai_controller.set_blackboard_key(BB_AMOUNG_IMPOSTOR, TRUE)
	melee_damage_lower += 10
	melee_damage_upper += 15

/mob/living/basic/amoung/bee_friendly()
	return TRUE //why not lol

//amoung pequeño amoung pequeño amoung pequeño amoung pequeño amoung pequeño
//amoung pequeño amoung pequeño amoung pequeño amoung pequeño amoung pequeño

/mob/living/basic/amoung/pequeno
	name = "amoung pequeño"
	desc = "What a sooooo small creature. Probably harmless?"
	icon_state = "amoung_pequeno"
	icon_living = "amoung_pequeno"
	icon_dead = "amoung_pequeno_dead"
	/// Too small to hold things
	has_hands = FALSE

/mob/living/basic/amoung/pequeno/Initialize(mapload)
	. = ..()
	set_greyscale(new_config=/datum/greyscale_config/amoung_pequeno)

// corpse spawners, you monster

/obj/effect/mob_spawn/corpse/amoung
	mob_type = /mob/living/basic/amoung

/obj/effect/mob_spawn/corpse/amoung/pequeno
	mob_type = /mob/living/basic/amoung/pequeno
