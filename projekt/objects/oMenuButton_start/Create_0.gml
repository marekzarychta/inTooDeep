diff = false;
sprite = sButton;
sprite_hover = sButton_hover;

sprite_index = sprite;

hover = false;

o_name = "Start";

w = 64;
h = 24;

action = function() {
	file_delete("levels.txt");
	var transition = instance_create_layer(0, 0, layer, oTransition);
	transition.fade_out = true;
};