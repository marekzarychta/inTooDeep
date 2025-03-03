
if (shaking) {
	shake_time -= 1; 
	var _xval = choose(-shake_magnitude, shake_magnitude); 
	var _yval = choose(-shake_magnitude, shake_magnitude); 
	//camera_set_view_pos(view_camera[0], _xval, _yval); 

	oCamera.midX += _xval;
	oCamera.midY += _yval;
}


if (shake_time <= 0) 
{ 
	shake_magnitude -= shake_fade; 
	//slowCameraMoveToPos(oPlayer.x, oPlayer.y, 10);
	if (shake_magnitude <= 0) 
	{ 
		shaking = false;
		if (instance_exists(oPlayer)) {
			if (!edge) {
				slowCameraMoveToPos(oPlayer.x, oPlayer.y, 2);
			} else {
				instantCameraMoveToPos(oPlayer.x, oPlayer.y);	
			}
		} else {
			
			slowCameraMoveToPos(room_width / 2, room_height / 2, 2);
			
		}
	    oCamera.changing = true;
		oCamera.shaking = false;
		if (instance_exists(oPlayer)) {
			if (abs(oPlayer.x - oCamera.midX) < oCamera.boxSizeX - 1 && abs(oPlayer.y - oCamera.midY) < 2) {
				instance_destroy();
			}
		} else {
			if (abs(room_width / 2 - oCamera.midX) < 2 && abs(room_height / 2 - oCamera.midY) < 2) {
				instance_destroy();
			}
		}
	} 
} 

