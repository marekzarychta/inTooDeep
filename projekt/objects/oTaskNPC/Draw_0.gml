draw_self();

if (done && !_finished) {
	
	iterator++;
	
	var offset = 2 * sin(iterator / 10);
	
	draw_sprite(sExclamationMarkMini, 0, x, y - sprite_height - 2 - offset);
}