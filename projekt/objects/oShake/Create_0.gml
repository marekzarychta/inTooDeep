//startX = oCamera.midX;
//startY = oCamera.midY;

//oCamera.changing = false;
//oCamera.shaking = true;

//_vertically = true;
//vel = 1;
//range = 6;
//counter = 0;
//maxCounter = 4;



shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;
shaking = true;
edge = false

if (oCamera._camX == oCamera.leftEdge) {
	oCamera.midX = (oCamera._camWidth) / 2 + 2 * shake_magnitude;	
	edge = true;
}

if (oCamera._camY == oCamera.leftEdge) {
	oCamera.midY = (oCamera._camHeight) / 2  + 2 * shake_magnitude;	
	edge = true;
}

if (oCamera._camX == oCamera.rightEdgeX) {
	oCamera.midX = oCamera.rightEdgeX - (oCamera._camWidth) / 2 + 2 * shake_magnitude;	
	edge = true;
}

if (oCamera._camY == oCamera.rightEdgeY) {
	oCamera.midY = oCamera.rightEdgeY - (oCamera._camHeight) / 2 + 2 * shake_magnitude;	
	edge = true;
}