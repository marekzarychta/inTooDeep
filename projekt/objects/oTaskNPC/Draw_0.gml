draw_self();

if (!gui && !_finished) {

	if (done && !_finished) {
	
		iterator++;
	
		var offset = 2 * sin(iterator / 10);
	
		draw_sprite(sScroll, 0, x, y - sprite_height - 2 - offset);
	} else {
		if (sprite_index != sJarSleep) {
			iterator++;
	
			var offset = 2 * sin(iterator / 10);
	
			draw_sprite(sDymek, 0, x + sprite_width / 2, y - sprite_height - 2 - offset);
		}
	}

}