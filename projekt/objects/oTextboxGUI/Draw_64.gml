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
draw_sprite_stretched(key_icon, 0, x-68, y+16, 32, 32);  // Centered at (x, y)
draw_set_font(Fnt_popup);
// Set text color
draw_set_color(c_white);

// Draw the text
draw_text(x + 16 , y-8+string_height(textVal)/2, textVal);