// Megafauna are dormant until activated
/mob/living/simple_animal/hostile/megafauna
	/// Megafauna are asleep when spawned, and can be activated upon click.
	var/dormant = TRUE
	/// Store original damage coefficient, initial() should work for this but didn't for some reason
	var/list/original_damage_coeff = list()
	AIStatus = AI_OFF

/mob/living/simple_animal/hostile/megafauna/Initialize(mapload)
	. = ..()
	original_damage_coeff = damage_coeff.Copy()
	damage_coeff = list(BRUTE = 0, BURN = 0, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0) // Oh fuck it's invincible
	add_filter("inactive_glow", 2, list("type" = "outline", "color" = "#ffff0048", "size" = 2))
	update_appearance()

/mob/living/simple_animal/hostile/megafauna/attack_hand(mob/living/user, list/modifiers)
	if (!dormant)
		return ..()
	user.visible_message(span_bolddanger("[user] begins to awaken [src]!"))
	if (!do_after(user, 5 SECONDS, target = src, interaction_key = REF(user)))
		return
	dormant = FALSE
	src.visible_message(span_bolddanger("[src] is about to awaken!"))
	playsound(loc,'sound/music/antag/bloodcult/narsie_rises.ogg', 100, FALSE, 50, TRUE, TRUE)
	addtimer(CALLBACK(src, PROC_REF(awaken)), 5 SECONDS)

/// Make it not invulnerable and also angry
/mob/living/simple_animal/hostile/megafauna/proc/awaken(mob/living/future_corpse)
	src.visible_message(span_bolddanger("[src] has awakened!"))
	playsound(loc,'sound/effects/tendril_destroyed.ogg', 100, FALSE, 50, TRUE, TRUE)
	remove_filter("inactive_glow")
	update_appearance()
	toggle_ai(AI_ON)
	damage_coeff = original_damage_coeff.Copy()
	FindTarget(list(future_corpse))

/mob/living/simple_animal/hostile/megafauna/examine(mob/user)
	. = ..()
	if (dormant)
		. += span_warning("It seems to be dormant, but could be awakened by clicking on it.")
