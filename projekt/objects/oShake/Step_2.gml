
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
		if (!edge) {
			slowCameraMoveToPos(oPlayer.x, oPlayer.y, 1);
		} else {
			instantCameraMoveToPos(oPlayer.x, oPlayer.y);	
		}
	    oCamera.changing = true;
		oCamera.shaking = false;
		if (abs(oPlayer.x - oCamera.midX) < 1 && abs(oPlayer.y - oCamera.midY) < 1)
			instance_destroy();
	} 
} 

