file = file_text_open_read("levels.txt");

active = ds_list_create();

if (file != -1) {
	while(!file_text_eof(file)) {
		var i = int64(file_text_read_real(file));
		ds_list_add(active, i);
	}
	file_text_close(file);
}


active = false;
vel = (sprite_height + 40) / 40;