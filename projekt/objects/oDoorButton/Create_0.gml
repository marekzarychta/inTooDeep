clicked = false;
clickable = true;

event_inherited();

closedSprite = sDoorButton;
markSprite = sDoorButtonMarked;
openingSprite = sDoorButtonPushed;
offSprite = sDoorButtonOff;

clicking = false;
target = instance_create_layer(doorX, doorY, id.layer, oDoor);