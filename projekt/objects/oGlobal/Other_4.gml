if (!layer_exists("GUI")) {
	layer_create(0, "GUI");	
}

if (!layer_exists("Player_below")) {
	layer_create(0, "Player_below");	
}

if (!layer_exists("Player_overlay")) {
	layer_create(0, "Player_overlay");	
}

if (!layer_exists("Text")) {
	layer_create(0, "Text");	
}

if (!layer_exists("Popups")) {
	layer_create(0, "Popups");	
}


interface = instance_create_layer(x, y, layer, oInterface);
//interface.persistent = true;
ds_list_clear(inventory.inventory);
ds_list_clear(global.lista)
camera = instance_create_layer(x, y, layer, oCamera);

var transition = instance_create_layer(x, y, layer, oTransition);
//camera.persistent = true;