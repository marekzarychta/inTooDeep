if !isAlive {
	
	if (instance_exists(transition)) {
		transition.fade_in = true;	
	} else {
		transition = instance_create_layer(x, y, layer, oTransition);
		transition.nextRoom = false;	
		transition.fade_in = true;
	}
	
	isAlive = true;
	current_health = max_health;
	x = lastCheckpoint.x;
	y = lastCheckpoint.y;
	backpack = instance_create_layer(x,y,"Player_below",oBackpack);
	//timerEnemyHit = 0;
	instantCameraMoveToPos(x, y);
	
}