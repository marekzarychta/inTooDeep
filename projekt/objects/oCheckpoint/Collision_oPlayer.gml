if (!firstColision) {
	firstColision = true;
	oPlayer.lastCheckpoint = id;
	state = save();
	//image_index = 1;
	_health = oPlayer.current_health;
	
	sprite_index = sCheckpointActivate;
	image_index = 0;
	image_speed = 1;
	isActivating = true;
}