global.lista = ds_list_create();
gold = 0;

inventory = instance_create_layer(x, y, layer, oInventory);
inventory.persistent = true;
interface = noone;

camera = noone;