/datum/religion_sect/rat
	name = "Rat Worship"
	desc = "Sacrifice cheese and mouse traps to grant favour."
	quote = "Let's see what kind of trouble we can get ourselves into."
	tgui_icon = "cheese"
	alignment = ALIGNMENT_NEUT
	desired_items = list(/obj/item/food/ = "(especially cheese and dairy)", /obj/item/assembly/mousetrap)
	rites_list = list(/datum/religion_rites/ratconvert, /datum/religion_rites/ratclog)
	altar_icon_state = "convertaltar-maint"

#define SOUND_SQUEAK 'sound/effects/mousesqueek.ogg'

/datum/religion_sect/rat/sect_bless(mob/living/target, mob/living/chap)
	if (ishuman(target))
		return FALSE

	if (israt(target) || ismouse(target))
		var/mob/living/simple_animal/hostile/rat/blessedR = target
		if(blessedR.health < blessedR.maxHealth)
			blessedR.heal_bodypart_damage(blessedR.maxHealth)
			blessedR.visible_message(span_notice("[chap] heals [blessedR] with the power of [GLOB.deity]!"))
			to_chat(blessedR, span_boldnotice("May the power of [GLOB.deity] compel you to be healed!"))
			playsound(chap, SOUND_SQUEAK, 25, TRUE, -1)
			SEND_SIGNAL(blessedR, COMSIG_ADD_MOOD_EVENT, "blessing", /datum/mood_event/blessing)

	return TRUE

#define TRAP_FAVOUR 25
#define DAIRY_BONUS_MULT 2
#define PER_NUTRIMENT_FAVOUR 1

/datum/religion_sect/rat/on_sacrifice(obj/item/I, mob/living/chap)
	if (istype(I, /obj/item/assembly/mousetrap))
		to_chat(chap, span_notice("[GLOB.deity] is pleased that this trap will trouble their children no more."))
		playsound(chap, SOUND_SQUEAK, 25, TRUE, -1)
		adjust_favor(TRAP_FAVOUR, chap)
		qdel(I)
		return TRUE

	if (IS_EDIBLE(I))
		var/obj/item/food/the_food = I
		var/datum/reagent/N = I.reagents.has_reagent(/datum/reagent/consumable/nutriment)
		var/food_favour = (N.volume + 1) * PER_NUTRIMENT_FAVOUR
		if (the_food.foodtypes & DAIRY)
			food_favour *= DAIRY_BONUS_MULT

		adjust_favor(food_favour, chap)
		to_chat(chap, span_notice("You offer [the_food] to [GLOB.deity], pleasing them."))
		playsound(chap, SOUND_SQUEAK, 25, TRUE, -1)
		qdel(I)
		return TRUE

	return

#undef TRAP_FAVOUR
#undef DAIRY_BONUS_MULT
#undef PER_NUTRIMENT_FAVOUR

/datum/religion_rites/ratconvert
	name = "Rat Monarch Blessing"
	desc = "Undergo the trial of the Rat Monarchs, after which rats will regard you as kin. Buckle a human to your altar to bless them, otherwise it will bless you."
	ritual_length = 10 SECONDS
	ritual_invocations = list("Open our eyes to see your children!",
	"Open our ears to hear your voice!")
	invoke_msg = "Open our mouths to receive your blessing!"
	favor_cost = 25

/datum/religion_rites/ratconvert/perform_rite(mob/living/user, atom/religious_tool)
	if(!ismovable(religious_tool))
		to_chat(user, span_warning("This rite requires an altar that individuals can be buckled to."))
		return FALSE
	var/atom/movable/movable_reltool = religious_tool
	if(!movable_reltool)
		return FALSE
	if(LAZYLEN(movable_reltool.buckled_mobs))
		to_chat(user, span_warning("You're going to bless the one buckled on [movable_reltool]."))
	else
		if(!movable_reltool.can_buckle) //yes, if you have somehow managed to have someone buckled to something that now cannot buckle, we will still let you perform the rite!
			to_chat(user, span_warning("This rite requires an altar that individuals can be buckled to."))
			return FALSE
		to_chat(user, span_warning("You're going to bless yourself with this ritual."))
	return ..()

/datum/religion_rites/ratconvert/invoke_effect(mob/living/user, atom/religious_tool)
	..()
	if(!ismovable(religious_tool))
		CRASH("[name]'s perform_rite had a movable atom that has somehow turned into a non-movable!")
	var/atom/movable/movable_reltool = religious_tool
	var/mob/living/carbon/human/rite_target
	if(!movable_reltool?.buckled_mobs?.len)
		rite_target = user
	else
		for(var/buckled in movable_reltool.buckled_mobs)
			if(ishuman(buckled))
				rite_target = buckled
				break
	if(!rite_target)
		return FALSE

	if (("rat" in rite_target.faction))
		rite_target.visible_message(span_notice("[rite_target] has already received the blessing!"))
		return FALSE

	rite_target.reagents.add_reagent(/datum/reagent/rat_holy_water, 22)
	rite_target.visible_message(span_notice("[rite_target] starts to feel strange!"))
	return TRUE

/datum/reagent/rat_holy_water
	name = "Rat Holy Water"
	description = "Something from a rat god!"
	reagent_state = LIQUID
	color = "#C8C8C8"
	metabolization_rate = REAGENTS_METABOLISM
	taste_description = "something furry"

/datum/reagent/rat_holy_water/on_mob_life(mob/living/carbon/C)
	C.reagents.add_reagent(/datum/reagent/rat_spit, 2 * REAGENTS_METABOLISM)
	..()

/datum/religion_rites/ratclog
	name = "Call Forth Rodents"
	desc = "Somewhere on the station, they will hear your call."
	ritual_length = 30 SECONDS
	ritual_invocations = list("We prey at night!",
	"We stalk at night!",
	"Scamper forth into this land of plenty ...")
	invoke_msg = "... let's see what kind of trouble we can get ourselves into!"
	favor_cost = 200

/datum/religion_rites/ratclog/invoke_effect(mob/living/user, atom/movable/religious_tool)
	..()
	var/datum/round_event_control/scrubber_clog/rats/event = locate(/datum/round_event_control/scrubber_clog/rats) in SSevents.control
	if(event.runEvent())
		to_chat(user, span_notice("You hear a distant scratching and scuttling."))
		return TRUE
	to_chat(user, span_notice("It appears that no more rats are forthcoming."))
	return FALSE

/datum/round_event_control/scrubber_clog/rats
	name = "Rat Clog"
	typepath = /datum/round_event/scrubber_clog/rats
	weight = 0
	max_occurrences = 0

/datum/round_event/scrubber_clog/rats/setup()
	. = ..()
	maximum_spawns = rand(2,4)
	spawn_delay = rand(15,20)

/datum/round_event/scrubber_clog/rats/get_mob()
	var/static/list/mob_list = list(
		/mob/living/simple_animal/mouse,
		/mob/living/simple_animal/mouse,
		/mob/living/simple_animal/mouse,
		/mob/living/simple_animal/hostile/rat,
	)
	return pick(mob_list)

/datum/round_event/scrubber_clog/rats/announce()
	priority_announce("Rodent population explosion detected in the ventilation network. Blockage is believed to be in the [get_area_name(scrubber)] area.", "Infestation Alert")

#undef SOUND_SQUEAK
