draw_set_font(Fnt_textbox_player);

// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels
draw_text(x + 16, y, textVal);

draw_set_font(Fnt_small);