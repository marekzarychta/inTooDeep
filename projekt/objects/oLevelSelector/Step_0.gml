if (active) {
		
	y += vel;
	if (y > 0) {
		y = 0;	
		alfa_time--;
		if (alfa_time < 0) {
			alfa_time = 0;	
		}
	}
	
	
	alfa = 1 - alfa_time / alfa_buff;
	
	if (alfa == 1) {
	
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
	

		if (!keyboard) {
			if (mx > x + multply * buttons[0][0] && mx < x + multply * buttons[0][2] && my > multply * buttons[0][1] && my < multply * buttons[0][3]) {
				index = 1;
			} else if (mx > x + multply * buttons[1][0] && mx < x + multply * buttons[1][2] && my > multply * buttons[1][1] && my < multply * buttons[1][3]) {
				index = 2;	
			} else if (mx > x + multply * buttons[2][0] && mx < x +  multply * buttons[2][2] && my > multply *  buttons[2][1] && my < multply *  buttons[2][3]) {
				index = 3;
			} else if (mx > x + multply * buttons[3][0] && mx < x +  multply * buttons[3][2] && my > multply *  buttons[3][1] && my < multply *  buttons[3][3]) {
				index = 4;
			} else {
				index = 0;
			}
		} else {

			if (downKey) {
				index++;
				//index %= 3;
				if (index > 4) index = 1;
			}

			if (upKey) {
				index--;
				if (index < 1) index = 3;
			}
		}



		if (acceptKey) {
			
			if (index == 1) {
				if (instance_exists(oGlobal)) {
					oGlobal.played_entry_cutscene = true;	
					
				}
				chosed = true;
				room_choosed = 1;
				//room_goto(demo);	
			} else if (index == 2) {
				chosed = true;
				room_choosed = 2;
				//room_goto(demo2);
			} else if (index == 3) {
				chosed = true;
				room_choosed = 3;
				//room_goto(demo3);
			} else if (index == 4) {
				active = false;
			}
			if (index != 0) {
				active = false;
				return_anim = true;	
			}
		}
	}
} else {
	if (return_anim) {
		
		index = 0;
		
		alfa_time++;
		
		if (alfa_time > alfa_buff) {
			alfa_time = alfa_buff;	
		}
	
	
	
		alfa = 1 - alfa_time / alfa_buff;
	
		if (alfa == 0) {
		
			y -= vel;
			if (y < start_y) {
				return_anim = false;
				if (instance_exists(oMenu)) {
					if (!chosed) {
						oMenu.active = true;
					}
					oMenu.level_select = false;
					oMenu.sprite_index = sMenuUI;
					oMenu.option = 0;
				}
			}
		}
	}
}

//if (!instance_exists(oMenu) && chosed && instance_exists(oGlobal)) {
//	oGlobal.roomCounter = room_choosed;
//	switch (room_choosed) {
//		case 1:
//		room_goto(demo);	
//		break;
//		case 2: 
//		room_goto(demo2);	
//		break;
//		case 3:
//		room_goto(demo3);	
//		break;
//	}
//}