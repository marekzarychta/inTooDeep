// Draw the sprite icon, stretched to 16x16
if (!gamepad_is_connected(0)){
	if (normal) {
		key_icon = sKeyE;
	} else {
		key_icon = sKeyR; //dla retrive useKey2
	}
}
else{
	if (depo) {
		if (normal) {
			key_icon = sLB;
		} else {
			key_icon = sRB; //dla retrive useKey2
		}
	} else {
	
		key_icon = sButtonY;
	}
}
if (left) {
	draw_sprite_stretched(key_icon, 0, x, y-4, 16, 16);  // Centered at (x, y)
} else {
	draw_sprite_stretched(key_icon, 0, x, y-4, 16, 16);
}
draw_set_font(Fnt_super_small);
// Set text color
draw_set_color(c_white);

// Draw the text, centered vertically with the icon and offset by 3 pixels
if (left) {
	draw_set_halign(fa_left);
	draw_text(x + 20 , y-8+string_height(textVal)/2, textVal);
} else {
	draw_set_halign(fa_right);
	draw_text(x - 4 , y-8+string_height(textVal)/2, textVal);
}