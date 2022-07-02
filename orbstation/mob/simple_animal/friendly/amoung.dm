//" Among Us Promise "

//I promise you, in full not part

//That Among Us Creatures come first in my heart

//Whether it be night or day

//A game of Among Us, I'd love to play!

//Recite this promise if you would drop everything to play a game of "Among Us" - no matter the costs.

/mob/living/simple_animal/amoung //default color is red, others are defined below
	name = "amoung"
	desc = "What a fascinating and strange little creature. Probably harmless?"
	icon = 'orbstation/icons/mob/amoung.dmi'
	icon_state = "amoung"
	icon_living = "amoung"
	icon_dead = "amoung_dead"
	turns_per_move = 3
	response_help_continuous = "bumps"
	response_help_simple = "bump"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "attacks"
	response_harm_simple = "attack"
	speak_emote = list("communicates")
	maxHealth = 25
	health = 25
	harm_intent_damage = 1
	friendly_verb_continuous = "nudges"
	friendly_verb_simple = "nudge"
	density = FALSE
	mob_biotypes = MOB_ORGANIC
	gold_core_spawnable = FRIENDLY_SPAWN
	verb_say = "communicates"
	verb_ask = "communicates"
	verb_exclaim = "communicates"
	verb_yell = "communicates"
	dextrous = TRUE
	gender = NEUTER
	footstep_type = FOOTSTEP_MOB_SHOE
	held_items = list(null, null)
	greyscale_colors = "#ffffff"
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

/mob/living/simple_animal/amoung/Initialize(mapload)
	. = ..()
	random_colour()
	set_greyscale(new_config=/datum/greyscale_config/amoung)
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

///picks a random colour for our amoung
/mob/living/simple_animal/amoung/proc/random_colour()
	var/our_color = pick(amoung_colors)
	set_greyscale(colors=list(amoung_colors[our_color]))

/mob/living/simple_animal/amoung/bee_friendly()
	return TRUE //why not lol

	//amoung pequeño amoung pequeño amoung pequeño amoung pequeño amoung pequeño
	//amoung pequeño amoung pequeño amoung pequeño amoung pequeño amoung pequeño

/mob/living/simple_animal/amoung/pequeno
	name = "amoung pequeño"
	desc = "What a sooooo small creature. Probably harmless?"
	icon_state = "amoung_pequeno"
	icon_living = "amoung_pequeno"
	icon_dead = "amoung_pequeno_dead"

/mob/living/simple_animal/amoung/pequeno/Initialize(mapload)
	. = ..()
	set_greyscale(new_config=/datum/greyscale_config/amoung_pequeno)

