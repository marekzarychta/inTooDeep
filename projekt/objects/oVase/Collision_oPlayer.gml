if(other.isDashing){
if(!wasHit){
	playSound();
	flashAlpha = 0.6;
	wasHit = true;
	if (instance_exists(oGlobal)) {
		var task = ds_list_find_value(global.task_list, 0);
		//if (oGlobal.activeTask != noone && instance_exists(oGlobal.activeTask) && oGlobal.activeTask.numer == 0 && 
		task.counter++;
	}
}
}