// There already were spell implants, but no spawnable versions.
// These are essentially admin/badmin tools for now, but they could become
// traitor summonable or whatever.

// I am sorry for the desciptions I may be going insane.

#define ADD_IMPLANTER(full_spell_path, subtype_path, imp_name, imp_desc) \
/obj/item/implant/spell/##subtype_path/spell_type = full_spell_path;\
/obj/item/implant/spell/##subtype_path/name = imp_name;\
/obj/item/implant/spell/##subtype_path/desc = imp_desc;\
/obj/item/implanter/spell/##subtype_path/imp_type = /obj/item/implant/spell/##subtype_path;\
/obj/item/implanter/spell/##subtype_path/name = imp_name;\
/obj/item/implanter/spell/##subtype_path/desc = imp_desc;

ADD_IMPLANTER(/datum/action/cooldown/spell/basic_heal,basic_heal,"spell implanter (basic heal)","Minor healing ability.")
ADD_IMPLANTER(/datum/action/cooldown/spell/jaunt/ethereal_jaunt, jaunt,"spell implanter (ethereal jaunt)", "Gives you the magical ability to pass briefly into the byond.")
ADD_IMPLANTER(/datum/action/cooldown/spell/aoe/knock, knock,"spell implanter (knock)", "A cute trick to open doors for your date.  Or, just, in general.")
ADD_IMPLANTER(/datum/action/cooldown/spell/forcewall,forcewall, "spell implanter (forcewall)", "The best way to play keep-away.")
ADD_IMPLANTER(/datum/action/cooldown/spell/charge, charge, "spell implanter (charge)","You've got the touch, you've got the power.  Yeah!")
ADD_IMPLANTER(/datum/action/cooldown/spell/teleport/radius_turf/blink,blink,"spell implanter (blink)","Don't cast this spell, or you'll miss it.")
ADD_IMPLANTER(/datum/action/cooldown/spell/teleport/area_teleport/wizard,teleport,"spell implanter (teleport)","Takes you where you want to go.  Mostly.")

ADD_IMPLANTER(/datum/action/cooldown/spell/aoe/repulse,repulse,"spell implanter (repulse)","Makes you repulsive, you handsome devil you.")
ADD_IMPLANTER(/datum/action/cooldown/spell/timestop,timestop,"spell implanter (timestop)","One, two, three, RED LIGHT!")

ADD_IMPLANTER(/datum/action/cooldown/spell/conjure/presents,presents,"spell implanter (the Santa clause)","There are no seasons in space.  It's always present day.")
ADD_IMPLANTER(/datum/action/cooldown/spell/conjure_item/snowball,snowball,"spell implanter (snowball)","SNOWBALL FIGHT")


//Dangerous
ADD_IMPLANTER(/datum/action/cooldown/spell/touch/smite,smite,"spell implanter (smite)","Much more powerful than a slap to the face.")
ADD_IMPLANTER(/datum/action/cooldown/spell/aoe/magic_missile,magic_missile,"spell implanter (magic missile)","Less effective against the darkness than you might have heard.")
ADD_IMPLANTER(/datum/action/cooldown/spell/pointed/projectile/fireball,fireball,"spell implanter (fireball)","Gives you the power to explode things.")
ADD_IMPLANTER(/datum/action/cooldown/spell/pointed/projectile/lightningbolt,lightningbolt,"spell implanter (lightning bolt)", "Whomsoever is inject with this implant, if they should be worthy, shall inherit the powers of Thor.")

// This block is for fun and should not appear in real rounds.
// If it were to be made real-round ready, a less overpowered chemical should be used
// and possibly some other changes should be made.
/datum/action/cooldown/spell/conjure/bee/admin
	name = "Better Summon Bees"
	desc = "Been in an accident?  Need help fast?  Better call bees."
	invocation = "YES THE BEES"

// This is pretty gross but I don't want to edit the simplemob unit test
/datum/action/cooldown/spell/conjure/bee/admin/post_summon(atom/summoned_object, atom/cast_on)
	. = ..()
	var/mob/living/basic/bee/newbee = summoned_object
	if (!istype(newbee))
		return
	newbee.melee_damage_upper = 0
	newbee.melee_damage_lower = 0
	newbee.assign_reagent(GLOB.chemical_reagents_list[/datum/reagent/medicine/adminordrazine])

ADD_IMPLANTER(/datum/action/cooldown/spell/conjure/bee/admin,beedrest,"spell implanter (Better Summon Bees)","Been in an accident?  Need help fast?  Better call bees.")

#undef ADD_IMPLANTER
