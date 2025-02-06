if (option == 0) {
	sprite_index = sMenuUITop;
} else {
	sprite_index = sMenuUIBottom;	
}

var upKey = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
upKey = clamp(upKey, 0, 1);

var downKey = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
downKey = clamp(downKey, 0, 1);
	
var acceptKey = keyboard_check_pressed(ord("E")) + keyboard_check_pressed(vk_enter) + mouse_check_button_pressed(mb_left) + gamepad_button_check_pressed(0,gp_face1);
downKey = clamp(downKey, 0, 1);

if (upKey || downKey) {
	option++;
	option %= 2;
}

if (acceptKey) {
	if (option == 0) {
		if (instance_exists(oMenuButton_start)) {
			oMenuButton_start.diff = true;
		} 
	} else {
		if (instance_exists(oMenuButton_exit)) {
			oMenuButton_exit.diff = true;
		} 
	}
}
	