// Draw the sprite icon, stretched to 16x16
textVal1 = "to move";
textVal2 = "to jump";

// Set text color
draw_set_color(c_white);
draw_set_font(Fnt_super_small);

// Draw the text, centered vertically with the icon and offset by 3 pixels

if(!gamepad_is_connected(0)){
draw_sprite_stretched(sKeyArrowLeft, 0, x-17, y-4, 16, 16);  // Centered at (x, y)
draw_sprite_stretched(sKeyArrowRight, 0, x, y - 4 , 16, 16);  // Centered at (x, y)
draw_sprite_stretched(sKeyZ, 0, x, y - 6 +string_height(textVal2)/2 + 20, 16, 16);  // Centered at (x, y)
}else{
draw_sprite_stretched(sStick, 0, x, y, 16, 16);
draw_sprite_stretched(sButtonA, 0, x, y - 6 +string_height(textVal2)/2 + 20, 16, 16);  // Centered at (x, y)
}

draw_text(x+42 , y-4+string_height(textVal1)/2, textVal1);
draw_text(x+42 , y-4+string_height(textVal2)/2 + 20, textVal2);
