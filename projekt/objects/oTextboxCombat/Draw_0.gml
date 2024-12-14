// Draw the sprite icon, stretched to 16x16
textVal = "to attack";
draw_set_font(Fnt_super_small);

// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels

//draw_sprite_stretched(sKeyArrowLeft, 0, x-16, y-4, 16, 16);  // Centered at (x, y)
draw_sprite_stretched(sKeyX, 0, x, y-4, 16, 16);  // Centered at (x, y)

draw_text(x + 48 , y-4+string_height(textVal)/2, textVal);
