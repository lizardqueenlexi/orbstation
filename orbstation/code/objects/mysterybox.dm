GLOBAL_LIST_INIT(mystery_box_cheese, list(
	/obj/item/food/baked_cheese_platter,
	/obj/item/food/cheese/curd_cheese,
	/obj/item/food/cheese/cheese_curds,
	/obj/item/food/cheese/firm_cheese,
	/obj/item/food/cheese/firm_cheese_slice,
	/obj/item/food/cheese/mozzarella,
	/obj/item/food/cheese/royal,
	/obj/item/food/cheese/wedge,
	/obj/item/food/cheese/wheel,
	/obj/item/food/crispy_headcheese,
	/obj/item/food/grilled_cheese,
	/obj/item/food/herby_cheese,
	/obj/item/food/loaded_curds,
	/obj/item/food/pizza/mothic_five_cheese,
	/obj/item/food/raw_headcheese,
	/obj/item/food/mac_balls,
	/obj/item/food/mozzarella_sticks,
	/obj/item/reagent_containers/cup/bowl/soup/cheese,
	/obj/item/food/sustenance_bar/cheese,
))

GLOBAL_LIST_INIT(mystery_box_clown, list(
	/obj/item/assembly/mousetrap,
	/obj/item/bikehorn,
	/obj/item/bikehorn/golden,
	/obj/item/book/granter/action/spell/mime/mimery,
	/obj/item/clothing/glasses/salesman,
	/obj/item/extendohand,
	/obj/item/firing_pin/clown/,
	/obj/item/food/baguette,
	/obj/item/food/grown/banana,
	/obj/item/food/pie/cream,
	/obj/item/grown/bananapeel,
	/obj/item/implant/sad_trombone,
	/obj/item/pneumatic_cannon/pie/,
	/obj/item/reagent_containers/cup/glass/bottle/bottleofnothing,
	/obj/item/reagent_containers/cup/soda_cans/canned_laughter,
	/obj/item/reagent_containers/spray/waterflower/lube,
	/obj/item/stack/sheet/mineral/bananium/five,
	/obj/item/stack/tile/fakeice/loaded,
	/obj/item/stack/tile/fakepit/loaded,
	/obj/item/stack/tile/fakespace/loaded,
	/obj/item/stamp/clown,
	/obj/item/stamp/mime,
	/obj/item/toy/balloon,
	/obj/item/toy/crayon/spraycan/lubecan,
	/obj/item/toy/dummy,
	/obj/item/toy/figure/clown,
	/obj/item/toy/figure/mime,
	/obj/item/toy/mecha/darkhonk,
	/obj/item/toy/mecha/honk,
	/obj/item/toy/mecha/reticence,
	/obj/item/toy/snappop,
	/obj/item/toy/waterballoon,
))

GLOBAL_LIST_INIT(mystery_box_clownevil, list(
	/obj/item/bikehorn/airhorn,
	/obj/item/clothing/shoes/clown_shoes/banana_shoes,
	/obj/item/clothing/shoes/clown_shoes/combat,
	/obj/item/dnainjector/clumsymut,
	/obj/item/firing_pin/clown/ultra,
	/obj/item/firing_pin/clown/ultra/selfdestruct,
	/obj/item/food/baguette/combat,
	/obj/item/food/croissant/throwing,
	/obj/item/food/grown/banana/bombanana,
	/obj/item/grenade/chem_grenade/teargas/moustache,
	/obj/item/hot_potato/syndicate,
	/obj/item/melee/energy/sword/bananium,
	/obj/item/pneumatic_cannon/pie/selfcharge,
	/obj/item/reagent_containers/spray/waterflower/superlube,
	/obj/item/reverse_bear_trap,
	/obj/item/sbeacondrop/clownbomb,
	/obj/item/shield/energy/bananium,
	/obj/item/sord,
))

GLOBAL_LIST_INIT(mystery_box_shoes, list(
	/obj/item/clothing/shoes/bhop,
	/obj/item/clothing/shoes/bhop/rocket,
	/obj/item/clothing/shoes/chameleon/noslip,
	/obj/item/clothing/shoes/clown_shoes/banana_shoes,
	/obj/item/clothing/shoes/clown_shoes/jester,
	/obj/item/clothing/shoes/clown_shoes/meown_shoes,
	/obj/item/clothing/shoes/cowboy/fancy,
	/obj/item/clothing/shoes/cult,
	/obj/item/clothing/shoes/ducky_shoes,
	/obj/item/clothing/shoes/glow,
	/obj/item/clothing/shoes/gunboots,
	/obj/item/clothing/shoes/gunboots/disabler,
	/obj/item/clothing/shoes/kindle_kicks,
	/obj/item/clothing/shoes/laceup,
	/obj/item/clothing/shoes/magboots,
	/obj/item/clothing/shoes/russian,
	/obj/item/clothing/shoes/sandal/magic,
	/obj/item/clothing/shoes/sneakers/marisa,
	/obj/item/clothing/shoes/swagshoes,
	/obj/item/clothing/shoes/wheelys,
	/obj/item/clothing/shoes/wheelys/rollerskates,
	/obj/item/clothing/shoes/wheelys/skishoes,
	/obj/item/clothing/shoes/winterboots/ice_boots/eva,
))

/obj/structure/mystery_box
	/// By default mystery boxes are permanent, but when this is set to true will add the temporary atom element the next time it is opened and closed.
	var/temporary_box = FALSE

/obj/structure/mystery_box/close_box()
	. = ..()
	if(temporary_box)
		fade_into_nothing(life_time = 7 SECONDS, fade_time = 5 SECONDS)

/obj/structure/mystery_box/cheese
	desc = "A wooden crate that seems equally magical and mysterious, capable of granting the user all kinds of different items. This one seems focused on cheese."

/obj/structure/mystery_box/cheese/generate_valid_types()
	valid_types = GLOB.mystery_box_cheese

/obj/structure/mystery_box/clown
	desc = "A wooden crate that seems equally magical and mysterious, capable of granting the user all kinds of funny items."

/obj/structure/mystery_box/clown/generate_valid_types()
	valid_types = GLOB.mystery_box_clown

/obj/structure/mystery_box/clownevil
	desc = "A wooden crate that seems equally magical and mysterious, capable of granting the user all kinds of funny items."

/obj/structure/mystery_box/clownevil/generate_valid_types()
	valid_types = GLOB.mystery_box_clown + GLOB.mystery_box_clownevil

/obj/structure/mystery_box/shoes
	desc = "A wooden crate that seems equally magical and mysterious, capable of granting the user all kinds of different items. This one seems focused on exclusive footwear."

/obj/structure/mystery_box/shoes/generate_valid_types()
	valid_types = GLOB.mystery_box_shoes
