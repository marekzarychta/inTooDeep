var file = file_text_open_read("levels.txt");

var last = 0;

var room_name = "demo";

if (file != -1) {
	while (!file_text_eof(file)) {
		last = file_text_read_real(file);	
		if (last == 3) {
			
			if (!instance_exists(oGlobal)) {
				var global_ = instance_create_layer(x, y, layer, oGlobal);
				global_.roomCounter = last;
			}
			file_text_close(file);
			room_goto(demo3);
			break;	
		}
	}
	

}
