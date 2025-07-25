// Don't generate ownerless theft objectives
/datum/objective_item/valid_objective_for(list/potential_thieves, require_owner = FALSE)
	require_owner = TRUE
	return ..()

/datum/objective_item/steal/curator_key
	name = "the curator's display case key"
	targetitem = /obj/item/key/displaycase
	excludefromjob = list(JOB_CURATOR)
	item_owner = list(JOB_CURATOR)

/datum/objective_item/steal/captain_suit
	name = "the captain's modular suit"
	targetitem = /obj/item/mod/control/pre_equipped/magnate
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE
	item_owner = list(JOB_CAPTAIN)

/datum/objective_item/steal/ce_suit
	name = "the chief engineer's modular suit"
	targetitem = /obj/item/mod/control/pre_equipped/advanced
	excludefromjob = list(JOB_CHIEF_ENGINEER)
	exists_on_map = TRUE
	item_owner = list(JOB_CHIEF_ENGINEER)

/datum/objective_item/steal/hos_suit
	name = "the head of security's modular suit"
	targetitem = /obj/item/mod/control/pre_equipped/safeguard
	excludefromjob = list(JOB_HEAD_OF_SECURITY)
	exists_on_map = TRUE
	item_owner = list(JOB_HEAD_OF_SECURITY)

/datum/objective_item/steal/rd_suit
	name = "the research director's modular suit"
	targetitem = /obj/item/mod/control/pre_equipped/research
	excludefromjob = list(JOB_RESEARCH_DIRECTOR)
	exists_on_map = TRUE
	item_owner = list(JOB_RESEARCH_DIRECTOR)

/datum/objective_item/steal/cmo_suit
	name = "the chief medical officer's modular suit"
	targetitem = /obj/item/mod/control/pre_equipped/rescue
	excludefromjob = list(JOB_CHIEF_MEDICAL_OFFICER)
	exists_on_map = TRUE
	item_owner = list(JOB_CHIEF_MEDICAL_OFFICER)

/datum/objective_item/steal/loader
	name = "the cargo loader suit"
	targetitem = /obj/item/mod/control/pre_equipped/loader
	excludefromjob = list(JOB_QUARTERMASTER, JOB_CARGO_TECHNICIAN, JOB_SHAFT_MINER)
	exists_on_map = TRUE
	item_owner = list(JOB_QUARTERMASTER, JOB_CARGO_TECHNICIAN)

/datum/objective_item/steal/chain_command
	name = "the chain of command"
	targetitem = /obj/item/melee/chainofcommand
	excludefromjob = list(JOB_CAPTAIN)
	exists_on_map = TRUE
	item_owner = list(JOB_CAPTAIN)

/datum/objective_item/steal/pet
	name = "a pet"
	targetitem =  /obj/item/mob_holder
	/// Typepaths of pet to steal
	var/list/pet_type

/datum/objective_item/steal/pet/target_exists()
	if (!pet_type)
		return FALSE
	return ..()

/datum/objective_item/steal/pet/check_special_completion(obj/item/mob_holder/holder)
	if (!istype(holder))
		return FALSE
	if (!holder.held_mob)
		return FALSE
	return (is_type_in_list(holder.held_mob, pet_type))

/obj/item/mob_holder/add_stealing_item_objective()
	GLOB.steal_item_handler.objectives_by_path[/obj/item/mob_holder] += src

/datum/objective_item/steal/pet/ian
	name = "Ian, without a pet carrier"
	pet_type = list(/mob/living/basic/pet/dog/corgi/ian, /mob/living/basic/pet/dog/corgi/puppy/ian)
	excludefromjob = list(JOB_HEAD_OF_PERSONNEL)
	item_owner = list(JOB_HEAD_OF_PERSONNEL)
	altitems = list(/mob/living/basic/pet/dog/corgi/puppy/ian, /mob/living/basic/pet/dog/corgi/ian)

/datum/objective_item/steal/pet/renault
	name = "Renault, without a pet carrier"
	pet_type = list(/mob/living/basic/pet/fox/renault)
	excludefromjob = list(JOB_CAPTAIN)
	item_owner = list(JOB_CAPTAIN)
	altitems = list(/mob/living/basic/pet/fox/renault)

/datum/objective_item/steal/pet/runtime
	name = "Runtime, without a pet carrier"
	pet_type = list(/mob/living/basic/pet/cat/runtime)
	excludefromjob = list(JOB_CHIEF_MEDICAL_OFFICER)
	item_owner = list(JOB_CHIEF_MEDICAL_OFFICER)
	altitems = list(/mob/living/basic/pet/cat/runtime)

/datum/objective_item/steal/lamarr
	name = "the research director's pet facehugger"
	targetitem = /obj/item/clothing/mask/facehugger/lamarr
	excludefromjob = list(JOB_RESEARCH_DIRECTOR)
	exists_on_map = TRUE
	item_owner = list(JOB_RESEARCH_DIRECTOR)

// Add owners to items missing them

/datum/objective_item/steal/traitor/det_revolver
	item_owner = list(JOB_DETECTIVE)

/datum/objective_item/steal/traitor/chief_engineer_belt
	item_owner = list(JOB_CHIEF_ENGINEER)

/datum/objective_item/steal/traitor/telebaton
	item_owner = list(
		JOB_RESEARCH_DIRECTOR,
		JOB_CAPTAIN,
		JOB_HEAD_OF_SECURITY,
		JOB_HEAD_OF_PERSONNEL,
		JOB_CHIEF_ENGINEER,
		JOB_CHIEF_MEDICAL_OFFICER
	)
