// Neurotoxin does stamina damage over time
/obj/projectile/neurotoxin
	paralyze = 0 SECONDS
	/// If we should stamina crit people
	var/apply_debuff = TRUE

/obj/projectile/neurotoxin/damaging
	apply_debuff = FALSE

/obj/projectile/neurotoxin/on_hit(mob/living/target, blocked = 0, pierce_hit)
	if (isalien(target))
		return ..()
	if (apply_debuff && istype(target))
		target.apply_status_effect(/datum/status_effect/xeno_neurotoxin, blocked)
	return ..()

/// Deals stamina damage on application and more over time
/datum/status_effect/xeno_neurotoxin
	duration = 6 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/xeno_neurotoxin
	/// Stamina damage to apply on application or refresh
	var/instant_damage = 20
	/// Stamina damage to apply every second while debuff is active
	var/damage_per_tick = 6

/atom/movable/screen/alert/status_effect/xeno_neurotoxin
	name = "Neurotoxicity"
	desc = "You can feel yourself going numb."
	icon_state = "woozy"

/datum/status_effect/xeno_neurotoxin/on_creation(mob/living/new_owner, blocked_amount)
	duration = blocked_scaling(initial(duration), blocked_amount)
	instant_damage = blocked_scaling(initial(instant_damage), blocked_amount)
	return ..()

/datum/status_effect/xeno_neurotoxin/on_apply()
	. = ..()
	owner.apply_damage(instant_damage, damagetype = STAMINA)

/datum/status_effect/xeno_neurotoxin/refresh(effect, blocked_amount)
	instant_damage = blocked_scaling(initial(instant_damage), blocked_amount)
	duration += blocked_scaling(initial(duration), blocked_amount)
	owner.apply_damage(blocked_scaling(instant_damage, blocked_amount), damagetype = STAMINA)

/datum/status_effect/xeno_neurotoxin/tick(delta_time, times_fired)
	owner.apply_damage(damage_per_tick, damagetype = STAMINA)
	if(HAS_TRAIT_FROM(owner, TRAIT_INCAPACITATED, STAMINA)) // Entered stamina crit
		qdel(src)

/// If the target is wearing something which blocks or partially blocks neurotoxin, reduce the damage & duration
/datum/status_effect/xeno_neurotoxin/proc/blocked_scaling(value, blocked_percent)
	var/scaler = (100 - blocked_percent) / 100
	return value * scaler
