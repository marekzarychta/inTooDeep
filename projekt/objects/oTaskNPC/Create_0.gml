

openable = false;
marked = false;

task_obj = noone;

task_obj = ds_list_find_value(global.task_list, taskNumer);

max_talk = array_length(task_obj.words) - 1;
max_end_talk = array_length(task_obj.endWords) - 1;

gui = false;

iterator = 0;

talk = 0;

choice = true;

isTaskAcitve = false;
_finished = false;
done = false;
messTimer = 80;
messBuffer = 80;
messTextBox = noone;
interactionTextBox = noone;

sprite_index = sGhostIdle;

if (sprite_index == sGhostIdle) {
	light = instance_create_layer(x + 2 * image_xscale, y - sprite_height / 2, "Light", oLight);
	light.color = make_color_rgb(178,224,226);
	light.image_alpha = 0.2;
	light.scale_x = 0.44;
	light.scale_y = 0.44;
	light.x_scaleDiff = 0;
	light.x_scaleDiff = 0;
}

if (room_get_name(room) == "demo2") sprite_index = sJarSleep;
if (room_get_name(room) == "demo3") sprite_index = sCerberIdle;