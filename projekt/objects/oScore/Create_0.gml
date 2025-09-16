time = 500;
//words = ds_list_create();
//ds_list_add(words, "Level "+string(oGlobal.lvlNum)+" passed!\nYou've managed to get:");

index = 0;
first_click = false;
iter = 0;

sentence = "Level "+string(oGlobal.roomCounter)+" passed!\nYou've managed to get:";

file = file_text_open_read("levels.txt");
var last = 0;
if (file != -1) {
	while (!file_text_eof(file)) {
		last = file_text_read_real(file);
	}
	file_text_close(file);
}

var num = oGlobal.roomCounter;

if (last < num) {

	file = file_text_open_append("levels.txt");

	if (file != -1) {
	
		file_text_write_string(file, " "+string(num));
		file_text_close(file);
	}
}


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
