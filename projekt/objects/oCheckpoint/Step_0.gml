if(isActivating) {
	if(!isLit){
		light = instance_create_layer(x,y-sprite_height/2+2,"Light", oLight);
		light.scale_x = 0;
		light.scale_y = 0;
		light.sigma = 0.2;
		light.color = make_color_rgb(122,187,226);
		isLit = true;
	}
	
	
	if(image_index >= image_number - 1) {
		sprite_index = sCheckpoint;
		image_index = 1;
		//image_speed = 0;
		isActivating = false;
	}
	
	if (isLit) {
		if (light.scale_x < 1) {
			light.scale_x += 0.02;
		}
		if (light.scale_y < 1) {
			light.scale_y += 0.02;
		}
	}
	
} else {
	if (!firstColision) {
		sprite_index = sCheckpointActivate;
		image_index = 0;	
		image_speed = 0;
	} else {

		
		image_index = 1;
		if (time > 0) {
			time--;			
		}
		if (time == 0) {
			image_index = 2;
		}
		textTimer --;
		
		if (isLit) {
			if (light.scale_x < 1) {
				light.scale_x += 0.05;
			}
			if (light.scale_y < 1) {
				light.scale_y += 0.05;
			}
		}
	}
}