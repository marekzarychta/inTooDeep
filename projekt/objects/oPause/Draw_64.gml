if (pause) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);
	draw_set_alpha(1);
	//draw_set_color(c_white);
	//draw_rectangle(720, 320, 1200, 680, 0);
	//draw_set_color(c_white);
	//draw_set_font(Fnt_UI_big);
	//draw_text(960, 500, "PAUSED");
	
	//draw_self();
	
	var w = display_get_gui_width();
	var h = display_get_gui_height();
	
	var multply = window_get_width() / sprite_width;
	draw_sprite_stretched(sPauseUI, index, 0, y, w, h);
	
	//draw_set_color(c_white);
	//draw_set_font(Fnt_UI);
	//draw_text(960, 600, "R - RESTART");
	
	//draw_set_color(c_white);
	//draw_set_font(Fnt_UI);
	//draw_text(960, 700, "Q - MENU");
}