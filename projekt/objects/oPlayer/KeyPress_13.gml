if !isAlive || debug_mode {
	
	if (instance_exists(lastCheckpoint)) {
	
		if (instance_exists(oShake)) {
			instance_destroy(oShake);	
		}
	
		isAlive = true;
		current_health = max_health;
	
		x = lastCheckpoint.x;
		y = lastCheckpoint.y;
		if (!instance_exists(backpack))
			backpack = instance_create_layer(x,y,"Player_below",oBackpack);
		
		instantCameraMoveToPos(oPlayer.x, oPlayer.y);

		instantCameraMoveToPos(oPlayer.x, oPlayer.y);

		if (instance_exists(transition)) {
			transition.fade_in = true;	
		} else {
			transition = instance_create_layer(x, y, layer, oTransition);
			transition.nextRoom = false;	
			transition.fade_in = true;
		}
	
		load(lastCheckpoint.state);		
	} else {
		room_goto(room);	
	}
}