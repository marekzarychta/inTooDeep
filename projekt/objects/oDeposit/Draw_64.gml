if (openable && marked && !animating) {
	var offset_y = 120;
	var size = 55;
	
	//tworzymy ramke oraz bloczki wagowe
	for (var i = -2; i < ds_list_size(global.lista)-2; i++) {
		draw_sprite(sWeightBarDeposit, 0, drawX + i * (size + 15) + 10, drawY - offset_y - 5);	
	}
	draw_sprite(sContentBarDeposit, 0, drawX, drawY - offset_y);
	

}