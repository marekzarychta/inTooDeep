// Draw the sprite icon, stretched to 16x16
textVal1 = "to move";
textVal2 = "to jump";

// Set text color
draw_set_color(c_white);
draw_set_font(Fnt_super_small);

// Draw the text, centered vertically with the icon and offset by 3 pixels

draw_sprite_stretched(sKeyA, 0, x-16, y-4, 16, 16);  // Centered at (x, y)
draw_sprite_stretched(sKeyD, 0, x+2, y-4, 16, 16);  // Centered at (x, y)
draw_sprite_stretched(sKeySpace, 0, x-14, y+14, 32, 16);  // Centered at (x, y)

draw_text(x+42 , y-4+string_height(textVal1)/2, textVal1);
draw_text(x+42 , y-4+string_height(textVal2)/2 + 20, textVal2);
