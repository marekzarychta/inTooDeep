openable = false;
marked = false;

//Sprites

closedSprite = sDepositEmpty;
markSprite = sDepositEmptyMarked;
fullSprite = sDepositFull;
markSpriteFull = sDepositFullMarked;

bagWeight = 0;

items = global.lista;

global.openedDep = false;

y_offset = 16; //umieszczenie siatki od gory
x_offset = 32; //umieszczenie siatki od lewego boku
inventory_w = INVENTORY_GRID_X * 16 + x_offset * 4;//16 * 28;
inventory_h = INVENTORY_GRID_Y * 16 + y_offset * 2;//16 * 12;

startX = oInventory.startX - inventory_w - 16;
startY = oInventory.startY;

dragging_item = noone;  
dragging_index = -1;

current_slot = 0;
but1Dep = noone;


