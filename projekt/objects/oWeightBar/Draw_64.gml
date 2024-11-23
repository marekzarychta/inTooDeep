 /// @description Insert description here
// You can write your code in this editor

    SetWeights();
	draw_sprite_stretched(sWeight,0,x,y, sprite_get_width(sWeight)/2, sprite_get_height(sWeight)/2);
    draw_sprite_stretched(sWeightBar, 0, x + sprite_get_width(sHeart)/2, y,sprite_get_width(sWeightBar)*0.75,sprite_get_height(sWeightBar)/2);

    var currentWeight = oPlayer.inventoryWeight;

    var stretchLenght = 8 * MAX_WEIGHT_WIDTH / MAX_WEIGHT;

    for (var i = 0; i < currentWeight; i++) {
        var xx = x + (i mod MAX_WEIGHT) * stretchLenght + 3;
        if (oPlayer.currentWeightLevel == 2) draw_sprite_stretched(sWeightPoint1, 0, xx, y + 3, stretchLenght, 10);
        else if (oPlayer.currentWeightLevel == 3) draw_sprite_stretched(sWeightPoint2, 0, xx, y + 3, stretchLenght, 10);
        else draw_sprite_stretched(sWeightPoint, 0, xx, y + 3, stretchLenght, 10);
    }
    //draw_line_width_color(x + weightChangeValue[0] * stretchLenght + 2, y + 2, x + weightChangeValue[0] * stretchLenght + 2, y + 12, 2, c_black, c_black);
    //draw_line_width_color(x + weightChangeValue[1] * stretchLenght + 2, y + 2, x + weightChangeValue[1] * stretchLenght + 2, y + 12, 2, c_black, c_black);
    //draw_line_width_color(x + weightChangeValue[2] * stretchLenght + 2, y + 2, x + weightChangeValue[2] * stretchLenght + 2, y + 12, 2, c_black, c_black);
