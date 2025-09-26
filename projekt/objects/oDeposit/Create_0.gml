openable = false;
marked = false;
prevMarked = false;
animating = false;
markedChange = false;

_i = -1;
//Sprites

sprites = [
		[sDepositEmpty, sDepositEmptyMarked, sDepositFull, sDepositFullMarked, sDepositMoveEmpty, sDepositMoveFull, sDepositTunnel],
		[sDepositEmptyStone, sDepositEmptyStoneMarked, sDepositFullStone, sDepositFullStoneMarked, sDepositStoneMoveEmpty, sDepositStoneMoveFull, sDepositTunnelStone],
		[sDepositEmptyRed, sDepositEmptyRedMarked, sDepositFullRed, sDepositFullRedMarked, sDepositRedMoveEmpty, sDepositRedMoveFull, sDepositTunnelRed],
		];
		
if (room == demo2) scenerio = 1;
if (room == demo3) scenerio = 2;

closedSprite = sprites[scenerio][0];
markSprite = sprites[scenerio][1];
fullSprite = sprites[scenerio][2];
markSpriteFull = sprites[scenerio][3];

rangeSprite = sprites[scenerio][4];
rangeSpriteFull = sprites[scenerio][5];

outRangeSprite = sprites[scenerio][6];


textBoxInstance = noone;
textBoxInstance2 = noone;
depositBar = noone;

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


drawX = (x - camera_get_view_x(view_camera[0])) * 4;
drawY = (y - camera_get_view_y(view_camera[0])) * 4;

