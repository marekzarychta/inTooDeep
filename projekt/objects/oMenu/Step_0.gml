if (active) {

	
	
	if (mouse_x != prev_mouseX || mouse_y != prev_mouseY) {
		prev_mouseY = mouse_y;
		prev_mouseX = mouse_x;
		keyboard = false;
	}

	if (option == 0) {
		sprite_index = sMenuUI;
	} else if (option == 1) {
		sprite_index = sMenuUITop;	
	} else if (option == 2) {
		sprite_index = sMenuUIBottom;	
	}

	var upKey = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
	upKey = clamp(upKey, 0, 1);

	var downKey = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
	downKey = clamp(downKey, 0, 1);
	
	if (upKey || downKey) keyboard = true;
	
	
	var deadzone = 0.2; // Ustawienie strefy martwej
	
	var axisY = gamepad_axis_value(0, gp_axislv);


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
		if (mouse_x > x + upButton[0] && mouse_x < x + upButton[2] && mouse_y > upButton[1] && mouse_y < upButton[3]) {
			option = 1;
		} else if (mouse_x > x + downButton[0] && mouse_x < x + downButton[2] && mouse_y > downButton[1] && mouse_y < downButton[3]) {
			option = 2;
		} else {
			option = 0;
		}
	} else {

		if (downKey) {
			option++;
			//option %= 3;
			if (option > 2) option = 1;
		}

		if (upKey) {
			option--;
			if (option < 1) option = 2;
		}
	}



	if (acceptKey) {
		if (option == 1) {
			if (instance_exists(oMenuButton_start)) {
				active = false;
			} 
		} else if (option == 2) {
			if (instance_exists(oMenuButton_exit)) {
				oMenuButton_exit.diff = true;
			} 
		}
	}
} else {
	sprite_index = sMenuUI;
	y -= vel;
	if (count < time) {
		count++;
	} else {
		//if (sprite_exists(sMenuDwarfAnimation)) {
		//	sMenuDwarfAnimation.speed = 1;
		//}
		shakeCamera(14, 4, 1);
		audio_play_sound(snd_wall_destroy, 0, false);
		instance_destroy();
	}
}
	
