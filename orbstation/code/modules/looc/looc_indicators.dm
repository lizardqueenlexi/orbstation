//Typing indicators when using LOOC chat.
/datum/tgui_say/proc/start_looc_thinking()
	if(!window_open || !client.typing_indicators)
		return FALSE
	ADD_TRAIT(client.mob, TRAIT_THINKING_LOOC, CURRENTLY_TYPING_TRAIT)
	client.mob.create_thinking_indicator()
