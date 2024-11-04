///overrides the tgstation transform gland in favor of one more anno

/obj/item/organ/heart/gland/transform
	abductor_hint = "anthropmorphic transmorphosizer. The abductee will stretch and squash, which is disorienting."
	cooldown_low = 15 SECONDS
	cooldown_high = 60 SECONDS

/obj/item/organ/heart/gland/transform/activate()
	owner.AddElement(/datum/element/squish, rand(25 SECONDS, 90 SECONDS), prob(50))
	owner.emote("scream")
	owner.adjust_jitter(10 SECONDS)
	owner.adjust_confusion(10 SECONDS)
