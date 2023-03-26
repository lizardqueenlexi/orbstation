// A custom phobia for the heretic to give to people they sacrifice, permanently.
// Very similar to the supernatural phobia, but more curated - because it's weird that sacrifices make you afraid of
// wizards and skeletons.

/datum/brain_trauma/mild/phobia/mansus
	phobia_type = "the mansus"
	random_gain = FALSE
	var/list/garbage_text = list(
		"bF7pTtzKE{xiiR6K?:#e>++",
		"0X~o$^f?j&W/IFfaFZ]",
		"HA4>S$t&mDSHANDb~=A#^DS",
		"\[`}<`j)?(K5#;C",
		"(/Q(@@@XX/'u-hZ/e)X\"pMPUG@j1*",
		"FATAL ERROR 20442: THERE IS NOT ENOUGH STORAGE TO REPRESENT THE ARRAY VALUE",
		"the supernY#@@P^eletont&$m5#animer&q\"I\[_j?a!spiracies",
		"phobia of phobia of phobia of phobia of ph",
		"\[REDACTED BY ORDER OF NT DEPARTMENT 333]",
	)

/datum/brain_trauma/mild/phobia/mansus/New(new_phobia_type)
	. = ..()
	gain_text = "<span class='hypnophrase'>Your mind reels. The hands cloud your every thought... Fear grips you.</span>"
	lose_text = "<span class='notice'>The hands are a distant memory now. You're not sure what you were afraid of...</span>"
	scan_desc = "phobia of "
	scan_desc += pick(garbage_text)

// Don't get spooked by invisible robes
/datum/brain_trauma/mild/phobia/mansus/valid_atom(atom/checked)
	. = ..()
	if (!. || !istype(checked, /obj/item/clothing/suit/hooded/cultrobes/void))
		return .
	var/obj/item/clothing/suit/hooded/cultrobes/void/void_robes = checked
	return !void_robes.hood_up
