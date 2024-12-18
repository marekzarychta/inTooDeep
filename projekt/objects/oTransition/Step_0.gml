if (fade_out) {
    alpha += speed;
    if (alpha >= 1) {
        alpha = 1;
        // Po zakończeniu przejścia załaduj kolejny poziom
		if (nextRoom) {
		    if (room_get_name(room) != "demo3") room_goto_next(); // lub room_goto(room_name)
			else {
				instance_destroy(oGlobal);
				if (debug_mode) show_debug_message("tak");
				room_goto(0);
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
