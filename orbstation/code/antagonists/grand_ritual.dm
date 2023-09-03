/obj/effect/grand_rune
	/// Things orbers might yell when invoking a rune
	var/static/list/orb_magic_words = list(
		list("...", "...... heh.", "*snap"),
		list("Cuh'men Cee Im!", "Cuh'men Mee Im!", "E'shur Bes Fren!"),
		list("Drivaron Ple'ez!", "Shabadoobie!", "Henshin!!"),
		list("Eenie, meenie... ", "Miney... ", "Mo!!"),
		list("Halev Li'af!", "Epizadh!", "Free!!"),
		list("He he!", "Ha ha!", "BOBO!!"),
		list("Nake...", "Snake...", "Cobura, Cobura!"),
		list("One and a...", "Two and a...", "One Two Three Four!!"),
		list("Ora!", "Dora!", "Mudah!!"),
		list("Planetary Revolution!", "Ten Evil Stars!", "Hell and Heaven Meltdown!!"),
		list("Snap! Click! Clank! Whirr! Whizz! Wham! Boom!", "Crack! Thoom! Snap! Bam! Bim! Bang! Zoom!", "Nearsoon, Firebloom, Crimson FOOM!!"),
		list("The arcane is mine to command!", "Yawn wide, ever-hungering void!", "Behold, a sorcerer of eld!!"),
		list("T'yu! T'mei!", "T'yu! T'mei! T'yu! T'mei!", "O'dere! O'dere O'dere!!"),
		list("Up Up Down Down...", "Left Right Left Right...", "A B Start!!"),
	)

/obj/effect/grand_rune/Initialize(mapload, potency = 0)
	. = ..()
	magic_words = pick(possible_magic_words + orb_magic_words)

/datum/grand_finale/armageddon
	/// Things orbers might say before they die
	var/static/list/orb_last_words = list(
		"And now the scales will tip!",
		"Chaos... Control!!",
		"Death, and death alone!",
		"Denizens of the abyss! From ink of blackest night, I summon you! Darkness to me!",
		"Destruction of nature, gather in flame!",
		"Even the strongest of shields cannot defend the weakest of wills!",
		"From broken skies fall tears of flame!",
		"Leave naught but ash in your wake!",
		"Let seep sorrow into your hearts!",
		"My life's work! My masterpiece!",
		"Raise your swords against the coming night!",
		"Rejoice and partake of my gift!",
		"Scurry and scatter!",
		"The gods will not be watching.",
		"The hearts of men are black with corruption and must needs be cleansed!",
		"There is time enough for regret in the flames of hell.",
		"Your journey ends here!",
		"You shall rue the day you raised your eyes to the heavens.",
		"Your very soul shall not escape my wrath!",
	)

// Don't summon people off the emergency shuttle
/datum/grand_side_effect/summon_crewmate/is_valid_crewmate(mob/living/carbon/human/crewmate, area/our_area)
	. = ..()
	if (!.)
		return FALSE

	return is_station_level(crewmate.z) || is_mining_level(crewmate.z)
