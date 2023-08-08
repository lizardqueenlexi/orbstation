// Variant of the poisonous bees summoned by the "Anthophillia" holodeck simulation, which die after stinging once.
/mob/living/basic/bee/toxin/holo
	name = "holographic bee"
	desc = "Someone should probably turn that simulation off, huh?"
	ai_controller = /datum/ai_controller/basic_controller/bee/holo

/obj/effect/holodeck_effect/mobspawner/bee
	mobtype = /mob/living/basic/bee/toxin/holo

// A special basic melee attack that kills the user immediately
/datum/ai_behavior/basic_melee_attack/die_immediately

/datum/ai_behavior/basic_melee_attack/die_immediately/finish_action(datum/ai_controller/controller, succeeded, target_key, targetting_datum_key, hiding_location_key)
	. = ..()
	if(succeeded)
		var/mob/living/basic/bee = controller.pawn
		bee.death()

/datum/ai_planning_subtree/basic_melee_attack_subtree/die_immediately
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/die_immediately

/datum/ai_controller/basic_controller/bee/holo
	planning_subtrees = list(
		/datum/ai_planning_subtree/find_valid_home,
		/datum/ai_planning_subtree/enter_exit_home,
		/datum/ai_planning_subtree/find_and_hunt_target/pollinate,
		/datum/ai_planning_subtree/simple_find_target/bee,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/die_immediately,
	)
