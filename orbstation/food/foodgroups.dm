/obj/item/food/bait/worm/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/burger/human/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/burger/corgi/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/burger/appendix/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/burger/brain/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/burger/rat/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/cake/brain/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/cakeslice/brain/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/donut/meat/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/raw_headcheese/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/headcheese/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/headcheese_slice/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/shredded_lungs/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/tsatsikh/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/brain_pate/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/crispy_headcheese/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/nectar_larvae/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/pizza/imperial_flatbread/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/emperor_roll/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/soup/black_broth/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/soup/jellyfish/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/black_eggs/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/kebab/candied_mushrooms/Initialize(mapload)
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/canned_jellyfish/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/larvae/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/kebab/human/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/kebab/rat/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/meat/slab/human/Initialize(mapload)
	modify_foodtype()
	return ..(mapload)

/obj/item/food/meat/slab/human/proc/modify_foodtype()
	foodtypes |= CARRION
	foodtypes &= ~GROSS

/obj/item/food/meat/slab/human/mutant/fly/modify_foodtype()
	foodtypes |= CARRION

/obj/item/food/meat/slab/human/mutant/skeleton/modify_foodtype()
	foodtypes |= CARRION

/obj/item/food/meat/slab/human/mutant/zombie/modify_foodtype()
	foodtypes |= CARRION
	foodtypes |= GROSS

/obj/item/food/meat/steak/plain/human/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/meat/rawcutlet/plain/human/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/meat/cutlet/plain/human/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/candy/bronx/Initialize(mapload)
	foodtypes |= BUGS
	return ..(mapload)

/obj/item/food/soup/blood/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/soup/tomato/eyeball/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/grown/tomato/blood/Initialize(mapload)
	foodtypes |= CARRION
	foodtypes &= ~GROSS
	return ..(mapload)

/obj/item/food/deadmouse/Initialize(mapload)
	modify_foodtype()
	return ..(mapload)

/obj/item/food/deadmouse/proc/modify_foodtype()
	foodtypes |= CARRION
	foodtypes &= ~GROSS

/obj/item/food/deadmouse/moldy
	desc = "A dead rodent, consumed by mold and rot. Most people would hesitate to eat this."

/obj/item/food/deadmouse/moldy/modify_foodtype()
	foodtypes |= CARRION
