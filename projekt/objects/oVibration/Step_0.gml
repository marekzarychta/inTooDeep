if (vib_timer == 0) {
	gamepad_set_vibration(0, force, force);
}

if (vib_timer < vib_buffer) {
	vib_timer++;
} else {
	gamepad_set_vibration(0, 0, 0);	
	instance_destroy();
}