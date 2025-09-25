draw_set_color(c_white);
draw_set_font(Fnt_UI_big);
draw_set_halign(fa_center);

var sentence = string_copy(text, 1, index);


draw_text(_x - string_length(sentence) / 2, _y, sentence);