#define FALSE_ALARM_COOLDOWN_LENGTH_MIN (20 MINUTES)
#define FALSE_ALARM_COOLDOWN_LENGTH_MAX (30 MINUTES)
#define SENSOR_TYPE_PROBABILITY 50
#define INTRUDER_ANNOUNCE_PROBABILITY 5

/// Station trait that gives the station information on syndicate activity on the station, but sometimes fires false positives
/datum/station_trait/sensitive_equipment
	name =  "Advanced Sensory Equipment"
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 5
	show_in_report = TRUE
	report_message = "We have installed advanced sensors, we will alert you to all syndicate activity on the station."
	/// allows for cooldown of false alarms when it is active.
	COOLDOWN_DECLARE(false_alarm_cooldown)
	COOLDOWN_DECLARE(objective_announcement_cooldown)
	COOLDOWN_DECLARE(purchase_announcement_cooldown)

/datum/station_trait/sensitive_equipment/New()
	trait_processes = prob(30) // when this triggers, the false alarm version of this trait will activate
	return ..()


/datum/station_trait/sensitive_equipment/on_round_start()
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_BB_PAD_COMPLETE, PROC_REF(activate_objective_announcement))
	RegisterSignal(SSdcs, COMSIG_GLOB_UPLINK_PURCHASE, PROC_REF(activate_purchase_announcement))
	COOLDOWN_START(src, false_alarm_cooldown, rand(FALSE_ALARM_COOLDOWN_LENGTH_MIN, FALSE_ALARM_COOLDOWN_LENGTH_MAX))

/datum/station_trait/sensitive_equipment/process(delta_time)
	if(!COOLDOWN_FINISHED(src, false_alarm_cooldown))
		return

	COOLDOWN_START(src, false_alarm_cooldown, rand(FALSE_ALARM_COOLDOWN_LENGTH_MIN, FALSE_ALARM_COOLDOWN_LENGTH_MAX))

	if(prob(INTRUDER_ANNOUNCE_PROBABILITY))
		priority_announce("Encrypted communications intercepted in the vicinity of [station_name()]. There is an unknown threat aboard.", "Security Alert", ANNOUNCER_INTERCEPT)
		return
	if(prob(SENSOR_TYPE_PROBABILITY))
		activate_objective_announcement()
		return
	activate_purchase_announcement()

/// proc that finds the announcement system to call the objective announcement proc
/datum/station_trait/sensitive_equipment/proc/activate_objective_announcement()
	if(!COOLDOWN_FINISHED(src, objective_announcement_cooldown))
		return
	var/obj/machinery/announcement_system/announcer = pick(GLOB.announcement_systems)
	announcer.announce_uplink_objective()
	COOLDOWN_START(src, objective_announcement_cooldown, 2 MINUTES)

///  proc that finds the announcement system to call the uplink purchase announcement proc
/datum/station_trait/sensitive_equipment/proc/activate_purchase_announcement()
	if(!COOLDOWN_FINISHED(src, purchase_announcement_cooldown))
		return
	var/obj/machinery/announcement_system/announcer = pick(GLOB.announcement_systems)
	announcer.announce_uplink_purchase()
	COOLDOWN_START(src, purchase_announcement_cooldown, 2 MINUTES)

//allows for a global signal to be sent when any purcahse is made for the purposes of this station trait
/datum/uplink_handler/purchase_item(mob/user, datum/uplink_item/to_purchase, atom/movable/source)
	. = ..()
	if(!.)
		return FALSE
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_UPLINK_PURCHASE, to_purchase)


/// Accuratly reads signals to alert the crew that a traitor secondary objective has been turned in
/obj/machinery/announcement_system/proc/announce_uplink_objective()
	if (!is_operational)
		return
	broadcast("We have detected encrypted communications that indicate a succesful enemy operation.", list(null, RADIO_CHANNEL_SECURITY))

/// Accuratly reads signals to alert the crew that an item has been bought or an objective has been turned in
/obj/machinery/announcement_system/proc/announce_uplink_purchase()
	if (!is_operational)
		return
	broadcast("We have detected illicit market activity on the station.", list(null, RADIO_CHANNEL_SECURITY))

#undef FALSE_ALARM_COOLDOWN_LENGTH_MIN
#undef FALSE_ALARM_COOLDOWN_LENGTH_MAX
#undef SENSOR_TYPE_PROBABILITY
#undef INTRUDER_ANNOUNCE_PROBABILITY
