/datum/round_event_control/operative
	weight = 5 //May need adjusting, lone op should be rare but not nonexistent.
	min_players = 15 //We probably don't want lone ops at extremely low population.
	earliest_start = 20 MINUTES

//The nuke disk no longer changes the weight of lone op.
/obj/item/disk/nuclear/secured_process(last_move)
	return

/obj/item/disk/nuclear/unsecured_process(last_move)
	return
