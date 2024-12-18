if (oCamera.shaking) {
	oCamera.changing = true;	
	var my_id = id;
    with (oShake) {
        if (id != my_id) {
            instance_destroy();
        }
    }
}

oCamera.shaking = true;


shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;