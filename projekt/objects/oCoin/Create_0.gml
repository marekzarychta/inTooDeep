s// in world

world_sprite = sItem;

yspd = -3.75;
grav = .275;
termVel = 3;

onGround = false;

xspd = 0;

random_set_seed(random(400));

var zakres = irandom(1); 

if (zakres == 0) {
    xspd = random_range(-0.5, -0.1);
} else {
    xspd = random_range(0.1, 0.5);
}
fric = -sign(xspd) * 0.2;

flyingTimer = 30;
collectable = false;

// in inventory

grid_x = 5;
grid_y = 6;

choosen = false;

weight = 2;
item_value = 1;
name = "TestCoin";

inv_sprite = sItem;

in_inventory = false;

inDep = false;