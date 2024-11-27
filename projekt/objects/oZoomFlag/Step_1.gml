if ((place_meeting(x, y, oPlayer) || condition)) {
	
	oCamera.changing = false; 
		
	goToPlaceTimer = goToPlaceBuffer;
		
	//oCamera.midX = oCamera._camX + oCamera._camWidth / 2;
	//oCamera.midY = oCamera._camY + oCamera._camHeight / 2;
			
	
	
}

if (oPlayer.x > x && increase_dir == 1) || (oPlayer.x < x && increase_dir == -1) {
	zoom(k, orginalW, orginalH);	
	oCamera.changing = false;
} else if ((oPlayer.x < x && increase_dir == 1) || (oPlayer.x > x && increase_dir == -1)) {
	zoom(1, orginalW, orginalH);
	oCamera.changing = true; 
}

if (place_meeting(x, y, oPlayer)) {
	oCamera.changing = false;
	current_k = 1 + speed_x * (oPlayer.x - x);
	if (current_k > k) {
		current_k = k;	
	} else if (current_k < 1) {
		current_k = 1;	
	}
	zoom(current_k, orginalW, orginalH);
	instantCameraMoveToPos(x + step_x * (current_k - 1), y + step_y * (current_k - 1));
}