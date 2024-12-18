// in inventory

grid_x = 0;
grid_y = 0;

choosen = false;

name = "test";
weight = 0;
item_value = 0;
name = "";


inv_sprite = sSpriteTemplete;

in_inventory = false; //czy swiat czy inventory
inDep = false; //czy depozyt czy inventory

// in world

world_sprite = sSpriteTemplete;

yspd = -3.75;
grav = .275;
termVel = 3;

onGround = false;

xspd = 0;

random_set_seed(random(400));

var zakres = irandom(1); 

if (zakres == 0) {
    xspd = random_range(-1.7, -0.5);
} else {
    xspd = random_range(0.5, 1.7);
}
fric = -sign(xspd) * 0.2;

flyingTimer = 30;
collectable = false;


