/obj/item/autosurgeon/syndicate/chainsaw
	desc = "A single use autosurgeon that contains a combat arms-up chainsaw augment. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/cyberimp/arm/toolkit/chainsaw

/obj/item/organ/cyberimp/arm/toolkit/chainsaw/l
	zone = BODY_ZONE_L_ARM

/obj/item/organ/cyberimp/arm/toolkit/chainsaw
	name = "arm-mounted chainsaw implant"
	desc = "A chainsaw hand implanted inside the arm. The chainsaw emerges from the subject's arm and remains inside when not in use."
	icon = 'icons/obj/weapons/chainsaw.dmi'
	icon_state = "chainsaw"
	items_to_create = list(/obj/item/chainsaw/mounted_chainsaw/implanted)

/datum/uplink_item/role_restricted/integrated_chainsaw
	name = "Integrated Chainsaw"
	desc = "A chainsaw hand implanted inside the arm. The chainsaw emerges from the subject's arm and remains inside when not in use."
	item = /obj/item/autosurgeon/syndicate/chainsaw
	cost = 12
	restricted_roles = list(JOB_STATION_ENGINEER, JOB_CHIEF_ENGINEER, JOB_BOTANIST, JOB_ASSISTANT, JOB_ASSISTANT_ENG)
	surplus = 15
	progression_minimum = 30 MINUTES

/obj/item/chainsaw/mounted_chainsaw/implanted
	name = "implanted chainsaw"
	desc = "A chainsaw that has extended from your arm."
	item_flags = ABSTRACT
