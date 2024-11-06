// Draw the sprite icon, stretched to 16x16
textVal = "to ram through walls\nwhile moving";

// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels

draw_sprite_stretched(sKeyShift, 0, x-16, y-4, 32, 16);  // Centered at (x, y)

draw_text(x , y+string_height(textVal), textVal);
