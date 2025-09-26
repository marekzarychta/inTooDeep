if (debug_mode) {

	screen_mode = !screen_mode

	if (screen_mode) {
		setUIvisibility(false);
	} else {
		setUIvisibility(true);
		camera_set_view_size(view_camera[0], _camWidth, _camHeight);
	}
}