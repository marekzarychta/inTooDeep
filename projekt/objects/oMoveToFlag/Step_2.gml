if (!wasPlayed) {
	
	if (place_meeting(x, y, oPlayer) && goToPlaceTimer == 0 && backToPlayerTimer == 0) {
		oPlayer.isActive = false;
		oCamera.changing = false; 
		cutSceneInstance = instance_create_layer(x, y, layer, oTransitionCutScene);
		goToPlaceTimer = goToPlaceBuffer;
		
		oCamera.midX = oCamera._camX + oCamera._camWidth / 2;
		oCamera.midY = oCamera._camY + oCamera._camHeight / 2;
		
	}
	var middleScreen = oPlayer.x;
	if (goToPlaceTimer > 0) {
		goToPlaceTimer--;	
		slowCameraMoveToPos(wspX, wspY, velGo);
		if (goToPlaceTimer == 0) {
			backToPlayerTimer = backToPlayerBuffer;	
			if (oPlayer.x < oCamera._camWidth / 2) {
				middleScreen = oCamera._camWidth / 2;
			} else if (oPlayer.x > room_width - oCamera._camWidth / 2) {
				middleScreen = room_width - oCamera._camWidth / 2;
			}
			
			velBack = getVel(middleScreen, oPlayer.y, backToPlayerBuffer, 0);
			cutSceneInstance.fade_out = true;
		}
	}
	if (backToPlayerTimer > 0) {
		backToPlayerTimer--;	
		if (oPlayer.x < oCamera._camWidth / 2) {
			middleScreen = oCamera._camWidth / 2;
		} else if (oPlayer.x > room_width - oCamera._camWidth / 2) {
			middleScreen = room_width - oCamera._camWidth / 2;
		}
		slowCameraMoveToPos(middleScreen, oPlayer.y, velBack);
		if (backToPlayerTimer == 0) {
			wasPlayed = true;
			oCamera.changing = true;
			oPlayer.isActive = true;
			oCamera.midX = oPlayer.x;
			oCamera.midY = oPlayer.y;
		}
	} 
			
	
	
}