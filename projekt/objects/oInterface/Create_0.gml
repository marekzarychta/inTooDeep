global.view_width = 1920;
global.view_height = 1080;

var health_x = 16;
var health_y = 16;

var weight_x = health_x;
var weight_y = health_y + sprite_get_height(sHealthBar) + 16;

// Tworzenie oHealthBar w wyliczonym miejscu
instance_create_layer(health_x, health_y, "GUI", oHealthBar);
instance_create_layer(weight_x, weight_y, "GUI", oWeightBar);