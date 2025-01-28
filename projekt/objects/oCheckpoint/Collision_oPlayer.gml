if (!firstColision) {
	firstColision = true;
	oPlayer.lastCheckpoint = id;
	state = save();
	image_index = 1;
	_health = oPlayer.current_health;
}