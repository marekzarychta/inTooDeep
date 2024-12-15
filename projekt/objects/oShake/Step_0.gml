if (_vertically) {
	
	if (counter % 2 == 0) {
		y += vel;
	} else {
		y -= vel;	
	}
	
	if (y >= startY + range || y <= startY - range) {
		counter++;	
	}
} else {
	if (counter % 2 == 0) {
		x += vel;
	} else {
		x -= vel;	
	}
	

	
	if (x >= startX + range || x <= startX - range) {
		counter++;	
	}	
}

oCamera.midY = y;
oCamera.midX = x;

if (counter >= maxCounter) {
	oCamera.changing = true;
	instance_destroy();	
}

if (_vertically) {
	startX = oPlayer.x;
} else {
	startY = oPlayer.y;
}