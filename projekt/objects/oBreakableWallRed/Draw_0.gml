draw_self();

if (wrong_weight_anim) {
	if (sprite_index == sBreakableWall_Red) {
		draw_sprite_ext(sRocks_Red, 0, x + (floor(num / (image_yscale)) + 0.5) * sprite_width / image_xscale, y - (num % (image_yscale ) + 0.5) * sprite_height / image_yscale, scale, scale, 0, c_white, 1);
	} else {
		draw_sprite_ext(sRocks_Red2, 0, x + (floor(num / (image_yscale)) + 0.5) * sprite_width / image_xscale, y - (num % (image_yscale ) + 0.5) * sprite_height / image_yscale, scale, scale, 0, c_white, 1);
	
	}
}