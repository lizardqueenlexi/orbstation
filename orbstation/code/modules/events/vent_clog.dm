/// Wizard or admin vent clog with weird animals
/datum/round_event_control/vent_clog/fantastical
	name = "Vent Clog: Fantastical"
	typepath = /datum/round_event/vent_clog/fantastical
	weight = 0
	max_occurrences = 0
	description = "Dangerous magical mobs climb out of a scrubber."

/datum/round_event/vent_clog/fantastical/setup()
	. = ..()
	spawn_delay = rand(15, 25)
	maximum_spawns = rand(3, 5)
	filth_spawn_types = list(
		/obj/effect/decal/cleanable/blood/xeno,
		/obj/effect/decal/cleanable/fuel_pool,
		/obj/effect/decal/cleanable/greenglow,
		/obj/effect/decal/cleanable/vomit,
	)

/datum/round_event/vent_clog/fantastical/get_mob()
	var/static/list/mob_list = list(
		/mob/living/basic/slime/random,
		/mob/living/basic/skeleton,
		/mob/living/basic/killer_tomato,
		/mob/living/simple_animal/hostile/ooze,
		/mob/living/basic/legion_brood,
	)
	return pick(mob_list)

/datum/round_event/vent_clog/fantastical/announce()
	priority_announce("Anomalous lifesigns detected in the [get_area_name(vent)] ventilation network.", "Security Alert")
