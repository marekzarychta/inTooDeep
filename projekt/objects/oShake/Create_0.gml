if (oCamera.shaking) {
	oCamera.changing = true;	
	
    with (oShake) {
        if (id != self.id) { // Sprawdzamy, czy to nie jest ta sama instancja
            instance_destroy();
        }
    }
}

oCamera.shaking = true;


shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;