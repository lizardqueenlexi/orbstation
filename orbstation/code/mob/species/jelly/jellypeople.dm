/datum/species/jelly
	hair_alpha = 200

///JELLY
/obj/item/bodypart/head/jelly
	head_flags = HEAD_HAIR|HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN


/datum/species/jelly/get_scream_sound(mob/living/carbon/human/jelly)
	return 'orbstation/sound/voice/jelly/jelly_scream.ogg'

/datum/species/jelly/get_species_description()
	return "A relatively new race of sentient, humanoid slimes. \
		The jellypeople are insatiably curious and yet to form a cultural identity of their own."

/datum/species/jelly/get_species_lore()
	return list(
		"For years, jellypeople were little more than a scientific curiosity. \
		Occasionally some crazed xenobiologist would turn their flesh into jelly in some distant research outpost. \
		More rarely, one of the slimes they studied would show signs of sapience and — \
		mimicking those around them — would eventually take on a humanoid appearance.",

		"However, as human contact with slimes continues to increase, \
		a second generation of jellypeople has slowly emerged: \
		neither transformed scientist, nor ascended ooze, but carrying the slimy blood of both. \
		This new lineage of jellypeople is cautiously but eagerly spreading across the galaxy.",

		"Genial and intensely curious about the universe they've found themselves in, \
		the members of this nascent species restlessly seek out new places, new people, and new experiences. \
		They're drawn equally to bustling urban centers and to the far-off frontiers of space.",

		"Desperately seeking a place in the cosmos, jellyperson culture appears, to the outsider, wildly inconsistent — \
		the result of a thousand different cultural movements as they scramble for collective meaning." // thanks to mabel for this paragraph
)
