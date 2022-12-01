/datum/supply_pack/goody/hamhelmet
	name = "Ham Helmet Two Pack"
	desc = "Contains two Ham Helmets, one for you, and one for your beloved, be they a person or a corgi."
	cost = PAYCHECK_CREW * 3
	contains = list(/obj/item/clothing/head/helmet/ham,
					/obj/item/clothing/head/helmet/ham,
					/obj/item/paper/guides/hamhelmet)

/datum/supply_pack/goody/magazine
	name = "Magazine"
	desc = "Contains one magazine from the Nanotrasen Magazine Library. Don't forget to subscribe to Magazines Monthly!"
	cost = PAYCHECK_CREW * 2
	contains = list(/obj/effect/spawner/random/entertainment/magazine)

/// lists of pizza in the same path as the parent of the other pizza crates, so that they can be used for the universal pizza crate
/datum/supply_pack/organic/pizza/
	var/static/list/moth_pizza_list = list(
		/obj/item/food/pizza/mothic_margherita = 10,
		/obj/item/food/pizza/mothic_firecracker = 10,
		/obj/item/food/pizza/mothic_five_cheese = 8,
		/obj/item/food/pizza/mothic_white_pie = 10,
		/obj/item/food/pizza/mothic_pesto = 10,
		/obj/item/food/pizza/mothic_garlic = 10
		)

	var/static/list/flatbread_pizza_list = list(
		/obj/item/food/pizza/flatbread/rustic = 10,
		/obj/item/food/pizza/flatbread/italic = 10,
		/obj/item/food/pizza/flatbread/imperial = 6,
		/obj/item/food/pizza/flatbread/rawmeat = 10,
		/obj/item/food/pizza/flatbread/stinging = 9,
		/obj/item/food/pizza/flatbread/zmorgast = 8,
		/obj/item/food/pizza/flatbread/fish = 10,
		/obj/item/food/pizza/flatbread/mushroom = 10,
		/obj/item/food/pizza/flatbread/nutty = 8,
		)

/datum/supply_pack/organic/pizza/flatbread
	name = "Flatbread Crate"
	desc = "Gay Lizard Medbay Rejoice! A taste of home for Tizirans everywhere. \
			Best prices this side of the galaxy! All deliveries are guaranteed to be 99% anomaly-free."
	crate_name = "flatbread crate"

/datum/supply_pack/organic/pizza/flatbread/fill(obj/structure/closet/crate/new_crate)
	pizza_types = flatbread_pizza_list
	return ..()

/datum/supply_pack/organic/pizza/mothic
	name = "Mothic Pizza Crate"
	desc = "Containing so much cheese that even a Ratfolk might have second thoughts. Not you though. \
			Best prices this side of the galaxy! All deliveries are guaranteed to be 99% anomaly-free."
	crate_name = "mothic pizza crate"

/datum/supply_pack/organic/pizza/mothic/fill(obj/structure/closet/crate/new_crate)
	pizza_types = moth_pizza_list
	return ..()

/datum/supply_pack/organic/pizza/medley
	name = "Universal Pizza Crate"
	desc = "The Ultimate collection of Pizza and Flatbread, finally brought to stations across the galaxy! \
			Best prices this side of the galaxy! All deliveries are guaranteed to be 99% anomaly-free."
	cost = CARGO_CRATE_VALUE * 20 // Best prices this side of the galaxy.
	crate_name = "variety pizza crate"
	infinite_pizza_chance = 2
	bomb_pizza_chance = 6

/// copies previously made lists of pizza for use in a list of pizzas to eventually fill the pizza crate
/datum/supply_pack/organic/pizza/medley/fill(obj/structure/closet/crate/new_crate)
	var/list/medley_flat = flatbread_pizza_list.Copy()
	var/list/medley_moth = moth_pizza_list.Copy()
	var/list/medley_human = pizza_types.Copy()
	var/list/used_pizzas = list()
	/// loops twice, picking 2 from each, making sure that 2 lizard, 2 moth, and 2 non specialized pizzas are generated
	for(var/i in 1 to 2)
		used_pizzas += pick_n_take(medley_flat)
		used_pizzas += pick_n_take(medley_moth)
		used_pizzas += pick_n_take(medley_human)
	var/list/remaining_pizzas = medley_flat + medley_moth + medley_human
	/// fills the used_ pizzas list with 4 more pizzas for a total of 10
	for(var/i in 1 to 4)
		used_pizzas += pick_n_take(remaining_pizzas)
	/// same pizza code as in upstream
	for(var/i in 1 to 10)
		if(add_anomalous(new_crate))
			continue
		if(add_boombox(new_crate))
			continue
		add_medley_pizza(new_crate, used_pizzas)

/// actually puts the generated pizza list inside of the crate, leaves up to 2 of the genereated pizzas off if an bomb or infinite pizza box is generated
/datum/supply_pack/organic/pizza/medley/proc/add_medley_pizza(obj/structure/closet/crate/new_crate, list/used_pizzas)
	var/get_pizza = popleft(used_pizzas)
	used_pizzas -= get_pizza
	var/obj/item/pizzabox/new_pizza_box = new(new_crate)
	new_pizza_box.pizza = new get_pizza
	new_pizza_box.boxtag = new_pizza_box.pizza.boxtag
	new_pizza_box.boxtag_set = TRUE
	new_pizza_box.update_appearance(UPDATE_ICON | UPDATE_DESC)

/datum/supply_pack/organic/randomized/dough
	name = "Bakery Crate"
	desc = "Contains a randomized collection of dough from all over the universe, for all of your baking needs."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(
		/obj/item/food/dough = 10,
		/obj/item/food/cakebatter = 7,
		/obj/item/food/rootdough = 10,
		/obj/item/food/mothic_pizza_dough = 4,
		)

/datum/supply_pack/organic/randomized/dough/fill(obj/structure/closet/crate/newcrate)
	for(var/i in 1 to 10)
		var/item = pick(contains)
		new item(newcrate)
