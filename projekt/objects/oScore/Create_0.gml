time = 500;
//words = ds_list_create();
//ds_list_add(words, "Level "+string(oGlobal.lvlNum)+" passed!\nYou've managed to get:");

index = 0;
first_click = false;
iter = 0;

sentence = "Level "+string(oGlobal.roomCounter)+" passed!\nYou've managed to get:";
show = false;

timer_count = 0;
buffer_count = 100;

_count = false;
adding = false;
val = 0;

timer2 = 0;
count = ds_list_size(oGlobal.inventory.inventory);
deposit_count = ds_list_size(global.lista);
hajs = oGlobal.gold - (count + deposit_count) * 15;
