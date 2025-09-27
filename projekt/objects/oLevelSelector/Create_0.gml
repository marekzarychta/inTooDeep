//file = file_text_open_read("levels.txt");

active = ds_list_create();

//if (file != -1) {
//	while(!file_text_eof(file)) {
//		var i = int64(file_text_read_real(file));
//		ds_list_add(active, i);
//	}
//	file_text_close(file);
//}


active = false;
return_anim = false;
chosed = false;

text = ["jaskinia", "slime", "pieklo"];

vel = (sprite_height + 40) / 40;
index = 0;


multply = window_get_width() / sprite_width;

start_y = -sprite_height * multply;

y = start_y;

room_choosed = 1;

alfa_time = 40;
alfa_buff = 40;

alfa = 1;

prev_mouseY = 0;
prev_mouseX = 0;
keyboard = false;
onlyOne = false;

buttons = [
[329, 333, 670, 536],
[571, 574, 954, 755],
[302, 817, 672, 1000],
[1600, 950, 1825, 1025]
]