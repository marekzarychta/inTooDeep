clicked = false;
clickable = true;

event_inherited();

textBoxInstance = noone;

closedSprite = sDoorButton;
markSprite = sDoorButtonMarked;
openingSprite = sDoorButtonPushed;
offSprite = sDoorButtonOff;

clicking = false;

//if (instance_exists(instance_find(oDoor, targetInstance))) {
//	target = instance_find(oDoor, targetInstance);
//	doorX = target.x;
//	doorY = target.y;
//} else {

	target = instance_create_layer(doorX, doorY, id.layer, oDoor);
//}