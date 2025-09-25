draw_self();

if (wrong_weight_anim) {
	if (sprite_index == sBreakableWall_Orange) {
		draw_sprite_ext(sRocks_Orange, time % 6, x + (floor(num / (image_yscale)) + 0.5) * sprite_width / image_xscale, y - (num % (image_yscale ) + 0.5) * sprite_height / image_yscale, scale, scale, 0, c_white, 1);
	} else {
		draw_sprite_ext(sRocks_Orange2, time % 6, x + (floor(num / (image_yscale)) + 0.5) * sprite_width / image_xscale, y - (num % (image_yscale ) + 0.5) * sprite_height / image_yscale, scale, scale, 0, c_white, 1);
	
	}
}