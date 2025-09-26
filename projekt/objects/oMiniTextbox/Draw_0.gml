draw_set_alpha(alpha);

draw_set_font(Fnt_textbox_player);
x = obj_player.x+14;
y = obj_player.y-24;
// Set text color
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the text, centered vertically with the icon and offset by 3 pixels
// Rysuj tekst, dynamicznie wyśrodkowując go
draw_text(x, y-2, textVal);
draw_sprite_stretched(icon,0, x+textWidth, y, 7, 7);

draw_set_alpha(1);

draw_set_font(Fnt_small);