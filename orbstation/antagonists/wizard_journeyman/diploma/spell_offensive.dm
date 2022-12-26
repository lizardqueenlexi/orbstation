/**
 * Spells which hurt, disable, or greatly annoy people.
 */

/datum/diploma_spell/magicm
	name = "Magic Missile"
	desc = "Fires several slow moving, magic projectiles at nearby targets which impede their movement."
	spell_type = /datum/action/cooldown/spell/aoe/magic_missile
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_UNCOMMON

/datum/diploma_spell/lightning_packet
	name = "Thrown Lightning"
	desc = "Forged from eldrich energies, a packet of pure power, \
		known as a spell packet will appear in your hand, that when thrown will stun the target."
	spell_type = /datum/action/cooldown/spell/conjure_item/spellpacket
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/the_traps
	name = "The Traps!"
	desc = "Summon a number of traps around you. They will damage and enrage any enemies that step on them."
	spell_type = /datum/action/cooldown/spell/conjure/the_traps
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/item/staffanimation
	name = "Staff of Animation"
	desc = "An arcane staff capable of shooting bolts of eldritch energy which cause inanimate objects to come to life. This magic doesn't affect machines."
	item_path = /obj/item/gun/magic/staff/animate
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_UNCOMMON

/datum/diploma_spell/item/guardian
	name = "Guardian Deck"
	desc = "A deck of guardian tarot cards, capable of binding a personal guardian to your body. There are multiple types of guardian available, but all of them will transfer some amount of damage to you. \
	It would be wise to avoid buying these with anything capable of causing you to swap bodies with others."
	item_path = /obj/item/guardiancreator/choose/wizard
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_RARE

/datum/diploma_spell/fireball
	name = "Fireball"
	desc = "Fires an explosive fireball at a target. Considered a classic among all wizards."
	spell_type = /datum/action/cooldown/spell/pointed/projectile/fireball
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_UNCOMMON

/datum/diploma_spell/rod_form
	name = "Rod Form"
	desc = "Take on the form of an immovable rod, destroying all in your path. Purchasing this spell multiple times will also increase the rod's damage and travel range."
	spell_type = /datum/action/cooldown/spell/rod_form
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_RARE

/datum/diploma_spell/spell_cards
	name = "Spell Cards"
	desc = "Blazing hot rapid-fire homing cards. Send your foes to the shadow realm with their mystical power!"
	spell_type = /datum/action/cooldown/spell/pointed/projectile/spell_cards
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/mutate
	name = "Mutate"
	desc = "Causes you to turn into a hulk and gain laser vision for a short while."
	spell_type = /datum/action/cooldown/spell/apply_mutations/mutate
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_RARE

/datum/diploma_spell/duffelbag
	name = "Bestow Cursed Duffel Bag"
	desc = "Places a dire curse upon your target, burdening them with a demonic bag. \
		This backpack slows them down and must be fed periodically, lest it become hungry enough to bite its owner."
	spell_type = /datum/action/cooldown/spell/touch/duffelbag
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/teslablast
	name = "Tesla Blast"
	desc = "Charge up a tesla arc and release it at a random nearby target! You can move freely while it charges. \
		The arc jumps between targets and can knock them down."
	spell_type = /datum/action/cooldown/spell/charged/beam/tesla
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_UNCOMMON

/datum/diploma_spell/lightningbolt
	name = "Lightning Bolt"
	desc = "Fire a lightning bolt at your foes! It will jump between targets, but can't knock them down."
	spell_type = /datum/action/cooldown/spell/pointed/projectile/lightningbolt
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/item/lavastaff
	name = "Lava Staff"
	desc = "A staff which can slowly transmute areas of the station into boiling lava. \
		It also has the power to remove lava, which means its victims will want to steal it from you."
	item_path = /obj/item/lava_staff
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/item/hierophant
	name = "Hierophant's Club"
	desc = "A mystical artifact happily stolen from the ruins of Indecipheres by the Wizard Federation. \
		Use this priceless relic as a blunt object to smash your enemies and then teleport away."
	item_path = /obj/item/hierophant_club
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/item/storm_staff
	name = "Staff of Storms"
	desc = "An ancient relic with the power to control the weather, calm storms, or (likely more relevant to you) \
		blast your foes with lightning. Works better in areas currently experiencing weather."
	item_path = /obj/item/storm_staff
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/sacred_flame
	name = "Sacred Flame"
	desc = "A common prank wizard play upon each other for fun. Make people nearby extremely flammable and ignite yourself for \
		a fun game of tag. Pack some spare robes."
	spell_type = /datum/action/cooldown/spell/aoe/sacred_flame
	category = DIPLOMA_SPELL_OFFENSIVE

/datum/diploma_spell/tentacles
	name = "Tentacle Burst"
	desc = "Summon waves of tentacles to ensnare everyone around you."
	spell_type = /datum/action/cooldown/spell/aoe_staggered/tentacle_burst
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_RARE

/datum/diploma_spell/animate_limb
	name = "Animate Limb"
	desc = "Disarm your enemies by detaching their arms and reanimating them as your minions."
	spell_type = /datum/action/cooldown/spell/touch/animate_limb
	category = DIPLOMA_SPELL_OFFENSIVE
	weight = DIPLOMA_SPELL_RARE
