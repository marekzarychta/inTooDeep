var alph = image_alpha + sin(current_time / 1000) * 0.2;

draw_sprite_ext(sprite_index, image_index, x,y, 1, 1, 0, image_blend, alph);