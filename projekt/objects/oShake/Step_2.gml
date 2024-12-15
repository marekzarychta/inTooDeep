
shake_time -= 1; 
var _xval = choose(-shake_magnitude, shake_magnitude); 
var _yval = choose(-shake_magnitude, shake_magnitude); 
//camera_set_view_pos(view_camera[0], _xval, _yval); 
oCamera.midX += _xval;
oCamera.midY += _yval;

if (shake_time <= 0) 
{ 
	shake_magnitude -= shake_fade; 
	//slowCameraMoveToPos(oPlayer.x, oPlayer.y, 10);
	if (shake_magnitude <= 0) 
	{ 
		
	    
	    oCamera.changing = true;
		oCamera.shaking = false;
		instance_destroy();
	} 
} 

