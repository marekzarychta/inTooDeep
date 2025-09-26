if (openable && marked) {
	var offset_y = 120;
	var size = 55;
	draw_sprite_stretched_ext(sWeightPoint_full, 0, drawX + ( - 1.5) * size, drawY - offset_y, size, 25, c_white, 1);
	//tworzymy ramke oraz bloczki wagowe
	for (var i = -2; i < ds_list_size(content)-2; i++) {
		draw_sprite_stretched(sWeightPoint, 0, drawX + (i + 1.5) * size, drawY - offset_y, size, 25);	
	}
	for (var i = -2; i < 1; i++) {
		draw_sprite_stretched_ext(sSelectedBox, 0, drawX + 1 + (i + 0.5) * size, drawY - offset_y, size, 25, c_grey, 1);	
		draw_sprite_stretched_ext(sSelectedBox, 0, drawX - 1 + (i + 0.5) * size, drawY - offset_y, size, 25, c_grey, 1);	
	}
	

}