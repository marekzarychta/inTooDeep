//draw_sprite_stretched(sprite_index, 0, x, y, w, h);

draw_set_font(Fnt_UI_big);
draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text((x + w / 2 - 1) * aspect, (y + h / 2)*aspect, o_name);