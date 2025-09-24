var upKey = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
upKey = clamp(upKey, 0, 1);

var downKey = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
downKey = clamp(downKey, 0, 1);
	
if (upKey || downKey) keyboard = true;
	
	
var deadzone = 0.2; // Ustawienie strefy martwej
	
var axisY = gamepad_axis_value(0, gp_axislv);

if (mouse_x != prev_mouseX || mouse_y != prev_mouseY) {
	prev_mouseY = mouse_y;
	prev_mouseX = mouse_x;
	keyboard = false;
}



if (abs(axisY) < deadzone) {
	axisY = 0;
	onlyOne = true;
} else {
	if (onlyOne) {
		axisY = (axisY - sign(axisY) * deadzone) / (1 - deadzone);
		if (axisY > 0) downKey = 1;
		else upKey = 1;
		onlyOne = false;
	}
}
	
var acceptKey = keyboard_check_pressed(ord("E")) + keyboard_check_pressed(vk_enter) + mouse_check_button_pressed(mb_left) + gamepad_button_check_pressed(0,gp_face1);
acceptKey = clamp(acceptKey, 0, 1);

if (instance_exists(oGlobal)) {
	if (!oGlobal.gui) {
		pauseKey = gamepad_button_check_pressed(0, gp_start) + keyboard_check_pressed(vk_escape);
		pauseKey = clamp(pauseKey, 0, 1);
		
		if (pauseKey) {			
			
			if (wasPaused) {
				wasPaused = false;	
				setUIvisibility(true);
				window_set_cursor(cr_none);
			} else {
				wasPaused = true;
				setUIvisibility(false);
				if (instance_exists(oCamera)) {
					//start_x = oCamera._camX;
					//start_y = oCamera._camY;	
					y = -1920;
					x = 0;
					animation = true;
				}
				window_set_cursor(cr_arrow);
			}
		}
		
		
	}
}

if (animation) {
	y += vely;
	if (y >= 0) {
		y = 0;
		animation = false;
	}
}

//index = 0;

//show_debug_message("x: "+string(device_mouse_x(0)) + ": ");
//show_debug_message("y: "+string(device_mouse_y(0))+ ";\n");
//
//for (var i = 0; i < 3; i++) {
//	if (mouse_x > x + 5 * buttons[i][0] && mouse_x < x + 5 * buttons[i][2] && mouse_y > 5 *buttons[i][1] && mouse_y < 5 * buttons[i][3]) {
//		index = i;
//	}
//}

if (!keyboard) {
	if (mouse_x > x + buttons[0][0] && mouse_x < x + buttons[0][2] && mouse_y > buttons[0][1] && mouse_y < buttons[0][3]) {
		index = 1;
	} else if (mouse_x > x + buttons[1][0] && mouse_x < x + buttons[1][2] && mouse_y > buttons[1][1] && mouse_y < buttons[1][3]) {
		index = 2;	
	} else if (mouse_x > x + buttons[2][0] && mouse_x < x +  buttons[2][2] && mouse_y >  buttons[2][1] && mouse_y <  buttons[2][3]) {
		index = 3;
	} else {
		index = 0;
	}
} else {

	if (downKey) {
		index++;
		//option %= 3;
		if (index > 3) index = 1;
	}

	if (upKey) {
		index--;
		if (index < 1) index = 3;
	}
}
