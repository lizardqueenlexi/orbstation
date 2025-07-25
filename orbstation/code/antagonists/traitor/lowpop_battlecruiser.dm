// ORBSTATION: lowpop version of the assault operative, which spawns without an uplink
/obj/effect/mob_spawn/ghost_role/human/syndicate/battlecruiser/assault/lowpop
	flavour_text = "Your job is to follow your captain's orders, keep intruders out of the ship, and assault Space Station 13. There is an on-board armory and an assault ship to attack the station with."
	outfit = /datum/outfit/syndicate_empty/battlecruiser/assault/lowpop
	uses = 1

/datum/outfit/syndicate_empty/battlecruiser/assault/lowpop
	l_pocket = null // no uplink
	belt = null // there's other belts on the ship already
	mask = null // there's masks in the suit storage units

/obj/effect/mob_spawn/ghost_role/human/syndicate/battlecruiser/captain/lowpop
	flavour_text = "Your job is to oversee your crew, defend the ship, and destroy Space Station 13. There is an on-board armory and an assault ship to attack the station with."
