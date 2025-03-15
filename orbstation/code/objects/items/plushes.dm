/obj/item/toy/plush/amoungplushie
	name = "amoung plushie"
	desc = "A cuddly toy depicting the dangerous and rare alien species, the Amoung. Seems kinda sus."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "amoungplush"
	attack_verb_continuous = list("suses", "stabs", "ejects")
	attack_verb_simple = list("sus", "stab", "eject")
	squeak_override = list('sound/mobs/non-humanoids/alien/alien_organ_cut.ogg' = 1)

/obj/item/toy/plush/tbhplushie
	name = "tbh plushie"
	desc = "A cuddly critter plushie. Its wide-eyed stare gives you a warm fuzzy feeling."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "tbhplush"
	attack_verb_continuous = list("yippees", "stares", "paws")
	attack_verb_simple = list("yippee", "stare", "paw")
	squeak_override = list('orbstation/sound/tbh_yippee.ogg' = 1)

/obj/item/toy/plush/milkinz
	name = "milkinz"
	desc = "A milk-soaked cat plushie. Its sad eyes bore into you despite its crusty exterior."
	icon = 'orbstation/icons/obj/items/plushes.dmi'
	icon_state = "milkinz"
	force = 5
	throwforce = 5
	attack_verb_continuous = list("squelches", "slaps", "slops")
	attack_verb_simple = list("squelch", "slap", "slop")
	squeak_override = list('sound/misc/splort.ogg' = 1)
