if (pause) {
	checkpoint = true;	
	pause = false;
	instance_activate_all();
	if(surface_exists(pauseSurf)) {
		surface_free(pauseSurf);
	}
	if(buffer_exists(pauseSurfBuffer)) {
		buffer_delete(pauseSurfBuffer);
	}
	gpu_set_blendenable(true);
	room_goto(Menu);
}