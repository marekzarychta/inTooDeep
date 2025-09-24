event_inherited();

grid_x = 0;
grid_y = 0;

choosen = false;

weight = 0;
value = 0;
name = "";

inv_sprite = sSpriteTemplete;

emitter = part_emitter_create(global.particleSystem);

wrong_weight_anim = false;
scale = 1;
time = 0;
buff = 180;


//ile kafelków
how_many = (image_xscale) * (image_yscale);
num = 0;