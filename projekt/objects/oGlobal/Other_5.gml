

if(audio_is_playing(snd_ambient)){
	audio_stop_sound(snd_ambient);
}

if (instance_exists(oPlayer)) {
	current_health = oPlayer.current_health;
}

for (var i = 0; i < ds_list_size(global.task_list); i++) {
	var task = ds_list_find_value(global.task_list, i);
	task.prevCounter = task.counter;
		
}

prevGold = gold;
