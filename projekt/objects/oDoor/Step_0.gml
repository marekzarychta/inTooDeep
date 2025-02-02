if opened {
	sprite_index = sDoorOpened;	
}

if (opening) {
	sprite_index = sDoorOpening;
	if (image_index >= image_number - 1) {
		opening = false;
		opened = true;
	}
}