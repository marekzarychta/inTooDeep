if (play) {
	image_speed = 0.5;
	if (image_index >= image_number - 1) {
		play = false;
		image_speed = 0;
		image_index = image_number - 1;
	}
}