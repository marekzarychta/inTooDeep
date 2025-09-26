
draw_set_font(Fnt_super_small);

// Set text color
draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the text, centered vertically with the icon and offset by 3 pixels
draw_text(x  ,y, textVal);
draw_set_halign(fa_left);
