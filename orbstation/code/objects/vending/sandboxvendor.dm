/obj/machinery/vending/sandboxvend
	name = "SandboxVend"
	desc = "Free tools to help you sandbox. Use at your own discretion, and try not to ruin the station for others."
	icon = 'orbstation/icons/obj/vending.dmi'
	icon_state = "sbv"
	panel_type = "sbvpanel"
	product_slogans = "Video games!;Find your true love here!;Slap it up!;It's all free!;Trans your gender!;Yayayayayay!"
	vend_reply = "Wahoo! Yay! Woohoo! Yahoo! Wow! Yippee! Yayayayayay!"
	max_integrity = 999999
	integrity_failure = 0.01
	tiltable = FALSE // i love you
	use_power = NO_POWER_USE
	idle_power_usage = 0
	light_mask = "sbv-light-mask"
	product_categories = list(
		list(
			"name" = "Essentials",
			"icon" = "star",
			"products" = list(
				/obj/item/scrying = 999,
				/obj/item/card/id/advanced/gold/captains_spare = 999,
				/obj/item/storage/backpack/holding = 999,
				/obj/item/storage/bag/sheetsnatcher/debug = 999,
				/obj/item/storage/box/other_material = 999,
				/obj/item/stock_parts/power_store/cell/infinite = 999,
				/obj/item/toy/balloon/corgi = 999,
				/obj/item/storage/box/hug/plushes = 999,
				/obj/item/choice_beacon/music = 999,
				/obj/item/choice_beacon/ingredient = 999,
				/obj/item/pizzabox/infinite = 999,
				/obj/item/stack/spacecash/c1000 = 999,
			),
		),

		list(
			"name" = "Tools",
			"icon" = "wrench",
			"products" = list(
				/obj/item/debug/omnitool = 999,
				/obj/item/door_remote/omni = 999,
				/obj/item/construction/rcd/combat/admin = 999,
				/obj/item/construction/rld/debug = 999,
				/obj/item/construction/rtd/admin = 999,
				/obj/item/pipe_dispenser = 999,
				/obj/item/construction/plumbing/debug = 999,
				/obj/item/storage/part_replacer/bluespace/tier4 = 999,
				/obj/item/holosign_creator/atmos/super = 999,
				/obj/item/airlock_painter/decal/debug = 999,
				/obj/item/toy/crayon/spraycan/infinite = 999,
				/obj/item/soap/omega = 999,
				/obj/item/healthanalyzer/advanced/free = 999,
				/obj/item/reagent_containers/hypospray/cmo = 999,
				/obj/item/gun/magic/wand/resurrection/debug = 999,
				/obj/item/extinguisher/debug = 999,
				/obj/item/flashlight/lantern/syndicate = 999,
				/obj/item/grenade/gas_crystal/healium_crystal = 999,
				/obj/item/grenade/gas_crystal/proto_nitrate_crystal = 999,
			),
		),

		list(
			"name" = "Equipment",
			"icon" = "briefcase",
			"products" = list(
				/obj/item/clothing/glasses/debug = 999,
				/obj/item/clothing/gloves/chief_engineer = 999,
				/obj/item/storage/belt/medical/ert/debug = 999,
				/obj/item/storage/belt/medical/abductor = 999,
				/obj/item/storage/belt/utility/full/powertools/debug = 999,
				/obj/item/storage/belt/military/abductor/full/zetan = 999,
				/obj/item/clothing/shoes/magboots/advance = 999,
				/obj/item/radio/headset/headset_cent/commander = 999,
				/obj/item/storage/belt/military = 999,
				/obj/item/reactive_armor_shell = 999,
				/obj/item/assembly/signaler/anomaly/pyro = 999,
				/obj/item/assembly/signaler/anomaly/grav = 999,
				/obj/item/assembly/signaler/anomaly/flux = 999,
				/obj/item/assembly/signaler/anomaly/bluespace = 999,
				/obj/item/assembly/signaler/anomaly/vortex = 999,
				/obj/item/assembly/signaler/anomaly/bioscrambler = 999,
				/obj/item/assembly/signaler/anomaly/hallucination = 999,
				/obj/item/assembly/signaler/anomaly/dimensional = 999,
				/obj/item/storage/bag/trash/bluespace = 999,
			),
		),

		list(
			"name" = "Weapons",
			"icon" = "gun",
			"products" = list(
				/obj/item/fireaxe = 999,
				/obj/item/melee/energy/axe = 999,
				/obj/item/hierophant_club = 999,
				/obj/item/gun/energy/pulse = 999,
				/obj/item/gun/energy/laser/instakill = 999,
			),
		),

		list(
			"name" = "Implants",
			"icon" = "heartbeat",
			"products" = list(
				/obj/item/autosurgeon/syndicate = 999,
				/obj/item/organ/lungs/cybernetic/tier3 = 999,
				/obj/item/organ/heart/cybernetic/tier3 = 999,
				/obj/item/organ/liver/cybernetic/tier3 = 999,
				/obj/item/organ/stomach/cybernetic/tier3 = 999,
				/obj/item/organ/cyberimp/chest/nutriment/plus = 999,
				/obj/item/organ/cyberimp/chest/reviver = 999,
				/obj/item/organ/cyberimp/mouth/breathing_tube = 999,
				/obj/item/organ/cyberimp/brain/anti_stun = 999,
				/obj/item/organ/cyberimp/arm/toolset/l = 999,
				/obj/item/organ/cyberimp/arm/surgery = 999,
				/obj/item/organ/cyberimp/eyes/hud/medical = 999,
				/obj/item/organ/heart/gland/ventcrawling = 999,
				/obj/item/skillchip/job/engineer/free = 999,
				/obj/item/skillchip/job/roboticist/free = 999,
			),
		),

		list(
			"name" = "Mutations",
			"icon" = "podcast",
			"products" = list(
				/obj/item/storage/pill_bottle/mutadone = 999,
				/obj/item/dnainjector/antenna = 999,
				/obj/item/dnainjector/antiglow = 999,
				/obj/item/dnainjector/chameleonmut = 999,
				/obj/item/dnainjector/clumsymut = 999,
				/obj/item/dnainjector/cryokinesis = 999,
				/obj/item/dnainjector/dwarf = 999,
				/obj/item/dnainjector/geladikinesis = 999,
				/obj/item/dnainjector/gigantism = 999,
				/obj/item/dnainjector/glow = 999,
				/obj/item/dnainjector/insulated = 999,
				/obj/item/dnainjector/mindread = 999,
				/obj/item/dnainjector/olfaction = 999,
				/obj/item/dnainjector/pressuremut = 999,
				/obj/item/dnainjector/telemut = 999,
				/obj/item/dnainjector/firemut = 999,
				/obj/item/dnainjector/wackymut = 999,
				/obj/item/dnainjector/webbing = 999,
				/obj/item/dnainjector/xraymut = 999,
			),
		),

		list(
			"name" = "Potions",
			"icon" = "flask",
			"products" = list(
				/obj/item/reagent_containers/cup/bottle/potion/flight = 999,
				/obj/item/slimepotion/genderchange = 999,
				/obj/item/slimepotion/transference = 999,
				/obj/item/slimepotion/slime/sentience = 999,
				/obj/item/slimepotion/slime/renaming = 999,
				/obj/item/slimepotion/peacepotion = 999,
				/obj/item/slimepotion/spaceproof = 999,
				/obj/item/slimepotion/fireproof = 999,
				/obj/item/dragons_blood = 999,
			),
		),
	)

	contraband = list(
		/obj/item/card/emag/bluespace = 99,
		/obj/item/disk/data/debug = 99,
		/obj/item/disk/surgery/debug = 99,
		/obj/item/disk/tech_disk/debug = 99,
		/obj/item/implanter/spell/teleport = 99,
		/obj/item/implanter/spell/jaunt = 99,
		/obj/item/implanter/storage = 99,
		/obj/item/implanter/radio/syndicate = 99,
		/obj/item/implanter/sad_trombone = 99,
		/obj/item/dnainjector/hulkmut = 99,	   		// i *could* remove these two for being too destructive
		/obj/item/dnainjector/lasereyesmut = 99, 	// but also, it's just sandbox, so
		/obj/item/stack/sheet/hauntium/fifty = 99,
		/obj/item/suspiciousphone = 99,
		/obj/item/guardian_creator/tech = 99,
		/obj/item/uplink/sandbox = 99, // Yes, infinite traitor uplinks might destroy the station, but it's for sandbox.
		/obj/item/reagent_containers/condiment/ants = 99,
	)

	premium = list(
		/obj/item/toy/plush/crew/pennyplushie/premium = 1,
	)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	refill_canister = /obj/item/vending_refill/clothing // wont populate categories without this
	default_price = 0
	extra_price = 0
	payment_department = NO_FREEBIES // yes freebies bitch
	light_color = LIGHT_COLOR_PURPLE

//price overrides
/obj/item/toy/crayon/spraycan/infinite
	custom_price = 0

/obj/item/healthanalyzer/advanced/free //just in case it's actually sold anywhere real
	custom_price = 0

/obj/item/flashlight/lantern/syndicate
	custom_price = 0

/obj/item/skillchip/job/engineer/free
	custom_price = 0

/obj/item/skillchip/job/roboticist/free
	custom_price = 0
