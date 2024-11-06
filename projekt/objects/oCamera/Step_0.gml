if instance_exists(oPlayer) {

	
	if (oPlayer.x < midX - boxSizeX && oPlayer.xspd < 0) || (oPlayer.x > midX + boxSizeX && oPlayer.xspd > 0 ) {
		midX += oPlayer.xspd;	
	}
	var playerFollowing = false;
	if (oPlayer.y < midY - boxSizeY && oPlayer.yspd < 0) || (oPlayer.y > midY && oPlayer.yspd > 0 ) {
		midY += oPlayer.yspd;	
		playerFollowing = true;
	}
	
	
	//var dy = oPlayer.y - _camHeight / 2 - _camY;
	
	//if (abs(oPlayer.xspd) > 0) {
	//	timerNotMovingX = bufferNotMovingX;
	//	xspd = 0;
	//} else if (abs(oPlayer.xspd) == 0 && timerNotMovingX > 0) {
	//	timerNotMovingX--;
	//	xspd = 0;
	//} else if (abs(midX - oPlayer.x) > 1) {
	//	xspd = sign(oPlayer.x - midX) * centrVel;
	//} else {
	//	xspd = 0;	
	//	timerNotMovingX = bufferNotMovingX;
	//}
	
	//if (abs(oPlayer.yspd) > 0) {
	//	timerNotMovingY = bufferNotMovingY;
	//	yspd = 0;
	//} else if (abs(oPlayer.yspd) == 0 && timerNotMovingY > 0) {
	//	timerNotMovingY--;
	//	yspd = 0;
	//} else if (abs(midY - oPlayer.y) > 1) {
	//	yspd = sign(oPlayer.y - midY) * centrVel;
	//} else {
	//	yspd = 0;	
	//	timerNotMovingY = bufferNotMovingY;
	//}
	
	if (abs(midY - oPlayer.y) > 1) && !playerFollowing && oPlayer.onGround {
		yspd = sign(oPlayer.y - midY) * centrVel;
	} else {
		yspd = 0;	
	}

	//if abs(dy) > 1 { 
	//	_camY += yspd * sign(dy);
	//}

	midX += xspd;
	
	if abs(midY - oPlayer.y) + yspd > 1
		midY += yspd;

	_camX = midX - _camWidth / 2;
	_camY = midY - _camHeight / 2;
	
	
	_camX = clamp(_camX, leftEdge, rightEdgeX);
	_camY = clamp(_camY, leftEdge, rightEdgeY);
	
	camera_set_view_pos(view_camera[0], _camX, _camY);	
}


