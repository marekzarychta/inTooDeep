draw_set_color(c_white);
draw_set_font(Fnt_super_small);
if(gamepad_is_connected(0)){
	ram_key = sButtonB;
	draw_sprite_stretched(ram_key, 0, x-8, y, 16, 16);  // Centered at (x, y)
}else{
	ram_key = sKeyShift;
	draw_sprite_stretched(ram_key, 0, x-16, y, 32, 16);  // Centered at (x, y)
}
// Draw the sprite icon, stretched to 16x16
textVal = "to ram through walls\nand enemies\nwhile moving";

// Set text color

// Draw the text, centered vertically with the icon and offset by 3 pixels
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


draw_text(x , y+string_height(textVal)/2, textVal);
