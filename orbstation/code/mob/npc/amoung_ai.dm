/datum/ai_controller/basic_controller/amoung
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/amoung,
		BB_VENTCRAWL_COOLDOWN = 3 MINUTES, // We mostly want them to stick around
		BB_TIME_TO_GIVE_UP_ON_VENT_PATHING = 30 SECONDS,
	)
	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

	planning_subtrees = list(
		/datum/ai_planning_subtree/random_speech/amoung,
		/datum/ai_planning_subtree/random_speech/emergency,
		/datum/ai_planning_subtree/opportunistic_ventcrawler/amoung,
		/datum/ai_planning_subtree/amoung_impostor,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
	)

/datum/targeting_strategy/amoung

/datum/targeting_strategy/amoung/can_attack(mob/living/living_mob, mob/living/target, vision_range)
	if (isliving(target))
		return target.stat != DEAD
	return FALSE

/datum/ai_planning_subtree/random_speech/amoung
	speech_chance = 2
	speak = list("b", "bbb", "bui~")
	sound = list('sound/items/radio/radio_receive.ogg')

/datum/ai_planning_subtree/random_speech/emergency
	speech_chance = 0.01
	speak = list("impostor!", "sus!")
	sound = list('orbstation/sound/creatures/emergency_meeting.ogg')

/datum/ai_planning_subtree/amoung_impostor

/datum/ai_planning_subtree/amoung_impostor/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	if (!controller.blackboard[BB_AMOUNG_IMPOSTOR])
		return
	if (prob(90))
		return
	for (var/mob/living/carbon/human/watcher in hearers(7, controller.pawn))
		if (watcher.stat != DEAD)
			return
	controller.queue_behavior(/datum/ai_behavior/target_nearby_amoung)

/datum/ai_behavior/target_nearby_amoung
	action_cooldown = 60 SECONDS // Don't thin out a crowd too quickly

/datum/ai_behavior/target_nearby_amoung/perform(seconds_per_tick, datum/ai_controller/controller)
	var/list/amoungs = list()
	for (var/mob/living/basic/amoung/innocent in hearers(7, controller.pawn))
		if (innocent.stat == DEAD || innocent.ai_controller?.blackboard[BB_AMOUNG_IMPOSTOR])
			continue
		amoungs += innocent

	if (length(amoungs))
		controller.set_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET, pick(amoungs))
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
	return AI_BEHAVIOR_FAILED

/datum/ai_planning_subtree/opportunistic_ventcrawler/amoung
	travel_behavior = /datum/ai_behavior/travel_towards/amoung

/datum/ai_behavior/travel_towards/amoung

/datum/ai_behavior/travel_towards/amoung/setup(datum/ai_controller/controller, target_key)
	if (world.time < (controller.blackboard[BB_AMOUNG_VENTCRAWL_COOLDOWN] || 0))
		return FALSE

	return ..()

/datum/ai_behavior/travel_towards/amoung/finish_action(datum/ai_controller/controller, succeeded, target_key)
	. = ..()
	clear_movement_target()
	if (!succeeded)
		controller.set_blackboard_key(BB_AMOUNG_VENTCRAWL_COOLDOWN, world.time + 3 MINUTES)
		to_chat(world, "ok we should have stopped?")
