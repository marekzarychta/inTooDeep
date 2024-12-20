if (!firstColision) {
	image_index = 0;	
} else {
	image_index = 1;
	if (time > 0) {
		time--;			
	}
	if (time == 0) {
		image_index = 2;
	}
	textTimer --;
}