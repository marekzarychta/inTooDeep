if(isActivating) {
	if(image_index >= image_number - 1) {
		sprite_index = sCheckpoint;
		image_index = 1;
		//image_speed = 0;
		isActivating = false;
	}
} else {
	if (!firstColision) {
		sprite_index = sCheckpointActivate;
		image_index = 0;	
		image_speed = 0;
	} else {
		if(!isLit){
			light = instance_create_layer(x,y-sprite_height/2+2,"Light", oLight);
			light.color = make_color_rgb(122,187,226);
			isLit = true;
		}
		image_index = 1;
		if (time > 0) {
			time--;			
		}
		if (time == 0) {
			image_index = 2;
		}
		textTimer --;
	}
}