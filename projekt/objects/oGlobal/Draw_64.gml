draw_set_font(Fnt_UI);
draw_set_color(c_white);
draw_set_halign(fa_left);
if (room != przejscie) {
	draw_text(20, 300, string("Score: ") + string(gold));
}
draw_set_halign(fa_center);

