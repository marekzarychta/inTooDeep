if (place_meeting(x, y, oPlayer) && global.current_k == 1) {
	
	dx = wspX - x;
	dy = wspY - y;
	step_x = dx / (k - 1);
	step_y = dy / (k - 1);
	start_offset = abs(oCamera.midX - x);
}

//if (oPlayer.x < wspX) {
//	global.step_offset = start_offset;
//} else {
//	global.step_offset = -start_offset;	
//}

if (place_meeting(x, y, oPlayer)) {
	oCamera.changing = false;
	global.current_k = 1 + speed_x * (oPlayer.x - x);
	if (global.current_k > k) {
		global.current_k = k;	
	} else if (global.current_k < 1) {
		global.current_k = 1;	
	}
	
	instantCameraMoveToPos(x - increase_dir * start_offset * (k - global.current_k) / (k - 1) + (step_x) * (global.current_k - 1), y + step_y * (global.current_k - 1));
}

zoom(global.current_k, orginalW, orginalH);

if (global.current_k == 1) {
	oCamera.changing = true;
}

//if (oPlayer.x > wspX) {
//	global.step_offset = oCamera.midX - x;	
//}

