if (active || return_anim) {
	
	draw_sprite_ext(sLvl1_icon, 0, 368, y + 328, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sLvl2_icon, 0, 580, y + 588, 1, 1, 0, c_white, 1);
	draw_sprite_ext(sLvl3_icon, 0, 304, y + 868, 1, 1, 0, c_white, 1);
	
	draw_set_font(Fnt_UI_big);
	draw_set_color(c_white);
	draw_set_alpha(alfa);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(1100, 400, text[0]);
	draw_text(1100, 700, text[1]);
	draw_text(1100, 900, text[2]);
	
	draw_set_alpha(1 - alfa);
	draw_sprite_stretched(sLevelSelector_Full, 0, 0, y, window_get_width(), window_get_height());
	
	if (alfa < 1) {
		draw_set_alpha(1);
		draw_sprite_stretched(sLevelSelector, 0, 0, y, window_get_width(), window_get_height());	
	}
	
	draw_set_alpha(alfa);
	draw_sprite_stretched(sLevelSelector, index, 0, y, window_get_width(), window_get_height());	
	
	

}
