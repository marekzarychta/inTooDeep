draw_set_font(Fnt_textbox_player);
x = obj_player.x;
y = obj_player.y-34;
// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels
// Rysuj tekst, dynamicznie wyśrodkowując go
draw_text(x, y, textVal);


draw_set_font(Fnt_small);