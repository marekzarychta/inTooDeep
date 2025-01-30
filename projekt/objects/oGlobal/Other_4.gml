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

