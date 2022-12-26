/datum/round_event_control/portal_storm_carp
	name = "Portal Storm: Space Carp"
	typepath = /datum/round_event/portal_storm/carp
	weight = 2
	min_players = 15
	earliest_start = 15 MINUTES
	category = EVENT_CATEGORY_ENTITIES
	description = "Carp pour out of portals."

/datum/round_event/portal_storm/carp
	boss_types = list(/mob/living/basic/carp/mega = 2)
	hostile_types = list(/mob/living/basic/carp = 10,)

/datum/round_event_control/portal_storm_clown
	name = "Portal Storm: Clowns"
	typepath = /datum/round_event/portal_storm/clown
	weight = 2
	min_players = 15
	earliest_start = 15 MINUTES
	category = EVENT_CATEGORY_ENTITIES
	description = "Clowns pour out of portals."

/datum/round_event/portal_storm/clown
	boss_types = list(/mob/living/simple_animal/hostile/retaliate/clown/clownhulk/chlown = 1,
		/mob/living/simple_animal/hostile/retaliate/clown/clownhulk/honcmunculus = 1)
	hostile_types = list(/mob/living/simple_animal/hostile/retaliate/clown = 6,\
						/mob/living/simple_animal/hostile/retaliate/clown/lube = 2, \
						/mob/living/simple_animal/hostile/retaliate/clown/honkling = 1, \
						/mob/living/simple_animal/hostile/retaliate/clown/longface = 1, )
