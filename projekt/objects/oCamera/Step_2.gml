if instance_exists(oPlayer) {
	if (changing) {
		//centrVel = abs(oPlayer.xspd) - 0.01;
		if (oPlayer.x < midX - boxSizeX && oPlayer.xspd < 0) || (oPlayer.x > midX + boxSizeX && oPlayer.xspd > 0 ) {
			midX += oPlayer.xspd;	
		}
	
		//var playerFollowing = false;
		//if (oPlayer.y < midY - boxSizeY && oPlayer.yspd < 0) || (oPlayer.y > midY && oPlayer.yspd > 0 ) {
		//	midY += oPlayer.yspd;	
		//	playerFollowing = true;
		//}
		
		//if (abs(oPlayer.yspd) <= 0.2) {
		//	playerFollowing = false;	
		//}
	
	
		//if (abs(midY - oPlayer.y) > 1) && !playerFollowing && oPlayer.onGround {
		//	yspd = sign(oPlayer.y - midY) * (abs(oPlayer.y - midY) - 0.01);
			
		//} else {
		//	yspd = 0;	
		//}

		//if abs(dy) > 1 { 
		//	_camY += yspd * sign(dy);
		//}

		midX += xspd;
	
		//if abs(midY - oPlayer.y) + abs(yspd) > 1
		//	midY += yspd;
		midY = oPlayer.y;
	}
	_camX = midX - _camWidth / 2;
	_camY = midY - _camHeight / 2;
	
	
	_camX = clamp(_camX, leftEdge, rightEdgeX);
	_camY = clamp(_camY, leftEdge, rightEdgeY);
		

	
	camera_set_view_pos(view_camera[0], _camX, _camY);	
}


