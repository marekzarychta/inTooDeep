draw_set_font(Fnt_UI);
draw_set_color(c_white);
draw_set_halign(fa_center);

draw_text(x, y, string("Score: ") + string(oGlobal.gold));
