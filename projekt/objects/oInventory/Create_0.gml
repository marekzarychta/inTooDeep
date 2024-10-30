/// @description Inventory size etc
// You can write your code in this editor

#macro INVENTORY_SLOTS  15
#macro INVENTORY_GRID_X 10 
#macro INVENTORY_GRID_Y  3 

//inventory = array_create(INVENTORY_SLOTS,-1);
inventory = ds_list_create();
//but1 = instance_create_depth(0, 0, 20, oTestButton);

//ds_list_add(inventory, instance_create_depth(0, 0, 20, oTestCoin));

opened = false;

startX = x;
startY = y;

dragging_item = noone;  
dragging_index = -1;

y_offset = 16; //umieszczenie siatki od gory
x_offset = 32; //umieszczenie siatki od lewego boku
inventory_x = room_width / 3;
inventory_y = room_height / 3;
inventory_w = INVENTORY_GRID_X * 16 + x_offset * 6;//16 * 28;
inventory_h = INVENTORY_GRID_Y * 16 + y_offset * 5;//16 * 12;


current_slot = 0;