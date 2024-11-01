openable = false;
marked = false;

//Sprites

closedSprite = sDeposit;
markSprite = sDepositMarked;

bagWeight = 0;

items = global.lista;

opened = false;

dragging_item = noone;  
dragging_index = -1;

y_offset = 16; //umieszczenie siatki od gory
x_offset = 32; //umieszczenie siatki od lewego boku
inventory_x = room_width / 3;
inventory_y = room_height / 3;
inventory_w = INVENTORY_GRID_X * 16 + x_offset * 4;//16 * 28;
inventory_h = INVENTORY_GRID_Y * 16 + y_offset * 2;//16 * 12;

startX = oInventory.startX - inventory_w - 16;
startY = oInventory.startY;


current_slot = 0;


