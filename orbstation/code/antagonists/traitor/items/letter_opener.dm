
/obj/item/knife/letter_opener
	name = "suspicious letter opener"
	desc = "A dangerously sharp letter opener in suspicious red and black. Looking at it, you almost forget that mail theft is a crime. But remember, your actions have consequences..."
	icon = 'orbstation/icons/obj/weapons/weapons.dmi'
	icon_state = "letteropener"
	inhand_icon_state = "letteropener"
	lefthand_file = 'orbstation/icons/obj/weapons/inhand_left.dmi'
	righthand_file = 'orbstation/icons/obj/weapons/inhand_right.dmi'
	force = 15
	throwforce = 15
	attack_verb_continuous = list("stabs", "opens", "felonies", "crimes")
	attack_verb_simple = list("stab", "open", "felony", "crime")
	sharpness = SHARP_POINTY //letter openers are better for stabbing than slashing
	wound_bonus = 0
	exposed_wound_bonus = 10

/datum/uplink_item/role_restricted/letter_opener
	name = "Letter Opener"
	desc = "A dangerously sharp letter opener. Its suspicious Syndicate branding reminds you that you're a criminal, \
		and you don't care that you're committing a federal crime! Which is to say, it lets you open other people's mail. \
		It can also serve as a weapon in a pinch."
	item = /obj/item/knife/letter_opener
	cost = 1
	restricted_roles = list(JOB_CARGO_TECHNICIAN, JOB_QUARTERMASTER)
	surplus = 10

//When attacking mail with this, you open it after a delay
/obj/item/mail/attackby(obj/item/attacking_item, mob/user, params)
	. = ..()
	if(!istype(attacking_item, /obj/item/knife/letter_opener))
		return
	to_chat(user, span_warning("You start to ILLEGALLY cut the package open..."))
	playsound(loc, 'sound/items/unsheath.ogg', 50, vary=TRUE)
	if(!do_after(user, 5 SECONDS, target = user))
		return
	user.temporarilyRemoveItemFromInventory(src, force=TRUE)
	if(length(contents))
		user.put_in_hands(contents[1])
	playsound(loc, 'sound/items/poster/poster_ripped.ogg', 50, vary=TRUE)
	var/turf/turf_loc = get_turf(user)
	new /obj/effect/decal/cleanable/wrapping(turf_loc) //leave scraps on the floor as evidence
	qdel(src)
