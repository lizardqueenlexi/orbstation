//Give the lone op three minutes to get set up before they have a chance of having their presence announced
#define LONEOP_ANNOUNCE_DELAY = 180

/datum/round_event_control/operative
	weight = 5 //may need adjusting, lone op should be rare but not nonexistent

//The nuke disk no longer changes the weight of lone op.
/obj/item/disk/nuclear/secured_process(last_move)
	return

/obj/item/disk/nuclear/unsecured_process(last_move)
	return
