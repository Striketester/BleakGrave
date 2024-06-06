/*
	Schedule next drifter queue wave
	To note here where relevant logic would be
*/

/datum/controller/subsystem/role_class_handler/proc/handle_drifter_wave_scheduling()
	
	var/target_wave_addition = drifter_wave_schedule_buffer - (drifter_wave_schedule.len - current_wave_number)
	if(target_wave_addition <= 0) // target wave additions will enter negatives if we are way past buffer too
		return

	// Filler code for any complex logic rn
	for(var/i in 1 to target_wave_addition)
		drifter_wave_schedule += pick(drifter_wave_data_slabs)

	// Run post run for old wave
	if(current_wave) 
		current_wave.post_drifter_wave()
	// Set a new wave
	current_wave = drifter_wave_schedule[current_wave_number]
	// Run setup for new wave
	current_wave.pre_drifter_wave() 

	

