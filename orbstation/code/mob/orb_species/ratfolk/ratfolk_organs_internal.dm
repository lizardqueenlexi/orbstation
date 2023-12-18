#define CHEESE_RUSH_HUNGER_MODIFIER 4 // hunger increases this much faster under the effects of cheese rush

// EARS

/obj/item/organ/internal/ears/ratfolk
	name = "rat ears"
	icon = 'orbstation/icons/mob/species/ratfolk/bodyparts.dmi'
	icon_state = "ears_item"
	visual = TRUE
	damage_multiplier = 2
	var/ears_pref = null

/obj/item/organ/internal/ears/ratfolk/on_mob_insert(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.dna.features["mcolor"]
		if(ears_pref) // copy the ear shape from the old owner of the ears if there was one
			ear_owner.dna.features["rat_ears"] = ear_owner.dna.species.mutant_bodyparts["rat_ears"] = ears_pref
		else if(ear_owner.dna.features["rat_ears"]) // otherwise use their preference if there is one
			ear_owner.dna.species.mutant_bodyparts["rat_ears"] = ear_owner.dna.features["rat_ears"]
		else // otherwise default to round
			ear_owner.dna.features["rat_ears"] = ear_owner.dna.species.mutant_bodyparts["rat_ears"] = "Round"
		ear_owner.dna.update_uf_block(DNA_RAT_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/ratfolk/on_mob_remove(mob/living/carbon/human/ear_owner)
	. = ..()
	if(istype(ear_owner) && ear_owner.dna)
		color = ear_owner.dna.features["mcolor"]
		ears_pref = ear_owner.dna.features["rat_ears"]
		ear_owner.dna.species.mutant_bodyparts -= "rat_ears"
		ear_owner.update_body()

// EYES - better darkvision, sensitive to flash, lower health

/obj/item/organ/internal/eyes/ratfolk
	name = "rat eyes"
	maxHealth = 0.35 * STANDARD_ORGAN_THRESHOLD // more fragile than normal eyes
	flash_protect = FLASH_PROTECTION_SENSITIVE
	color_cutoffs = list(5, 5, 5)

// STOMACH - increases movespeed temporarily when you consume cheese reagent (found in raw cheese)

/obj/item/organ/internal/stomach/ratfolk
	name = "rat stomach"

/obj/item/organ/internal/stomach/ratfolk/on_life(delta_time, times_fired)
	var/datum/reagent/consumable/cheese/cheese = locate(/datum/reagent/consumable/cheese) in owner.reagents.reagent_list
	if(cheese?.volume)
		cheese.volume = min(cheese.volume, 30) // let's cap the amount of cheese you can have in your stomach
		owner.apply_status_effect(/datum/status_effect/cheese_rush)
	else
		owner.remove_status_effect(/datum/status_effect/cheese_rush)
	return ..()

/obj/item/organ/internal/stomach/ratfolk/on_mob_remove(mob/living/carbon/carbon)
	if(carbon.has_movespeed_modifier(/datum/movespeed_modifier/cheese_rush))
		to_chat(carbon, span_warning("You feel the effects of your cheese rush wear off."))
		carbon.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	return ..()

/**
 * Status effect: Increases move speed and hunger while you have cheese in you
 */
/datum/status_effect/cheese_rush
	id = "cheese_rush"
	alert_type = /atom/movable/screen/alert/status_effect/cheese_rush
	var/spawned_last_move = FALSE

/atom/movable/screen/alert/status_effect/cheese_rush
	name = "Cheese Rush"
	desc = "Your metabolism is going into overdrive, you feel dangerously cheesy!"
	icon_state = "lightningorb"

/datum/status_effect/cheese_rush/on_apply()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		human_owner.physiology.hunger_mod *= CHEESE_RUSH_HUNGER_MODIFIER // hunger increases faster in cheese rush mode
	owner.add_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	to_chat(owner, span_notice("The cheese gives you a sudden burst of energy!"))

/datum/status_effect/cheese_rush/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/human_owner = owner
		human_owner.physiology.hunger_mod /= CHEESE_RUSH_HUNGER_MODIFIER // hunger returns to normal
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	to_chat(owner, span_warning("You feel the effects of your cheese rush wear off."))

/datum/movespeed_modifier/cheese_rush
	multiplicative_slowdown = -0.3

// TONGUE

/obj/item/organ/internal/tongue/ratfolk
	name = "ratfolk tongue"
	desc = "If you look closely, you can see a fine layer of cheese dust. Or is that... brass?"
	say_mod = "squeaks"
	liked_foodtypes = FRUIT | NUTS | DAIRY
	disliked_foodtypes = CLOTH | BUGS

#undef CHEESE_RUSH_HUNGER_MODIFIER
