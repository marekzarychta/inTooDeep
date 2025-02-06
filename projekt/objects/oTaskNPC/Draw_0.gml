draw_self();

if (!gui && !_finished) {

	if (done && !_finished) {
	
		iterator++;
	
		var offset = 2 * sin(iterator / 10);
		
		if (room_get_name(room) == "demo3") offset -= 20;
	
		draw_sprite(sScroll, 0, x, y - sprite_height - 2 - offset);
	} else {
		if (sprite_index != sJarSleep) {
			iterator++;
	
			var offset = 2 * sin(iterator / 10);
			
			if (room_get_name(room) == "demo3") offset -= 20;
	
			draw_sprite(sDymek, 0, x, y - sprite_height - 2 - offset);
		}
	}

}