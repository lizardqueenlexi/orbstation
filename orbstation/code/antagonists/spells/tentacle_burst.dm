/**
 * Spawns goliath tentacles in an expanding circle around you.
 */
/datum/action/cooldown/spell/aoe_staggered/tentacle_burst
	name = "Tentacle Burst"
	desc = "Conjure a wave of tentacles from the ground to grapple your foes."
	background_icon_state = "bg_demon"
	button_icon = 'icons/mob/simple/lavaland/lavaland_monsters.dmi'
	button_icon_state = "goliath_tentacle_spawn"
	sound = 'sound/magic/demon_attack1.ogg'
	aoe_radius = 5
	cooldown_time = 30 SECONDS
	cooldown_reduction_per_rank = 5 SECONDS

/datum/action/cooldown/spell/aoe_staggered/tentacle_burst/cast(atom/cast_on)
	if(isliving(owner))
		var/mob/living/living_owner = owner
		living_owner.apply_status_effect(/datum/status_effect/tentacle_mastery)
	. = ..()

/datum/action/cooldown/spell/aoe_staggered/tentacle_burst/get_things_to_cast_on(atom/center)
	var/list/things = list()
	for (var/turf/nearby_turf in view(aoe_radius, center))
		if (nearby_turf == center)
			continue
		if (nearby_turf.density)
			continue
		things += nearby_turf
	return things

/datum/action/cooldown/spell/aoe_staggered/tentacle_burst/cast_on_thing_in_aoe(turf/target_loc, atom/caster, range)
	new /obj/effect/goliath_tentacle/magic(target_loc)

/// Extended goliath tentacle for spell modification
/obj/effect/goliath_tentacle/magic
	name = "conjured tentacle"
	/// Time to grab the target for
	var/disable_time = 6 SECONDS

/datum/status_effect/tentacle_mastery
	id = "tentacle_mastery"
	duration = 4 SECONDS
	alert_type = null
	status_type = STATUS_EFFECT_REFRESH

/datum/status_effect/tentacle_mastery/on_apply()
	. = ..()
	owner.add_traits(list(TRAIT_TENTACLE_IMMUNE), TRAIT_STATUS_EFFECT(id))
	to_chat(owner, span_notice("The tentacles dance at your whim!"))

/datum/status_effect/tentacle_mastery/on_remove()
	. = ..()
	owner.remove_traits(list(TRAIT_TENTACLE_IMMUNE), TRAIT_STATUS_EFFECT(id))
	to_chat(owner, span_notice("Tentacles no longer care about you."))
