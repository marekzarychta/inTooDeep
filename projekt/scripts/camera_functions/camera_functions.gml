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

function activateCutScene(_x, _y) {
	var obj = instance_create_layer(x, y, layer, oMoveToFlag);
	obj.condition = true;
	obj.wspX = _x;
	obj.wspY = _y;
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

function zoom(k, orginalW, orginalH) {
	var view_id = 0;



    // Nowe wymiary kamery po zoomie
    var new_view_w = orginalW * k;
    var new_view_h = orginalH * k;

    
    
	oCamera._camWidth = new_view_w;
	oCamera._camHeight = new_view_h;


	oCamera.rightEdgeX = room_width - oCamera._camWidth;
	oCamera.rightEdgeY = room_height - oCamera._camHeight;
	
	var _camX = oCamera.midX - oCamera._camWidth / 2;
	var _camY = oCamera.midY - oCamera._camHeight / 2;
	
	
	_camX = clamp(_camX, oCamera.leftEdge, oCamera.rightEdgeX);
	_camY = clamp(_camY, oCamera.leftEdge, oCamera.rightEdgeY);
	
	// Ustaw nowe wymiary kamery
	camera_set_view_pos(view_camera[0], _camX, _camY);
	camera_set_view_size(view_camera[view_id], new_view_w, new_view_h);
}
