if (!wasPlayed) {
	
	if (place_meeting(x, y, oPlayer) && goToPlaceTimer == 0 && backToPlayerTimer == 0) {
		oPlayer.isActive = false;
		oCamera.changing = false; 
		cutSceneInstance = instance_create_layer(x, y, layer, oTransitionCutScene);
		goToPlaceTimer = goToPlaceBuffer;
		//if (oCamera.midX != oCamera._camX || oCamera.midY != oCamera._camY) {
		oCamera.midX = oCamera._camX + oCamera._camWidth / 2;
		oCamera.midY = oCamera._camY + oCamera._camHeight / 2;
		//}
	}
	if (goToPlaceTimer > 0) {
		goToPlaceTimer--;	
		slowCameraMoveToPos(wspX, wspY, velGo);
		if (goToPlaceTimer == 0) {
			backToPlayerTimer = backToPlayerBuffer;	
			velBack = getVel(oPlayer.x, oPlayer.y, backToPlayerBuffer, 0);
			cutSceneInstance.fade_out = true;
		}
	}
	if (backToPlayerTimer > 0) {
		backToPlayerTimer--;	
		
		slowCameraMoveToPos(oPlayer.x, oPlayer.y, velBack);
		if (backToPlayerTimer == 0) {
			wasPlayed = true;
			oCamera.changing = true;
			oPlayer.isActive = true;
			
		}
	} 
			
	
	
}