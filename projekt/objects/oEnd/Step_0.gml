if (!finish) time++;

var key =  gamepad_button_check_pressed(0,gp_face1) + keyboard_check_pressed(vk_anykey) + mouse_check_button_pressed(mb_any);
key = clamp(key, 0, 1);

if (time % 3 == 0 && !dots && !finish) {
	
	index++;
	
	if (index > string_length(text) - 3) {
		dots = true;
		time = 0;
	}
	
}

if (dots) {
	if (time % 50 == 49) {
		index++;	
		if (index > string_length(text)) {
			dots = false;
			
			time = 0;
		}
	}
}

if (!finish && key) {
	finish = true;
}

if (finish) {
	var transition = instance_create_depth(x, y, depth - 2, oTransition);
	transition.fade_out = true;
	transition.setnextroom = true;
	transition.setnextroom_value = Menu;	
	transition.speed = 0.01;
}

