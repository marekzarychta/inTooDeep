var file = file_text_open_read("levels.txt");

var last = 0;

var room_name = "demo";

if (file != -1) {
	while (!file_text_eof(file)) {
		last = file_text_read_real(file);	
	}
	
	if (last >= 1 && last < 3) {
		room_name += string(last + 1);	
	}
	file_text_close(file);
}
var index = asset_get_index(room_name);
if (!instance_exists(oGlobal)) {
	var global_ = instance_create_layer(x, y, layer, oGlobal);
	global_.roomCounter = last + 1;
}
room_goto(index);


