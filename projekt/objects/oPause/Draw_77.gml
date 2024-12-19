// We only ever need RGB from our game screen (disables alpha)
gpu_set_blendenable(false);

if(pause) {

	surface_set_target(application_surface);
	if(surface_exists(pauseSurf)) {
		draw_surface(pauseSurf, 0, 0);
	} else { // Restore from buffer if lost
		pauseSurf = surface_create(resW, resH);
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	surface_reset_target();

}

// We hit escape to pause the game

if (keyboard_check_pressed(vk_escape)) {

	// If not paused, pause
	if(!pause) {
	
		pause = true;
		
		// Deactivate anything besides this instance
		instance_deactivate_all(true);
		
		// Capture the game moment when pause was hit
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// Backup to a buffer if we lose the surface (apparently happens)
		if(buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);
		}
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);	
	} else { // If paused, unpause
	
		pause = false;
		instance_activate_all();
		if(surface_exists(pauseSurf)) {
			surface_free(pauseSurf);
		}
		if(buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);
		}
	
	}

}

gpu_set_blendenable(true);
