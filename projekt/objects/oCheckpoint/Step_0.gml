
if (!firstColision) {
	image_index = 0;	
} else {
	if(!isLit){
		light = instance_create_layer(x+sprite_width/2,y+ sprite_height/2,"Light", oLight);
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