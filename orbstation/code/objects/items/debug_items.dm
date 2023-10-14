/obj/item/construction/rld/debug
	name = "debug rapid-light-device (RLD)"
	desc = "A device used to rapidly provide lighting sources to an area. Activate to switch modes."
	icon = 'icons/obj/tools.dmi'
	icon_state = "rld"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	matter = 2000
	max_matter = 2000

/obj/item/holosign_creator/atmos/super
	name = "super ATMOS holofan projector"
	desc = "A holographic projector that creates holographic barriers that prevent changes in atmosphere conditions. This one can support up to 99 barriers at once."
	max_signs = 99

/obj/item/construction/plumbing/debug
	name = "Debug Plumbing Constructor"
	matter = INFINITY
	max_matter = INFINITY

/obj/item/dnainjector/reset_genome
	name = "\improper DNA injector (Reset Genome)"
	desc = "Wow, uh, this is kind of grim. Don't think too hard about it."
	remove_mutations = list( // should remove everything except monkified, maybe there's an easier way to do this? hopefully I didn't miss any!
		/datum/mutation/human/acidflesh,
		/datum/mutation/human/antenna,
		/datum/mutation/human/bad_dna,
		/datum/mutation/human/badblink,
		/datum/mutation/human/glow,
		/datum/mutation/human/glow/anti,
		/datum/mutation/human/blind,
		/datum/mutation/human/clumsy,
		/datum/mutation/human/cough,
		/datum/mutation/human/cryokinesis,
		/datum/mutation/human/deaf,
		/datum/mutation/human/dwarfism,
		/datum/mutation/human/elvis,
		/datum/mutation/human/epilepsy,
		/datum/mutation/human/geladikinesis,
		/datum/mutation/human/gigantism,
		/datum/mutation/human/nearsight,
		/datum/mutation/human/glow,
		/datum/mutation/human/hulk,
		/datum/mutation/human/illiterate,
		/datum/mutation/human/insulated,
		/datum/mutation/human/laser_eyes,
		/datum/mutation/human/mindreader,
		/datum/mutation/human/mute,
		/datum/mutation/human/olfaction,
		/datum/mutation/human/piglatin,
		/datum/mutation/human/paranoia,
		/datum/mutation/human/pressure_adaptation,
		/datum/mutation/human/radioactive,
		/datum/mutation/human/shock,
		/datum/mutation/human/spastic,
		/datum/mutation/human/nervousness,
		/datum/mutation/human/swedish,
		/datum/mutation/human/telekinesis,
		/datum/mutation/human/temperature_adaptation,
		/datum/mutation/human/thermal,
		/datum/mutation/human/extrastun,
		/datum/mutation/human/unintelligible,
		/datum/mutation/human/void,
		/datum/mutation/human/xray,
		/datum/mutation/human/wacky,
		/datum/mutation/human/webbing
		)

/obj/item/storage/box/other_material
	name = "box of other materials"
	illustration = "syndiebox"

/obj/item/storage/box/other_material/PopulateContents()
	var/static/items_inside = list(
		/obj/item/stack/sheet/mineral/bamboo/fifty=1,
		/obj/item/stack/sheet/paperframes/fifty=1,
		/obj/item/stack/sheet/plastic/fifty=1,
		/obj/item/stack/sheet/durathread=50,
		/obj/item/stack/sheet/mineral/sandstone=50,
		/obj/item/stack/sheet/mineral/snow=50,
		/obj/item/stack/sheet/hot_ice=50,
		/obj/item/stack/sheet/bronze=50,
		/obj/item/stack/sheet/plasmarglass=50,
		/obj/item/stack/sheet/mineral/abductor=50,
		/obj/item/stack/sheet/mineral/adamantine=10,//more than anyone would ever need, no need to make 50
		/obj/item/stack/sheet/mineral/runite=50,
		/obj/item/stack/sheet/mineral/metal_hydrogen=50,
		/obj/item/stack/sheet/mineral/zaukerite=50,
		/obj/item/stack/sheet/bone=12, //max stack size is 12 so otherwise the box fills up with bone fast
		/obj/item/stack/sheet/meat/fifty=1,
		/obj/item/stack/sheet/pizza/fifty=1,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/belt/medical/abductor
	name = "\improper Zetan medical belt"
	desc = "A belt used by extremely strong doctors."
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "belt"
	inhand_icon_state = "security"
	worn_icon_state = "security"
	content_overlays = TRUE

/obj/item/storage/belt/medical/abductor/PopulateContents()
	new /obj/item/scalpel/alien(src)
	new /obj/item/retractor/alien(src)
	new /obj/item/hemostat/alien(src)
	new /obj/item/circular_saw/alien(src)
	new /obj/item/cautery/alien(src)
	new /obj/item/surgicaldrill/alien(src)
	new /obj/item/surgical_drapes(src)

//Giving subtypes to some items so they have clearer names in the sandbox vendor
/obj/item/storage/belt/military/abductor/full/zetan
	name = "\improper Zetan toolbelt"
	desc = "A belt used by extremely strong engineers."

/obj/item/storage/belt/medical/ert/debug
	name = "advanced medical belt"

/obj/item/storage/belt/utility/full/powertools/debug
	name = "advanced toolbelt"

/obj/item/uplink/sandbox //This is NOT the debug uplink, which has unlimited TC, because I don't think we should give those out.
	name = "traitor uplink"

/obj/item/extinguisher/debug
	name = "infinite fire extinguisher"
	desc = "An experimental fire extinguisher containing a stabilized miniature portal to an alternate universe fully submerged in water. The label promises that this technology is 'perfectly safe'."
	max_water = INFINITY
	precision = TRUE
	power = 8
	icon = 'orbstation/icons/obj/items/debug.dmi'
	lefthand_file = 'orbstation/icons/obj/items/inhand_left.dmi'
	righthand_file = 'orbstation/icons/obj/items/inhand_right.dmi'
	icon_state = "debug_ext0"
	worn_icon_state = "debug_ext"
	inhand_icon_state = "debug_ext"
	sprite_name = "debug_ext"
