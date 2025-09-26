

	
	if (isDashing) {
		for (var i = 0; i < ds_list_size(dashEffect); i++) {
			var effect = ds_list_find_value(dashEffect, i);
			draw_sprite_ext(sprite_index, effect[0], effect[1], effect[2], moveDir, 1, 0, c_grey, 0.1 + (i/(num_after_effect * 2)));
		}
	}
	
	if (instance_exists(oCamera) && !oCamera.screen_mode) {
		draw_self();
	}
	
		//Flash effect
	if(flashAlpha > 0){
		shader_set(shFlash);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
		shader_reset();
		flashAlpha -=0.05;
	}