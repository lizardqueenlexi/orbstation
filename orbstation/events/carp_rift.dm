/**
 * Creates a dragon-less carp rift for ghosts to amuse themselves with
 */
/datum/round_event_control/carp_rift
	name = "Open Carp Rift"
	typepath = /datum/round_event/carp_rift
	weight = 7
	max_occurrences = 2
	min_players = 15
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns a rift to the carp dimension, which ghosts can use to become carps."

/datum/round_event/carp_rift
	/// Where is the rift spawning?
	var/turf/landing_area

/datum/round_event/carp_rift/start()
	landing_area = get_safe_random_station_turf()
	if(!landing_area)
		return
	var/obj/structure/carp_rift/minor/rift = new (landing_area)
	new /mob/living/basic/carp/mega(landing_area)
	announce_to_ghosts(rift)

/datum/round_event/carp_rift/announce(fake)
	var/area/danger_zone = get_area(landing_area)
	priority_announce("A large organic energy flux has been recorded in the [danger_zone.name], please stand by.", "Lifesign Alert")

/**
 * This carp rift doesn't have the charging behaviour and has less armour, any weapon should damage it.
 * Conversely because there's fewer ghosts it also summons a handful of NPC carp.
 */
/obj/structure/carp_rift/minor
	armor_type = /datum/armor/none
	max_charge = INFINITY

/obj/structure/carp_rift/minor/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/spawner, \
		_spawn_time = 15 SECONDS, \
		_max_mobs = 3, \
		_faction = list("carp"))
