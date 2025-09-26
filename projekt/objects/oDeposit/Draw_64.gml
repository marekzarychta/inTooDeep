if (openable && marked && !animating) {
	var offset_y = 180;
	var size = 55;
	
	//tworzymy ramke oraz bloczki wagowe
	for (var i = -2; i < ds_list_size(global.lista)-2; i++) {
		draw_sprite_stretched(sWeightPoint, 0, drawX + i * size, drawY - offset_y, size, 25);	
	}
	for (var i = -2; i < 2; i++) {
		draw_sprite_stretched_ext(sSelectedBox, 0, drawX + 1 + i * size, drawY - offset_y, size, 25, c_grey, 1);	
		draw_sprite_stretched_ext(sSelectedBox, 0, drawX - 1 + i * size, drawY - offset_y, size, 25, c_grey, 1);	
	}
	

}