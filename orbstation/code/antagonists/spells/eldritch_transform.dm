/// Turn into an eldritch creature, many of these have their own spells so this is pretty good value as utility
/datum/action/cooldown/spell/shapeshift/eldritch_monster
	name = "Eldritch Becoming"
	desc = "Endure a horrific transformation into a creature of darkness for a time to use their unnatural abilities. \
		Once you've made your choice, it cannot be changed."

	background_icon_state = "bg_demon"
	button_icon_state = "soultap"

	sound = 'sound/magic/demon_consume.ogg'
	cooldown_time = 30 SECONDS
	cooldown_reduction_per_rank = 3 SECONDS

	invocation = "Someone does a weird gesture." // Overriden in before cast
	invocation_self_message = span_cult_bold("Your flesh unravels and reknits itself!")
	invocation_type = INVOCATION_EMOTE
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	possible_shapes = list(
		/mob/living/basic/shade, // You can move really fast and ventcrawl I guess, beware of the chaplain's soul shard!
		/mob/living/basic/construct/wraith/mystic,
		/mob/living/basic/construct/artificer/mystic,
		/mob/living/basic/construct/juggernaut/mystic,
		/mob/living/basic/heretic_summon/raw_prophet,
		/mob/living/basic/heretic_summon/rust_walker,
		/mob/living/basic/heretic_summon/ash_spirit
	)

/datum/action/cooldown/spell/shapeshift/eldritch_monster/before_cast(atom/cast_on)
	. = ..()
	invocation = span_cult_bold("<b>[cast_on]</b> writhes and shudders as [cast_on.p_their()] body twists unnaturally!")

/// Make anyone who watches this happen very upset
/datum/action/cooldown/spell/shapeshift/eldritch_monster/after_cast(atom/cast_on)
	. = ..()

	var/turf/origin = get_turf(cast_on)
	var/list/audience = view(3, origin)
	audience -= cast_on
	for (var/mob/living/watcher in audience)
		watcher.add_mood_event("eldritch transformation", /datum/mood_event/horrific_transformation)

	var/obj/effect/particle_effect/fluid/smoke/poof = new(origin)
	poof.lifetime = 2 SECONDS
	poof.color = "#b80000"

/datum/mood_event/horrific_transformation
	description = "I really did not enjoy watching that!"
	mood_change = -4
	timeout = 5 MINUTES
