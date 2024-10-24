function SetWeights() {
	maxInventoryWeight = 14;
	weightChangeValue = [3, 6, 10, maxInventoryWeight];
	weightLevels = [0, 1, 2, 3];
}

function ChangeWeight() {
	if(inventoryWeight <= weightChangeValue[0]) {
		currentWeightLevel = weightLevels[0];
	} else if (inventoryWeight <= weightChangeValue[1]) {
		currentWeightLevel = weightLevels[1];
	} else if (inventoryWeight <= weightChangeValue[2]) {
		currentWeightLevel = weightLevels[2];
	} else {
		currentWeightLevel = weightLevels[3];
	}
}

function DrawWeightBar() {
	SetWeights();
	
	draw_sprite_stretched(sRect, 0, x-1, y - 16, 16 * MAX_WEIGHT / 2+8, 33)
	draw_sprite_stretched(sWeightBar, 0, x,y, 16 * MAX_WEIGHT / 2+6, 16);

	var currentWeight = oPlayer.inventoryWeight;
	
	for (var i = 0; i < currentWeight; i++){
		var xx = x + (i mod MAX_WEIGHT) * 8 + 3;
		draw_sprite_stretched(sWeightPoint,0,xx,y+3,8,10);
	}	
	draw_set_font(Fnt_super_small);
	draw_set_color(c_black);
	draw_text(x + 32, y - 14, "Weight");
	draw_line_width_color(x + weightChangeValue[0] * 8 + 2, y + 2, x + weightChangeValue[0] * 8 + 2, y + 12, 2, c_black, c_black);
	draw_line_width_color(x + weightChangeValue[1] * 8 + 2, y + 2, x + weightChangeValue[1] * 8 + 2, y + 12, 2, c_black, c_black);
	draw_line_width_color(x + weightChangeValue[2] * 8 + 2, y + 2, x + weightChangeValue[2] * 8 + 2, y + 12, 2, c_black, c_black);
	
}