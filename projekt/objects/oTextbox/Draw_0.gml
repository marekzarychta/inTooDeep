// Draw the sprite icon, stretched to 16x16
draw_sprite_stretched(sKeyC, 0, x-16, y-4, 16, 16);  // Centered at (x, y)
draw_set_font(Fnt_super_small);
// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels
draw_text(x + 16 , y-4+string_height(textVal)/2, textVal);
