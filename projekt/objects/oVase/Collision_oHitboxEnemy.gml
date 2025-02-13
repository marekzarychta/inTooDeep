if(!wasHit){
	playSound();
	flashAlpha = 0.6;
	wasHit = true;
	
	var coin = instance_create_layer(x, y - 5,  layer_get_id("Player_below"), oCoin);
	coin.image_xscale = 0.4;
	coin.image_yscale = 0.4;
		
	if (instance_exists(oGlobal)) {
		var task = ds_list_find_value(global.task_list, 0);
		//if (oGlobal.activeTask != noone && instance_exists(oGlobal.activeTask) && oGlobal.activeTask.numer == 0 && 
		task.counter++;
	}
}