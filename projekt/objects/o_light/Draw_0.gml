// Aktywuj shader
shader_set(my_shader);
shader_set_uniform_f(shader_get_uniform(my_shader,"sigma"), 0.3);
shader_set_uniform_f(shader_get_uniform(my_shader,"radius"), 2.0);

// Narysuj sprite'a
draw_self();

// Dezaktywuj shader
shader_reset();
