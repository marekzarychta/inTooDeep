if (place_meeting(x, y, oPlayer) && global.current_k == 1) {
	if (oCamera.midX - x < 0) {
		step_offset = x - oCamera.midX;
	}
}

if (place_meeting(x, y, oPlayer)) {
	oCamera.changing = false;
	global.current_k = 1 + speed_x * (oPlayer.x - x);
	if (global.current_k > k) {
		global.current_k = k;	
	} else if (global.current_k < 1) {
		global.current_k = 1;	
	}
	
	instantCameraMoveToPos(x + (step_x) * (global.current_k - 1) - step_offset, y + step_y * (global.current_k - 1));
}

zoom(global.current_k, orginalW, orginalH);

if (global.current_k == 1) {
	oCamera.changing = true;
}