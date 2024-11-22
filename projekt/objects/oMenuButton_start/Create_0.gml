
sprite = sButton;
sprite_hover = sButton_hover;

sprite_index = sprite;

hover = false;

o_name = "Start";

w = 64;
h = 24;

action = function() {
	var transition = instance_create_layer(0, 0, "GUI", oTransition);
	transition.fade_out = true;
};