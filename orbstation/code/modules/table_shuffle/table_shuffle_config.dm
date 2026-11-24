//
// Configuration options - see game_options.txt
//

// turn off entirely
/datum/config_entry/flag/disable_table_shuffle
	default = TRUE

// limit to free vending only (vended objects can still decay, set eat_prob to 0 to disable)
/datum/config_entry/flag/shuffle_vend_only

// Only dispense free things from vending machines that are this expensive or less
/datum/config_entry/number/shuffle_vend_budget
	default = 150
	min_val = 0
	max_val = 9999

// I settled on a probability scale that ramps up and down at different rates
// Starting value MIN, ramp up for every potential table/rack/vendor/etc
// When you actually do something, ramp down.
// The first failed probability check ends the area's shuffle.
// This system is probably overly complicated, but it could allow you to
// generate a lot of events for complex areas, and very few events for the rest
// or a high floor that is relatively constant
/datum/config_entry/number/shuffle_min_prob
	integer = FALSE
	default = 15
	min_val = 0
	max_val = 200
/datum/config_entry/number/shuffle_max_prob
	integer = FALSE
	default = 75
	min_val = 0
	max_val = 200
/datum/config_entry/number/shuffle_add_prob
	integer = FALSE
	default = 5
	min_val = 0
	max_val = 200
/datum/config_entry/number/shuffle_sub_prob
	integer = FALSE
	default = 10
	min_val = 5 // this cannot be zero, because if the probability gets to or above 100% you need something to pull it back down
	max_val = 200

// Note that eat_prob and visual_prob do not operate on the same sliding scale and are flat.
// Eat is only run on shuffled items, while the visual muss-up check is done on all table/rack items, including ones that don't move.
// Both of these can be disabled per-area.
// Note also that visual mussing is not logged.  Don't run it where item positioning is precise (surgery tools, etc).
/datum/config_entry/number/shuffle_eat_prob
	integer = FALSE
	default = 50 // high because it's interesting and you don't really care about the item anyway
	min_val = 0
	max_val = 100
/datum/config_entry/number/shuffle_visual_prob
	integer = FALSE
	default = 5 // low because it can happen a whole lot and can be irritating
	min_val = 0
	max_val = 100

// The high roller list is mainly for debugging.  This many affected items put an area on the list.
/datum/config_entry/number/shuffle_high_roller_threshold
	default = 5
	min_val = 1
