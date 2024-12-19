if (fade_out) {
    alpha += speed;
    if (alpha >= 1) {
        alpha = 1;
        // Po zakończeniu przejścia załaduj kolejny poziom
		if (nextRoom) {
		    if (room == Menu || room == initRoom) {
				if (instance_exists(oGlobal)) {
					oGlobal.roomCounter++;	
				}
				room_goto_next();
			} else {
				
				room_goto(przejscie);
			}
			
		}
        fade_out = false;
    }
} else if (fade_in) {
    alpha -= speed;
    if (alpha <= 0) {
        alpha = 0;
        instance_destroy(); // Usuń obiekt po zakończeniu przejścia
    }
}
