var _sigma = start_sigma - 0.01 * (sin(current_time / timeSplit) * sin(current_time / timeSplit));
//var _dist = radius + 15 * (sin(current_time / 100) * sin(current_time / 100));
image_xscale = 1 + x_scaleDiff * (sin(current_time / timeSplit) * sin(current_time / timeSplit));
image_yscale = 1 + y_scaleDiff * (sin(current_time / timeSplit) * sin(current_time / timeSplit));

// Aktywuj shader
shader_set(my_shader);
shader_set_uniform_f(shader_get_uniform(my_shader,"sigma"), _sigma);
shader_set_uniform_f(shader_get_uniform(my_shader,"radius"), radius);

// Narysuj sprite'a
draw_self();

// Dezaktywuj shader
shader_reset();
