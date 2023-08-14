
// Orb override to climb calmly out of a chasm instead of hurling yourself in a random direction
/obj/effect/abstract/chasm_storage/on_revive(mob/living/escapee)
	var/turf/turf = get_turf(src)

	if(!turf.GetComponent(/datum/component/chasm))
		return ..() // Fall back to break through the floor by flinging

	var/turf/escape_turf = get_nearest_safe_turf(turf)
	if (!escape_turf)
		return ..() // Fall back to flinging

	turf.visible_message(span_boldwarning("After a long climb, [escapee] emerges from [turf]!"))
	escapee.forceMove(escape_turf)
	escapee.Paralyze(5 SECONDS, TRUE)
	UnregisterSignal(escapee, COMSIG_LIVING_REVIVE)

/obj/effect/abstract/chasm_storage/proc/get_nearest_safe_turf(atom/chasm)
	var/list/nearby_open_turfs = list()
	for (var/turf/open/sanctuary in orange(3, chasm))
		if (sanctuary.is_blocked_turf(exclude_mobs = FALSE) || ischasm(sanctuary) || islava(sanctuary))
			continue
		nearby_open_turfs += sanctuary

	if (!length(nearby_open_turfs))
		return null
	return get_closest_atom(/turf/, nearby_open_turfs, chasm)
