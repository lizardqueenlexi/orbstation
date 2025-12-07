/**
 * Variant mirror walk which requires robes.
 * Deals brute damage while in the mirror world, preventing you from hiding in there for long.
 * Someone who can walk through mirrors should be able to lay hands on a medkit.
 */
/datum/action/cooldown/spell/jaunt/mirror_walk/wizard
	name = "Enter Mirrors"
	background_icon_state = "bg_spell"
	desc = "Allows you to traverse invisibly and freely across the station within the realm of the mirror. \
		You can only enter and exit the realm of mirrors when nearby reflective surfaces and items, \
		such as windows, mirrors, and reflective walls or equipment. \
		You will slowly take damage while in the realm of the mirror, as it is not a place for corporeal creatures."
	spell_requirements = SPELL_REQUIRES_WIZARD_GARB|SPELL_REQUIRES_NO_ANTIMAGIC
	cooldown_reduction_per_rank = 1 SECONDS

/datum/action/cooldown/spell/jaunt/mirror_walk/wizard/enter_jaunt(mob/living/jaunter, turf/loc_override)
	var/obj/effect/dummy/phased_mob/jaunt_mover = ..()
	if (!jaunt_mover)
		return FALSE
	RegisterSignal(jaunter, COMSIG_MOB_STATCHANGE, PROC_REF(check_health))
	jaunter.apply_status_effect(/datum/status_effect/mirror_fracture)
	return jaunt_mover

/// Called when the jaunt mover effect is destroyed, this proc should exist on base class but doesn't, will refactor upstream
/datum/action/cooldown/spell/jaunt/mirror_walk/wizard/on_jaunt_exited(obj/effect/dummy/phased_mob/jaunt, mob/living/unjaunter)
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_STATCHANGE)
	var/mob/living/living_owner = owner
	if (!istype(living_owner))
		return
	living_owner.remove_status_effect(/datum/status_effect/mirror_fracture)

/datum/action/cooldown/spell/jaunt/mirror_walk/wizard/proc/check_health(mob/living/source)
	SIGNAL_HANDLER
	if (source.stat == CONSCIOUS)
		return
	//async this because it has a do_after in it
	INVOKE_ASYNC(src, PROC_REF(exit_jaunt_involuntarily), source)

/**
 * Drops you out of the mirror realm near a reflective surface
 * If there aren't any, picks random station turfs until we find one
 */
/datum/action/cooldown/spell/jaunt/mirror_walk/wizard/proc/exit_jaunt_involuntarily(mob/living/jaunter)
	var/turf/phase_turf = get_turf(jaunter)
	var/atom/nearby_reflection = is_reflection_nearby(phase_turf)
	if (!nearby_reflection)
		nearby_reflection = get_random_exit_location()
	if (!nearby_reflection)
		return // damn well good getting healed while you're intangible
	var/obj/effect/dummy/phased_mob/jaunt = jaunter.loc
	if (!jaunt)
		return // Shouldn't be possible
	jaunt.forceMove(get_turf(nearby_reflection))
	jaunt.eject_jaunter()
	playsound(jaunter, 'sound/effects/magic/ethereal_exit.ogg', 50, TRUE, -1)
	jaunter.visible_message(
		span_boldwarning("[jaunter] phases into reality before your very eyes!"),
		span_boldwarning("You manage to fling yourself out of the reflection coming off of [nearby_reflection] before you are completely destroyed!"))

/// Returns a valid exit point in a completely random place, or null if we can't find one quickly enough
/datum/action/cooldown/spell/jaunt/mirror_walk/wizard/proc/get_random_exit_location()
	var/tries = 0
	while (tries < 10)
		var/turf/check_turf = get_random_station_turf()
		var/atom/nearby_reflection = is_reflection_nearby(check_turf)
		if (nearby_reflection)
			return nearby_reflection
		tries++

/**
 * Hurts you while you are inside a mirror.
 */
/datum/status_effect/mirror_fracture
	id = "mirror_fracture"
	alert_type = /atom/movable/screen/alert/status_effect/mirror_fracture
	processing_speed = STATUS_EFFECT_NORMAL_PROCESS

/datum/status_effect/mirror_fracture/tick()
	var/mob/living/carbon/human/victim = owner
	victim.adjust_brute_loss(2) // Approximately 1 per second

/atom/movable/screen/alert/status_effect/mirror_fracture
	name = "Mirror fracture"
	desc = span_warning("While travelling the realm of mirrors your soul endures constant distortion!")
	icon_state = "embeddedobject"
