 /// @description Insert description here
// You can write your code in this editor

    SetWeights();
    draw_sprite(sWeightBar, 0, x, y);

    var currentWeight = oPlayer.inventoryWeight;

    var stretchLenght = 8 * MAX_WEIGHT_WIDTH / MAX_WEIGHT;

    for (var i = 0; i < currentWeight; i++) {
        var xx =  x + 72+ 3 + i * stretch + i*3;
        if (oPlayer.currentWeightLevel == 2) draw_sprite_stretched(sWeightPoint1, 0, xx, y + 3, stretchLenght, 10);
        else if (oPlayer.currentWeightLevel == 3) draw_sprite_stretched(sWeightPoint2, 0, xx, y + 3, stretchLenght, 10);
        else draw_sprite_stretched(sWeightPoint, 0, xx, y + 24, stretchLenght, 10);
    }
    //draw_line_width_color(x + weightChangeValue[0] * stretchLenght + 2, y + 2, x + weightChangeValue[0] * stretchLenght + 2, y + 12, 2, c_black, c_black);
    //draw_line_width_color(x + weightChangeValue[1] * stretchLenght + 2, y + 2, x + weightChangeValue[1] * stretchLenght + 2, y + 12, 2, c_black, c_black);
    //draw_line_width_color(x + weightChangeValue[2] * stretchLenght + 2, y + 2, x + weightChangeValue[2] * stretchLenght + 2, y + 12, 2, c_black, c_black);
