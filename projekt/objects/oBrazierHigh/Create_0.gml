/// @description Create a light source
// You can write your code in this editor

event_inherited();

offset = 7;

light = instance_create_layer(x+sprite_width/2,y-sprite_height/2 - offset,"Light", oLight);

light.scale_x = scale_x;
light.scale_y = scale_y;
light.x_scaleDiff = x_scaleDiff;
light.y_scaleDiff = y_scaleDiff;
light.sigma = sigma;