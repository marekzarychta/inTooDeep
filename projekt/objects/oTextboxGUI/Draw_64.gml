
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
draw_set_font(Fnt_popup);

// Rysuj obrys (czarny)
draw_set_color(c_black);
for (var ox = -2; ox <= 2; ox++) {
    for (var oy = -2; oy <= 2; oy++) {
        if (ox != 0 || oy != 0) {
            draw_text(drawX + 16 + ox, drawY - 8 + string_height(textVal)/2 + oy, textVal);
        }
    }
}

// Rysuj właściwy tekst (biały)
draw_set_color(c_white);
draw_text(drawX + 16, drawY - 8 + string_height(textVal)/2, textVal);


draw_sprite_stretched(key_icon, 0, drawX - 68, drawY + 16, 32, 32);
