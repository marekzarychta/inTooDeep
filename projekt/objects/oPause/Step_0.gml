var upKey = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
upKey = clamp(upKey, 0, 1);

var downKey = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
downKey = clamp(downKey, 0, 1);
	
if (upKey || downKey) keyboard = true;

var mx = window_mouse_get_x();
var my = window_mouse_get_y();

	
var deadzone = 0.2; // Ustawienie strefy martwej
	
var axisY = gamepad_axis_value(0, gp_axislv);

if (mx != prev_mouseX || my != prev_mouseY) {
	prev_mouseY = my;
	prev_mouseX = mx;
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
					y = -window_get_height();
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

//show_debug_message("x: "+string(device_mx(0)) + ": ");
//show_debug_message("y: "+string(device_my(0))+ ";\n");
//
//for (var i = 0; i < 3; i++) {
//	if (mx > x + 5 * buttons[i][0] && mx < x + 5 * buttons[i][2] && my > 5 *buttons[i][1] && my < 5 * buttons[i][3]) {
//		index = i;
//	}
//}

var multply = window_get_width() / sprite_width;
if (pause) {
	if (!keyboard) {
		if (mx > x + multply * buttons[0][0] && mx < x + multply * buttons[0][2] && my > multply * buttons[0][1] && my < multply * buttons[0][3]) {
			index = 1;
		} else if (mx > x + multply * buttons[1][0] && mx < x + multply * buttons[1][2] && my > multply * buttons[1][1] && my < multply * buttons[1][3]) {
			index = 2;	
		} else if (mx > x + multply * buttons[2][0] && mx < x +  multply * buttons[2][2] && my > multply *  buttons[2][1] && my < multply *  buttons[2][3]) {
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

	if (acceptKey) {
		
		switch(index) {
			case 2:
				
				checkpoint = true;	
				instance_activate_all();
				if(surface_exists(pauseSurf)) {
					surface_free(pauseSurf);
				}
				if(buffer_exists(pauseSurfBuffer)) {
					buffer_delete(pauseSurfBuffer);
				}
				gpu_set_blendenable(true);
				if (instance_exists(oPlayer)) {
					with (oPlayer) {
						event_perform(ev_keypress, vk_enter);	
					}
				}	
				
			case 1:
				
				pauseKey = 1;
			
				if (wasPaused) {
					wasPaused = false;	
					setUIvisibility(true);
					window_set_cursor(cr_none);
				}	
				
			break;
			
			case 3:
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
				
				break;
				
		}
		
	}
}