if (instance_exists(interface)) {
	instance_destroy(interface);	
}

if (instance_exists(camera)) {
	instance_destroy(camera);	
}
if (instance_exists(pause)) {
	instance_destroy(pause);	
}


	
gold = global.gold;
	
task0.counter = 0;
task0.compleated = false;
task0.prevCompleated = false;
task0.prevCounter = 0;
task1.counter = 0;
task1.prevCompleated = false;
task1.compleated = false;
task1.prevCounter = 0;
task2.counter = 0;
task2.compleated = false;
task2.prevCompleated = false;
task2.prevCounter = 0;
task3.counter = 0;
task3.compleated = false;
task3.prevCompleated = false;
task3.prevCounter = 0;



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
		if (!layer_exists("Light")) {
			layer_create(layer_get_depth("Player") - 40, "Light");	
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
	

	
	//gold = prevGold;
	
	
	if (layer_exists("Player_below"))
		part_system_depth(global.particleSystem, layer_get_depth("Player_below") + 105);



	interface = instance_create_layer(x, y, layer, oInterface);
	camera = instance_create_layer(x, y, layer, oCamera);
	pause = instance_create_layer(x, y, layer, oPause);
	activeTask = noone;
	prevActiveTask = noone;

	var transition = instance_create_layer(x, y, oGlobal.layer, oTransition);
	//camera.persistent = true;
		if(layer_exists("Collision")){
			layer_set_visible("Collision",false);
		}

	instance_create_layer(x,y,layer,oParallax);
}

