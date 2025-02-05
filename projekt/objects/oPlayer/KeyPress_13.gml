if (!isAlive || debug_mode || (instance_exists(oPause) && oPause.checkpoint) && !oGlobal.gui)  {
	
	if (instance_exists(lastCheckpoint)) {
	
		if (instance_exists(oShake)) {
			instance_destroy(oShake);	
		}
	
		isAlive = true;
		current_health = lastCheckpoint._health;
	
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
		
		if (instance_exists(oPause)) {
			oPause.checkpoint = false;
			
		}
	
		load(lastCheckpoint.state);		
	} else {
		room_restart();	
	}
}