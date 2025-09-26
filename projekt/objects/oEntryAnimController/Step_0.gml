if (x < 96) {
	x += 3;
	blockControls(true);
	if (instance_exists(oPlayer)) {
		oPlayer.isActive = false;	
	}
} else {
	sprite_index = sPlayerIdle;
	blockControls(true);
	
	if (index = 0) {
		if (standing_timer < standing_buffer1) {
			standing_timer++;	
		} else {
			image_xscale = -1;
			standing_timer = 0;
			index++;
		}
		
	} else if (index = 1) {
		if (standing_timer < standing_buffer2) {
			standing_timer++;	
		} else {
			standing_timer = 0;
			index++;
			image_xscale = 1;
			image_index = 0;
			cutscene.fade_out = true;
		}
	} else {
		if (standing_timer < 6) {
			standing_timer++;
		} else {
			layer_set_visible(layer_get_id("Player"), true);
			layer_set_visible(layer_get_id("Player_overlay"), true);
			layer_set_visible(layer_get_id("Player_below"), true);
			blockControls(false);
			instance_destroy();
			if (instance_exists(oPlayer)) {
				oPlayer.isActive = true;	
			}
		}
	}
}
	
	
