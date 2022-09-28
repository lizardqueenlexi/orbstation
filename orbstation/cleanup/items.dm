/obj/item/slimepotion/genderchange
	desc = "An interesting chemical mix that changes the gender of what it's applied to. Can only be used on yourself."

/obj/item/slimepotion/genderchange/attack(mob/living/L, mob/user)
	if(L != user)
		to_chat(user, span_warning("You can't use this on someone else!"))
		return

	..()

/obj/item/storage/book/bible
	name = "holy book"
	icon_state = "holybook"
	inhand_icon_state = "holybook"
	worn_icon_state = "holybook"

/obj/item/food/raw_meatball
	desc = "A great meal all round. Kinda raw"

/obj/item/food/meatball
	desc = "A great meal all round."

// Removed reference to tiziran genocide.
/obj/item/weaponcrafting/gunkit/temperature
	desc = "A suitcase containing the necessary gun parts to tranform a standard energy gun into a temperature gun. Fantastic at birthday parties and for mowing down snowmen."

// Replaced tohou joke which wasn't very funny
/obj/item/clothing/head/rabbitears
	name = "rabbit ears"
	desc = "bnuuy"
