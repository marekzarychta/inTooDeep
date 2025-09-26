// Aktualizacja pozycji plecaka względem gracza
if (instance_exists(backpack)) {
    backpack.image_xscale = image_xscale;

    // Wyliczenie bazowej pozycji plecaka (bieżąca pozycja gracza)
    var base_x = x;
    var base_y = y;

	if(yspd<0){
		base_y+=1;
	}else if(yspd>0){
		base_y-=1;
	}
	else if (yspd == 0){
		base_y = y;
	}

    // Dostosowanie pozycji podczas animacji ataku
    if (sprite_index == sPlayerAttack) {
        if (image_index >= 0 and image_index < 1) {
            // Klatka 1
        } else if (image_index >= 2 and image_index < 3) {
            // Klatka 2
            base_x += 3 * image_xscale;
            base_y += 1;
        } else if (image_index >= 3 and image_index <= 4) {
            // Klatki 3-4
            base_x += 3 * image_xscale;
            base_y += 1;
        }
    }

    // Ustawienie pozycji plecaka względem wyliczonej pozycji bazowej
    backpack.x = base_x;
    backpack.y = base_y;

    // Zarządzanie warstwami i sprite'ami plecaka
    if (!isLadder) {
        backpack.layer = layer_get_id("Player_below");
			backpack.sprite_index = backpackSprites[currentWeightLevel];
						if(inventoryWeight == maxInventoryWeight){
				backpack.sprite_index = backpackSprites[4];
			}
    } else {
        backpack.layer = layer_get_id("Player_overlay");
			backpack.sprite_index = backpackSpritesClimb[currentWeightLevel];
			if(inventoryWeight == maxInventoryWeight){
				backpack.sprite_index = backpackSpritesClimb[4];
			}
    }
}
