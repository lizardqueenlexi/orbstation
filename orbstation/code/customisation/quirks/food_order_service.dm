/datum/quirk/food_order_subscriber
	name = "Food Delivery Subscription"
	desc = "You have subscribed to NTGRUB, for a low-low price you will receive regular deliveries of food tailored to your tastes."
	icon = FA_ICON_GIFT
	value = 6
	mob_trait = TRAIT_NTGRUB_SUB
	gain_text = "<span class='danger'>You have subscribed to NTGRUB!</span>"
	lose_text = "<span class='notice'>You feel as if your subscription to NTGRUB has been cancelled.</span>"
	medical_record_text = "Patient is susceptible to GREAT DEALS! SUBSCRIBE TO NTGRUB NOW."
	mail_goodies = list(/obj/item/plate/large, /obj/item/kitchen/fork, /obj/item/knife/plastic, /obj/item/kitchen/spoon, /obj/item/reagent_containers/cup/bowl)
	var/datum/component/food_order_sub_quirk/quirk_component
	/// semi random list of foods for NTGRUB. avoids pizza and desserts as much as it can, to replicate the like, style of like, your Blue Aprons
	var/static/list/ntgrub_foodlist = list(
		/obj/item/food/sandwich/blt,
		/obj/item/food/danish_hotdog,
		/obj/item/food/sandwich/jelly,
		/obj/item/food/sandwich/jelly/slime,
		/obj/item/food/patzikula,
		/obj/item/food/ratatouille,
		/obj/item/food/fiesta_corn_skillet,
		/obj/item/food/mushroomy_stirfry,
		/obj/item/food/chipsandsalsa,
		/obj/item/food/chococornet,
		/obj/item/food/brownie_sheet,
		/obj/item/food/cheesyburrito,
		/obj/item/food/jelliedtoast/cherry,
		/obj/item/food/cheese/cheese_curds,
		/obj/item/food/grilled_cheese,
		/obj/item/food/baked_cheese_platter,
		/obj/item/food/cannoli,
		/obj/item/food/mozzarella_sticks,
		/obj/item/food/cheesynachos,
		/obj/item/food/mac_balls,
		/obj/item/food/chocolatebar,
		/obj/item/food/popcorn/caramel,
		/obj/item/food/fries,
		/obj/item/food/poutine,
		/obj/item/food/mint,
		/obj/item/food/spiderlollipop,
		/obj/item/food/yakiimo,
		/obj/item/food/omelette,
		/obj/item/food/cubancarp,
		/obj/item/food/taco/fish,
		/obj/item/food/spicyfiletsushiroll,
		/obj/item/food/lasagna,
		/obj/item/food/full_english,
		/obj/item/food/bbqribs,
		/obj/item/food/melonfruitbowl,
		/obj/item/food/springroll,
		/obj/item/food/pizza/flatbread/rustic,
		/obj/item/food/cakeslice/korta_brittle,
		/obj/item/food/spaghetti/demit_nizaya,
		/obj/item/food/moonfish_demiglace,
		/obj/item/food/crispy_headcheese,
		/obj/item/food/lizard_surf_n_turf,
		/obj/item/food/emperor_roll,
		/obj/item/food/pie/shepherds_pie,
		/obj/item/food/pizza/flatbread/rawmeat,
		/obj/item/food/frenchtoast,
		/obj/item/food/butterbiscuit,
		/obj/item/food/burger/tofu,
		/obj/item/food/burger/brain,
		/obj/item/food/burger/jelly/slime,
		/obj/item/food/burger/baconburger,
		/obj/item/food/cookie/sugar,
		/obj/item/food/salad/jungle,
		/obj/item/food/salad/citrusdelight,
		/obj/item/food/salad/greek_salad,
		/obj/item/food/salad/potato_salad,
		/obj/item/food/spaghetti/beefnoodle,
		/obj/item/food/spaghetti/mac_n_cheese,
		/obj/item/reagent_containers/cup/bowl/soup/slime,
		/obj/item/reagent_containers/cup/bowl/soup/black_broth,
		/obj/item/reagent_containers/cup/bowl/soup/wingfangchu,
		/obj/item/reagent_containers/cup/bowl/soup/nettle,
		/obj/item/reagent_containers/cup/bowl/soup/hotchili,
		/obj/item/reagent_containers/cup/bowl/soup/red_beet,
		/obj/item/reagent_containers/cup/bowl/soup/electron,
		/obj/item/reagent_containers/cup/bowl/soup/cullen_skink,
		/obj/item/reagent_containers/cup/bowl/soup/jellyfish,
		/obj/item/reagent_containers/cup/bowl/soup/rice_porridge,
		/obj/item/food/badrecipe,
		)

	var/static/list/no_hunger_list = list(
		/obj/item/food/pizza/energy,
		/obj/item/food/pizza/energy,
		/obj/item/food/pizza/energy,
		/obj/item/food/grown/apple,
		/obj/item/tank/internals/plasmaman/belt/full,
		/obj/item/stock_parts/power_store/cell,
		/obj/item/stock_parts/power_store/cell/upgraded/plus,
		)



