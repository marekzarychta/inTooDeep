wasPlayed = false;

goToPlaceBuffer = 200;
backToPlayerBuffer = 80;
goToPlaceTimer = 0;
backToPlayerTimer = 0;
stayTime = 60;

condition = false;

cutSceneInstance = noone;

velGo = 0;
velBack = 0;

if (oCamera.shaking) {
	oCamera.changing = true;	
	oCamera.shaking = false;
	
    with (oShake) {
        instance_destroy();
    }
}
