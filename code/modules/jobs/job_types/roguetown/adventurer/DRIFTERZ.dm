
/*
	Once again we are back here, ha hahaha....
*/
/datum/job/roguetown/drifters
	title = "Drifter"
	flag = WAVE_DRIFTER
	department_flag = PEASANTS
	faction = "Station"

	// Everyone can be a homeless man looking for work!
	allowed_races = ALL_RACES_LIST_NAMES

	tutorial = "A drifter of unknown origin searching things such as fame, fortune, and perhaps just some work to do."


	outfit = null
	outfit_female = null

	display_order = JDO_DRIFTER
	show_in_credits = FALSE
	max_pq = null
	min_pq = -999
	wanderer_examine = TRUE
	advjob_examine = TRUE

	total_positions = 0
	spawn_positions = 0

	free_slot_rolls_count = 5
	combat_slot_rolls_count = 3
	var/current_migrants = 0

/datum/job/roguetown/drifters/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

		if(GLOB.adventurer_hugbox_duration)
			///FOR SOME RETARDED FUCKING REASON THIS REFUSED TO WORK WITHOUT A FUCKING TIMER IT JUST FUCKED SHIT UP
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_start)), 1)

	// ha ha ha heres the snowflake logic for the shit!
	current_migrants++ // Add one
	if(current_migrants == 50) // When we hit the number of approximately 50
		combat_slot_rolls_count = 0 // Set the combat slots roll count to 0, no more hobo fighters are entering for free