/// generates list of food NTGRUB will deliver to you, removing disliked and toxic foods, then making a list of liked foods, and returning whatever is valid
/datum/quirk/food_order_subscriber/proc/create_foodlist()
	if(HAS_TRAIT(quirk_holder, TRAIT_NOHUNGER))
		return no_hunger_list
	if(!iscarbon(quirk_holder))
		return ntgrub_foodlist
	var/mob/living/carbon/quirk_owner = quirk_holder
	var/list/deliverable_food = list()
	for (var/obj/item/food/foodpath as anything in ntgrub_foodlist)
		var/food_types = initial(foodpath.foodtypes)
		if(food_types & quirk_owner.get_toxic_foodtypes())
			continue
		if(food_types & quirk_owner.get_disliked_foodtypes())
			continue
		deliverable_food += foodpath
	var/list/favorite_food = list()
	for (var/obj/item/food/likedpath as anything in deliverable_food)
		var/food_types = initial(likedpath.foodtypes)
		if(food_types & quirk_owner.get_liked_foodtypes())
			favorite_food += likedpath
	if(length(favorite_food))
		return favorite_food
	return deliverable_food

/datum/quirk/food_order_subscriber/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if(!human_holder.account_id)
		return
	reroll_list()
	RegisterSignal(quirk_holder, COMSIG_QUIRK_ADDED, PROC_REF(reroll_list))

/datum/quirk/food_order_subscriber/proc/reroll_list()
	SIGNAL_HANDLER
	var/list/delivery = create_foodlist()
	quirk_component = quirk_holder.AddComponent(/datum/component/food_order_sub_quirk, deliverable_food = delivery)

/datum/quirk/food_order_subscriber/remove()
	. = ..()
	QDEL_NULL(quirk_component)
	UnregisterSignal(quirk_holder, COMSIG_QUIRK_ADDED)

/datum/component/food_order_sub_quirk
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	/// Timer between deliveries
	var/delivery_timer
	/// Timer to spawning the pod after confirmation of delivery
	var/podspawn_timer
	/// How much the order costs
	var/delivery_charge
	var/max_delivery_time
	var/min_delivery_time
	var/list/deliverable_food

/// deliverable food is the list from the quirk, max is the longest time between deliveries, 25 minuites, min is the smallest time, 15 minutes, delivery charge is an assisstaints entire paycheck
/datum/component/food_order_sub_quirk/Initialize(list/deliverable_food, max_delivery_time = 25 MINUTES , min_delivery_time = 15 MINUTES, delivery_charge = PAYCHECK_LOWER)
	. = ..()
	if(!ishuman(parent))
		return COMPONENT_INCOMPATIBLE
	if(!length(deliverable_food))
		CRASH("Theres no food to deliver!!!")
	var/mob/living/carbon/human/quirk_payer = parent
	var/datum/bank_account/quirk_account = SSeconomy.bank_accounts_by_id["[quirk_payer.account_id]"]
	if(!quirk_account)
		return COMPONENT_INCOMPATIBLE

	src.deliverable_food = deliverable_food
	src.max_delivery_time = max_delivery_time
	src.min_delivery_time = min_delivery_time
	src.delivery_charge = delivery_charge

	schedule_payment()

/datum/component/food_order_sub_quirk/InheritComponent(datum/component/C, original, list/deliverable_food, max_delivery_time, min_delivery_time, delivery_charge)
	if(!original)
		return
	if(deliverable_food)
		src.deliverable_food = deliverable_food
	if(max_delivery_time)
		src.max_delivery_time = max_delivery_time
	if(min_delivery_time)
		src.min_delivery_time = min_delivery_time
	if(delivery_charge)
		src.delivery_charge = delivery_charge

/datum/component/food_order_sub_quirk/Destroy(force, silent)
	. = ..()
	deltimer(delivery_timer)

/// schedules your next subscription until you "cancel it" or get gibbed, as well as scheduling the first one
/datum/component/food_order_sub_quirk/proc/schedule_payment()
	var/random_time = rand(min_delivery_time, max_delivery_time)
	delivery_timer = addtimer(CALLBACK(src, PROC_REF(food_notification)), wait = random_time, flags = TIMER_STOPPABLE)

/// Notifies quirk holder that they are going to get a food delivery and charges them
/datum/component/food_order_sub_quirk/proc/food_notification()
	var/mob/living/carbon/human/quirk_payer = parent
	var/datum/bank_account/quirk_account = SSeconomy.bank_accounts_by_id["[quirk_payer.account_id]"]
	if(!quirk_account)
		qdel(src)
		return
	// schedules next delivery if you can not pay the current one
	schedule_payment()
	var/has_headset = istype(quirk_payer.ears, /obj/item/radio/headset)
	if(!quirk_account.adjust_money(-delivery_charge, "NTGRUB"))
		if(has_headset)
			to_chat(quirk_payer, span_hear("Your NTGRUB payment has failed. Delivery will be moved to the next attempt, we hope that you can pay then!"))
		return
	if(has_headset)
		to_chat(quirk_payer, span_hear("Your NTGRUB payment has succeeded. Your NTGRUB meal will be delivered to your location shortly."))
	/// sends pod after 20 secodns
	podspawn_timer = addtimer(CALLBACK(src, PROC_REF(food_delivery_pod)), wait = 20 SECONDS, flags = TIMER_STOPPABLE)

/// actual supply pod spawn of your food
/datum/component/food_order_sub_quirk/proc/food_delivery_pod()
	var/mob/living/carbon/human/quirk_payer = parent
	podspawn(list(
		"target" = get_turf(quirk_payer),
		"style" = /datum/pod_style/advanced,
		"spawn" = pick(deliverable_food)
	))
