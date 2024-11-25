wasPlayed = false;

goToPlaceBuffer = 200;
backToPlayerBuffer = 80;
goToPlaceTimer = 0;
backToPlayerTimer = 0;
stayTime = 60;

condition = false;

cutSceneInstance = noone;

 velGo = floor(getVel(wspX, wspY, goToPlaceBuffer, stayTime));
 velBack = 0;