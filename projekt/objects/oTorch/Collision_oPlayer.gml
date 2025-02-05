if(other.isDashing){
	if(isLit){
		isLit = false;
		playSound();
		if (instance_exists(oGlobal) && counts) {
			var task = ds_list_find_value(global.task_list, 3);
			//if (oGlobal.activeTask != noone && instance_exists(oGlobal.activeTask) && oGlobal.activeTask.numer == 0 && 
			task.counter++;
		}
	}
}