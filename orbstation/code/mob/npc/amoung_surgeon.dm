// amoung... surgeon??
// Can probably be replaced when I do my future 'among us content expansion', if that ever happens

/mob/living/basic/cat_butcherer/Initialize(mapload)
	. = ..()
	new /mob/living/basic/amoung/surgeon(loc)
	return INITIALIZE_HINT_QDEL

/mob/living/basic/amoung/surgeon
	name = "suspicious surgeon"
	desc = "Hey! What's this guy up to?"
	icon = 'orbstation/icons/mob/amoung.dmi'
	icon_state = "amoung"
	icon_living = "amoung"
	icon_dead = "amoung_dead"
	basic_mob_flags = DEL_ON_DEATH
	maxHealth = 100
	health = 100
	verb_say = "purrs"
	verb_ask = "purrs"
	verb_exclaim = "loudly purrs"
	verb_yell = "loudly purrs"
	speak_emote = list("purrs", "meows")
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "slashes at"
	attack_verb_simple = "slash at"
	attack_sound = 'sound/items/weapons/circsawhit.ogg'
	combat_mode = TRUE
	mob_biotypes = MOB_ORGANIC
	sentience_type = SENTIENCE_HUMANOID
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("hostile")
	status_flags = CANPUSH
	ai_controller = /datum/ai_controller/basic_controller/amoung/hostile
	has_hands = FALSE

/mob/living/basic/amoung/surgeon/randomise_colour()
	set_greyscale(colors=list(amoung_colors["white"]))

/mob/living/basic/amoung/surgeon/make_impostor()
	return // already evil

// Shock twist!
/mob/living/basic/amoung/surgeon/death(gibbed)
	var/obj/effect/particle_effect/fluid/smoke/poof = new(get_turf(src))
	poof.lifetime = 2 SECONDS
	do_sparks(3, TRUE, src)
	visible_message(span_notice("[src] collapses to the ground! ...and something crawls out of its empty suit?"))

	new /obj/item/stack/cable_coil(loc)
	new /obj/item/stack/sheet/cloth(loc)
	new /obj/item/stock_parts/servo(loc)
	new /obj/item/circular_saw(loc)
	var/mob/living/basic/pet/cat/kitten/surgeon = new(loc)
	surgeon.name = "suspicious kitten"
	surgeon.desc = "You don't think this cat was... no... it couldn't be, could it?"
	return ..(TRUE)

/datum/ai_controller/basic_controller/amoung/hostile
	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

/datum/ai_controller/basic_controller/amoung/hostile
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path/carp, // Can't be bothered to change the subtype, it has the right cooldown
		/datum/ai_planning_subtree/basic_melee_attack_subtree/amoung/surgeon
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/amoung/surgeon
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/amoung/surgeon

/datum/ai_behavior/basic_melee_attack/amoung/surgeon
	action_cooldown = 1.5 SECONDS

/datum/ai_behavior/basic_melee_attack/amoung/surgeon/perform(delta_time, datum/ai_controller/controller, target_key, targeting_strategy_key, hiding_location_key)

	var/mob/living/basic/surgeon = controller.pawn
	var/datum/weakref/weak_target = controller.blackboard[target_key]
	var/atom/target = weak_target?.resolve()
	var/datum/targeting_strategy/targeting_strategy = controller.blackboard[targeting_strategy_key]

	if(!targeting_strategy.can_attack(surgeon, target))
		return
	if (!prob(35))
		return
	surgeon.say(pick(list("Meow!", "Esp!", "Purr!", "HSSSSS")))

	return ..()

/datum/greyscale_config/amoung
	name = "Amoung"
	icon_file = 'orbstation/icons/mob/amoung.dmi'
	json_config = 'code/datums/greyscale/json_configs/amoung.json'

/datum/greyscale_config/amoung_pequeno
	name = "Amoung Pequeno"
	icon_file = 'orbstation/icons/mob/amoung.dmi'
	json_config = 'code/datums/greyscale/json_configs/amoung_pequeno.json'
