function instantCameraMoveToPos(_x, _y) {
	oCamera.midX = _x;
	oCamera.midY = _y;
}

function slowCameraMoveToPos(_x, _y, vel) {
	
	var dx = _x - oCamera.midX;
	var dy = _y - oCamera.midY;
	
	
	
	var len = sqrt(dx * dx + dy * dy);
	
	var dnx = 0;
	var dny = 0;
	
	if (len != 0) {
		 dny = dy / len;
		 dnx = dx / len;
		 show_debug_message(string(dnx) + " " + string(dny))
	}
	if (abs(dx) >= vel) {
		oCamera.midX += dnx * vel;
	}
	if (abs(dy) >= vel) {
		oCamera.midY += dny * vel;

	}
	
}

function getVel(_x, _y, time, stayingTime) {
	if stayingTime >= time {
		return 0;
	} else {
		var dx = _x - oCamera.midX;
		var dy = _y - oCamera.midY;
		var len = sqrt(dx * dx + dy * dy);
		return len / (time - stayingTime); 
	}
	
}