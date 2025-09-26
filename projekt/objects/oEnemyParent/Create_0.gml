//Flash effect
flashAlpha = 0;
flashColor = c_white;

// Knockback variables for getting hit
death = false;
knockback_x = 0;
knockback_y = 0;
knockback_duration = 4; // Ile klatek trwa odrzut
knockback_power = 3; // Sila odrzutu

// Health and combat related variables
health_points = 0;
wasHit = false;
isAlive = true;
dying = false;
dead = false;
attacking = false;
attackTimer = 0;
attackBuffer = 30;
hitCounter = 0;
//nearest_logical_wall = instance_nearest(x, y, oLogicalWall);

//if(nearest_logical_wall != noone){
//	distance_to_logical_wall_x = abs(x - nearest_logical_wall.x);
//}else{
//	distance_to_logical_wall_x = -1;
//}


ignores_logical_walls = false;
face = 1;
initial_x = x;
initial_y = y;
//Movement
	//Movement direction
sprites = [];
moveDir = 1;
moveSpd = 0.7;
xspd = 0;
yspd = 0;

//Jumping
grav = .275;
	//Falling speed
termVel = 7.5;

edgeBuffer = 4;
edgeTimer = 0;

wallTimer = 0;
wallBuffer = 4;

changeDirTimer = 0;
changeDirBuffer = 3;

following = false; 
followingBuffer = 10;
followingTimer = 0;

jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
//Jump values for successive jumps
jumpHoldFrames = 4;
jspd = -3.25;
onGround = true;
isSlope = false;

death_flag = 1;
sprites = [];

colapse_dir = 1;
timer_not_ground = 0;
buffer_not_ground = 45;
fallen_death = false;