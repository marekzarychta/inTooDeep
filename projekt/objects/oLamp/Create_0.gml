/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

// Inherit the parent event
event_inherited();

light.y += offset;

offset = -1;

light.y -= offset;

light.color = make_color_rgb(207, 135, 67);
//light = instance_create_layer(x+sprite_width/2 - 1,y-sprite_height/2 - offset,"Light", oLight);

light.scale_x = scale_x;
light.scale_y = scale_y;
light.x_scaleDiff = x_scaleDiff;
light.y_scaleDiff = y_scaleDiff;
light.sigma = sigma;

notLitSprite = sBrazierLowEmpty
part_emitter_region(global.particleSystem, emitter,bbox_left + 2, bbox_right - 2, y - offset - sprite_height / 2, y - offset - sprite_height / 2, ps_shape_ellipse, ps_distr_linear);
					