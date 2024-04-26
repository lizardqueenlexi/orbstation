ADMIN_VERB(toggle_looc, R_ADMIN, "Toggle Local OOC", "Toggle the Local OOC channel on or off.", ADMIN_CATEGORY_SERVER)
	toggle_looc()
	log_admin("[key_name(usr)] toggled LOOC.")
	message_admins("[key_name_admin(usr)] toggled LOOC.")
	SSblackbox.record_feedback("nested tally", "admin_toggle", 1, list("Toggle Local OOC", "[GLOB.looc_allowed ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
