draw_self();

if (!gui) {
	iterator++;
	
	var offset = 2 * sin(iterator / 10);
	draw_sprite(sDymek, 0, x + sprite_width / 2 - 15, y - sprite_height - 2 - offset);
}

