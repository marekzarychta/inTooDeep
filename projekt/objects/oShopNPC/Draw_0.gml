draw_self();

if (!gui) {
	iterator++;
	
	var offset = 2 * sin(iterator / 10);
	draw_sprite(sDymek, 0, x , y - sprite_height - 2 - offset);
}

