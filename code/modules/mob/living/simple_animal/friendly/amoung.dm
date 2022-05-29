//" Among Us Promise "

//I promise you, in full not part

//That Among Us Creatures come first in my heart

//Whether it be night or day

//A game of Among Us, I'd love to play!

//Recite this promise if you would drop everything to play a game of "Among Us" - no matter the costs.

/mob/living/simple_animal/amoung //default color is red, others are defined below
	name = "amoung"
	desc = "What a fascinating and strange little creature. Probably harmless?"
	icon = 'icons/mob/amoung.dmi'
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

/mob/living/simple_animal/amoung/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/simple_animal/amoung/bee_friendly()
	return TRUE //why not lol

/mob/living/simple_animal/amoung/blue
	icon_state = "amoung_blue"
	icon_living = "amoung_blue"
	icon_dead = "amoung_blue_dead"

/mob/living/simple_animal/amoung/green
	icon_state = "amoung_green"
	icon_living = "amoung_green"
	icon_dead = "amoung_green_dead"

/mob/living/simple_animal/amoung/pink
	icon_state = "amoung_pink"
	icon_living = "amoung_pink"
	icon_dead = "amoung_pink_dead"

/mob/living/simple_animal/amoung/orange
	icon_state = "amoung_orange"
	icon_living = "amoung_orange"
	icon_dead = "amoung_orange_dead"

/mob/living/simple_animal/amoung/yellow
	icon_state = "amoung_yellow"
	icon_living = "amoung_yellow"
	icon_dead = "amoung_yellow_dead"

/mob/living/simple_animal/amoung/black
	icon_state = "amoung_black"
	icon_living = "amoung_black"
	icon_dead = "amoung_black_dead"

/mob/living/simple_animal/amoung/white
	icon_state = "amoung_white"
	icon_living = "amoung_white"
	icon_dead = "amoung_white_dead"

/mob/living/simple_animal/amoung/purple
	icon_state = "amoung_purple"
	icon_living = "amoung_purple"
	icon_dead = "amoung_purple_dead"

/mob/living/simple_animal/amoung/brown
	icon_state = "amoung_brown"
	icon_living = "amoung_brown"
	icon_dead = "amoung_brown_dead"

/mob/living/simple_animal/amoung/cyan
	icon_state = "amoung_cyan"
	icon_living = "amoung_cyan"
	icon_dead = "amoung_cyan_dead"

/mob/living/simple_animal/amoung/lime
	icon_state = "amoung_lime"
	icon_living = "amoung_lime"
	icon_dead = "amoung_lime_dead"