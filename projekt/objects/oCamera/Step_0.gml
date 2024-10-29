if instance_exists(oPlayer) {

	
	if (oPlayer.x < midX - boxSizeX && oPlayer.xspd < 0) || (oPlayer.x > midX + boxSizeX && oPlayer.xspd > 0 ) {
		midX += oPlayer.xspd;	
	}
	
	var current_x = camera_get_view_x(view_camera[0]);
	
	_camX = midX - _camWidth / 2;
	_camY = oPlayer.y - _camHeight / 2;
	
	_camX = clamp(_camX, leftEdge, rightEdgeX);
	_camY = clamp(_camY, leftEdge, rightEdgeY);
	
	
	
	if (abs(current_x - _camX) > 1) {
		timerNotMoving = bufferNotMoving;
		xspd = 0;
	} else if (abs(current_x - _camX) < 1 && timerNotMoving > 0) {
		timerNotMoving--;
		xspd = 0;
	} else if (abs(midX - oPlayer.x) > 1) {
		xspd = sign(oPlayer.x - midX) * centrVel;
	} else {
		xspd = 0;	
		timerNotMoving = bufferNotMoving;
	}

	midX += xspd;

	_camX = midX - _camWidth / 2;
	_camY = oPlayer.y - _camHeight / 2;
	
	_camX = clamp(_camX, leftEdge, rightEdgeX);
	_camY = clamp(_camY, leftEdge, rightEdgeY);
	
	camera_set_view_pos(view_camera[0], _camX, _camY);	
}


