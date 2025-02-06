// Ustawienia globalnych zmiennych widoku
global.view_width = 1920;
global.view_height = 1080;

// Kamera
cam = camera_create_view(0, 0, 480, 270, 0, -1, 0, 0, 1920, 1080);
view_set_camera(0, cam);
view_enabled = true;

// Pozycje elementów GUI
var health_x = 16;
var health_y = 16;

var weight_x = health_x;
var weight_y = health_y + sprite_get_height(sHealthBar) + 16;

// Tworzenie oHealthBar i oWeightBar
instance_create_layer(health_x, health_y, "GUI", oHealthBar);
instance_create_layer(weight_x, weight_y, "GUI", oWeightBar);


//instance_create_layer(-room_width, 0, "GUI", oInventoryUI);