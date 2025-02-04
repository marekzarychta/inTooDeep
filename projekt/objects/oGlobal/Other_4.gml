if (instance_exists(interface)) {
	instance_destroy(interface);	
}

if (instance_exists(camera)) {
	instance_destroy(camera);	
}
if (instance_exists(pause)) {
	instance_destroy(pause);	
}

if (room != przejscie) {

	if (!layer_exists("GUI")) {
		layer_create(-20, "GUI");	
	}

	if(room==demo or room == demo2 or room == demo3 and !audio_is_playing(snd_ambient)){
		audio_play_sound(snd_ambient,0,true);
		
	}

	if (layer_exists("Player")) {
		if (!layer_exists("Player_below")) {
			layer_create(layer_get_depth("Player") + 20, "Player_below");	
		}

		if (!layer_exists("Player_overlay")) {
			layer_create(layer_get_depth("Player") - 20, "Player_overlay");	
		}
	}

	if (!layer_exists("Text")) {
		layer_create(-40, "Text");	
	}

	if (!layer_exists("Popups")) {
		layer_create(-50, "Popups");	
	}

	ds_list_clear(inventory.inventory);
	ds_list_clear(global.lista)
	ds_list_clear(global.task_list);
	
	gold = global.gold;
	
	var task0 = instance_create_layer(x, y, layer, oTask);
	task0.persistent = true;
	task0.numer = 0;
	task0._value = 5;
	task0.desc = "Destroy "+string(task0._value)+" vases";
	task0.words = "I really like \nto watch destruction\nof the vases!";
	task0.counter = 0;
	task0.prevCounter = 0;
	ds_list_add(global.task_list, task0);


	var task1 = instance_create_layer(x, y, layer, oTask);
	task1.persistent = true;
	task1.numer = 1;
	task1._value = 3;
	task1.desc = "Kill "+string(task1._value)+" skeletons";
	task1.words = "I hate skeletons\nnoises!";
	task1.counter = 0;
	task1.prevCounter = 0;
	ds_list_add(global.task_list, task1);

	var task2 = instance_create_layer(x, y, layer, oTask);
	task2.persistent = true;
	task2.numer = 2;
	task2._value = 5;
	task2.desc = "Fall on "+string(task2._value)+" skeletons";
	task2.words = "I love look at\nseparated bones!"; //18
	task2.counter = 0;
	task2.prevCounter = 0;
	ds_list_add(global.task_list, task2);

	
	//gold = prevGold;
	
	
	if (layer_exists("Player_below"))
		part_system_depth(global.particleSystem, layer_get_depth("Player_below") + 105);



	interface = instance_create_layer(x, y, layer, oInterface);
	camera = instance_create_layer(x, y, layer, oCamera);
	pause = instance_create_layer(x, y, layer, oPause);

	var transition = instance_create_layer(x, y, oGlobal.layer, oTransition);
	//camera.persistent = true;
		if(layer_exists("Collision")){
			layer_set_visible("Collision",false);
		}

	instance_create_layer(x,y,layer,oParallax);
}

