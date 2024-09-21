GLOBAL_VAR_INIT(LOOC_COLOR, null)//If this is null, use the CSS for OOC. Otherwise, use a custom colour.
GLOBAL_VAR_INIT(NORMAL_LOOC_COLOR, "#f29180")

///talking in Local OOC uses this
/client/verb/looc(msg as text)
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view."
	set category = "OOC"

	if(GLOB.say_disabled) //This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return

	if(!mob)
		return

	if(!holder)
		if(!GLOB.looc_allowed)
			to_chat(src, span_danger("LOOC is globally muted."))
			return
		if(!GLOB.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, span_danger("OOC for dead mobs has been turned off."))
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, span_danger("You cannot use OOC (muted)."))
			return
	if(is_banned_from(ckey, "OOC"))
		to_chat(src, span_danger("You have been banned from OOC."))
		return
	if(QDELETED(src))
		return

	msg = trim(copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN))
	var/raw_msg = msg

	var/list/filter_result = is_ooc_filtered(msg)
	if (!CAN_BYPASS_FILTER(usr) && filter_result)
		REPORT_CHAT_FILTER_TO_USER(usr, filter_result)
		log_filter("LOOC", msg, filter_result)
		return

	// Protect filter bypassers from themselves.
	// Demote hard filter results to soft filter results if necessary due to the danger of accidentally speaking in OOC.
	var/list/soft_filter_result = filter_result || is_soft_ooc_filtered(msg)

	if (soft_filter_result)
		if(tgui_alert(usr,"Your message contains \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\". \"[soft_filter_result[CHAT_FILTER_INDEX_REASON]]\", Are you sure you want to say it?", "Soft Blocked Word", list("Yes", "No")) != "Yes")
			return
		message_admins("[ADMIN_LOOKUPFLW(usr)] has passed the soft filter for \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\" they may be using a disallowed term. Message: \"[msg]\"")
		log_admin_private("[key_name(usr)] has passed the soft filter for \"[soft_filter_result[CHAT_FILTER_INDEX_WORD]]\" they may be using a disallowed term. Message: \"[msg]\"")

	if(!msg)
		return

	msg = emoji_parse(msg)

	if(SSticker.HasRoundStarted() && ((msg[1] in list(".",";",":","#")) || findtext_char(msg, "say", 1, 5)))
		if(tgui_alert(usr,"Your message \"[raw_msg]\" looks like it was meant for in game communication, say it in LOOC?", "Meant for LOOC?", list("Yes", "No")) != "Yes")
			return

	if(!holder)
		if(handle_spam_prevention(msg,MUTE_OOC))
			return
		if(findtext(msg, "byond://"))
			to_chat(src, span_boldannounce("<B>Advertising other servers is not allowed.</B>"))
			log_admin("[key_name(src)] has attempted to advertise in LOOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in LOOC: [msg]")
			return

	if(!(prefs.chat_toggles & CHAT_OOC))
		to_chat(src, span_danger("You have OOC muted."))
		return

	mob.log_talk(raw_msg, LOG_OOC, tag="LOOC")

	var/list/heard
	if(isobserver(src.mob)) //if ghost, LOOC should originate from your corpse (if you have one)
		if(!src.mob.mind)
			to_chat(src, span_warning("You have no body."))
			return
		if(src.mob.mind.current.key && src.mob.mind.current.key[1] != "@")
			to_chat(src, span_warning("Someone else is using your body! You can't LOOC right now."))
			return
		heard = get_hearers_in_view(7, src.mob.mind.current)
	else
		heard = get_hearers_in_view(7, src.mob)
	var/keyname = key
	for(var/mob/M in heard)
		var/client/C
		if(!M.client)
			if(M.mind) //check if this corpse has a mind, even if it has no client
				var/mob/dead/observer/ghost = M.mind.get_ghost(FALSE,TRUE)
				if(!ghost || !ghost.client) //no ghost, or no client for the ghost
					continue
				C = ghost.client
			else
				continue
		else
			C = M.client
		if(isobserver(M))
			continue //LOOC should not be directly intercepted by ghosts - only relayed via corpse
		if(C.prefs.chat_toggles & CHAT_OOC)
			if(GLOB.LOOC_COLOR)
				to_chat(C, "<font color='[GLOB.LOOC_COLOR]'><b><span class='prefix'>LOOC:</span> <EM>[src.mob.name] ([keyname]):</EM> <span class='message'>[msg]</span></b></font>")
			else
				to_chat(C, "<font color='[GLOB.NORMAL_LOOC_COLOR]'><b><span class='prefix'>LOOC:</span> <EM>[src.mob.name] ([keyname]):</EM> <span class='message'>[msg]</span></b></font>")

	//LOOC messages are also sent to all admins in a separate admin-LOOC message type
	msg = "<span class='looc'>[ADMIN_FLW(usr)] <span class='prefix'>LOOC:</span> <EM>[keyname]/[src.mob.name]:</EM> <span class='message'>[msg]</span></span>"
	to_chat(GLOB.admins,
		type = MESSAGE_TYPE_ADMINLOOC,
		html = msg)
