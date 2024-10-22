/// @description Inventory size etc
// You can write your code in this editor

#macro INVENTORY_SLOTS  15
#macro INVENTORY_GRID_X 20 
#macro INVENTORY_GRID_Y  9 

//inventory = array_create(INVENTORY_SLOTS,-1);
inventory = ds_list_create();
//but1 = instance_create_depth(0, 0, 20, oTestButton);

//ds_list_add(inventory, instance_create_depth(0, 0, 20, oTestCoin));

opened = false;

dragging_item = noone;  
dragging_index = -1;

y_offset = 16; //umieszczenie siatki od gory
x_offset = 32; //umieszczenie siatki od lewego boku
inventory_x = room_width / 3;
inventory_y = room_height / 3;
inventory_w = 16 * 28;
inventory_h = 16 * 12;


current_slot = 0;