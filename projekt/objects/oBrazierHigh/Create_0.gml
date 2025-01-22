/// @description Create a light source
// You can write your code in this editor

offset = 7;

light = instance_create_layer(x+sprite_width/2,y-sprite_height/2 - offset,"Light", oLight);

//tu mozemy nadpisywac parametry swiatla
//light.color = cyellow;
//light.sigma = 0.3;
//light.radius = 2.0