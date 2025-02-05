if (!oGlobal.gui) {
	pauseKey = gamepad_button_check_pressed(0, gp_start) + keyboard_check_pressed(vk_escape);
	pauseKey = clamp(pauseKey, 0, 1);
}
