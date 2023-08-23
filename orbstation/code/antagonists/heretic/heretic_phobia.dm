// Our changes to the heresy phobia that makes it spookier

/datum/brain_trauma/mild/phobia/heresy
	var/static/list/garbage_text = list(
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

/datum/brain_trauma/mild/phobia/heresy/New(new_phobia_type)
	. = ..()
	gain_text = span_hypnophrase("Your mind reels. The hands cloud your every thought... Fear grips you.")
	lose_text = span_notice("The hands are a distant memory now. You're not sure what you were afraid of...")
	scan_desc = "phobia of "
	scan_desc += pick(garbage_text)
