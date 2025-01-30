/// @description Create a light source
// You can write your code in this editor

offset = 4;
isLit = true;

emitter = part_emitter_create(global.particleSystem);
buffer = 70;
timer = 0;
prevIndex = 0;

part_emitter_region(global.particleSystem, emitter,bbox_left + 2, bbox_right - 2, y - offset - sprite_height / 2, y - offset - sprite_height / 2, ps_shape_ellipse, ps_distr_linear);
					
					
notLitSprite = sTorchEmpty;	


light = instance_create_layer(x+sprite_width/2 - 1,y-sprite_height/2 - offset,"Light", oLight);

light.scale_x = scale_x;
light.scale_y = scale_y;
light.x_scaleDiff = x_scaleDiff;
light.y_scaleDiff = y_scaleDiff;
light.sigma = sigma;