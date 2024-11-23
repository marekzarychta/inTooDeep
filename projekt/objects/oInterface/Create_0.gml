global.view_width = 1920;
global.view_height = 1080  // Pozycja Y lewego górnego rogu viewportu

// Oblicz pozycję dla oHealthBar (5% wysokości, 20% od prawej)
var health_x = global.view_width * 0.75;
var health_y = 0; // 5% wysokości



// Tworzenie oHealthBar w wyliczonym miejscu
instance_create_layer(health_x, health_y, "GUI", oHealthBar);
