if instance_exists(oPlayer) {
	if (changing) {
		//centrVel = abs(oPlayer.xspd) - 0.01;
		if (oPlayer.x < midX - boxSizeX && oPlayer.xspd < 0) || (oPlayer.x > midX + boxSizeX && oPlayer.xspd > 0 ) {
			midX += oPlayer.xspd;	
		}
	
		var playerFollowing = false;
		if (oPlayer.y < midY - boxSizeY && oPlayer.currentState == states.FLYING) || (oPlayer.y > midY && oPlayer.currentState == states.FALL) {
			midY += oPlayer.yspd;	
			playerFollowing = true;
		}
	
		if (oPlayer.currentState == states.LADDERCLIMB || oPlayer.currentState == states.LADDERIDLE) && abs(oPlayer.y - midY) > 1 {
			slowCameraMoveToPos(oPlayer.x, oPlayer.y, abs(2 * oPlayer.yspd));
			
		} else if (oPlayer.currentState == states.LADDERCLIMB || oPlayer.currentState == states.LADDERIDLE) {
			midY = oPlayer.y;	
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
			yspd = sign(oPlayer.y - midY) * (centrVel > abs(oPlayer.yspd) ? centrVel - 0.01 : abs(oPlayer.yspd) - 0.01);
		} else {
			yspd = 0;	
		}

		//if abs(dy) > 1 { 
		//	_camY += yspd * sign(dy);
		//}

		midX += xspd;
	
		if abs(midY - oPlayer.y) + yspd > 1
			midY += yspd;
	}
	_camX = midX - _camWidth / 2;
	_camY = midY - _camHeight / 2;
	
	
	_camX = clamp(_camX, leftEdge, rightEdgeX);
	_camY = clamp(_camY, leftEdge, rightEdgeY);
	
	camera_set_view_pos(view_camera[0], _camX, _camY);	
}


