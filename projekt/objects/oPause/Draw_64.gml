if (pause) {
	//draw_set_color(c_grey);
	//draw_rectangle(700, 300, 1220, 700, 0);
	//draw_set_color(c_white);
	//draw_rectangle(720, 320, 1200, 680, 0);
	draw_set_color(c_white);
	draw_set_font(Fnt_UI_big);
	draw_text(960, 500, "PAUSED");
	
	draw_set_color(c_white);
	draw_set_font(Fnt_UI);
	draw_text(960, 600, "R - RESTART");
	
	draw_set_color(c_white);
	draw_set_font(Fnt_UI);
	draw_text(960, 700, "Q - MENU");
}