// Aktywuj shader
shader_set(my_shader);
shader_set_uniform_f(shader_get_uniform(my_shader,"sigma"), sigma);
shader_set_uniform_f(shader_get_uniform(my_shader,"radius"), radius);

// Narysuj sprite'a
draw_self();

// Dezaktywuj shader
shader_reset();
