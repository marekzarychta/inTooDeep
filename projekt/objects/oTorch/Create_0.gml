/// @description Create a light source
// You can write your code in this editor

offset = 4;


emitter = part_emitter_create(global.particleSystem);
buffer = 70;
timer = 0;
prevIndex = 0;

part_emitter_region(global.particleSystem, emitter,bbox_left + 2, bbox_right - 2, y - offset - sprite_height / 2, y - offset - sprite_height / 2, ps_shape_ellipse, ps_distr_linear);
					
					
					


light = instance_create_layer(x+sprite_width/2,y-sprite_height/2 - offset,"Light", oLight);

//tu mozemy nadpisywac parametry swiatla
//light.color = cyellow;
//light.sigma = 0.3;
//light.radius = 2.0