//hitbox_delay = 0;
//backpack object
if (!layer_exists("Player_below")) {
	layer_create(0, "Player_below");	
}

backpack = instance_create_layer(x,y,"Player_below",oBackpack);
backpackSprites = [noone, sBackpackSmall, sBackpackMedium, sBackpackLarge];
backpackSpritesClimb = [noone, sBackpackSmallClimb, sBackpackMediumClimb, sBackpackLargeClimb];

//Attack controller
attackCooldown = 60; // Attack cooldown of 60 frames -> roughly 1 second
attackCooldownTimer = 0; // Timer that resets the cooldown after attacking
attackingTimer = 0;
damage = 10;
hitbox = noone;


reviveTimer = 0;
reviveBuffer = 200;

//Health
SetHP();
isAlive = true;

//Movement
	//Movement direction
moveDir = 0;
attackDir = 1;
	//Movement speed
moveSpd = 2;

// Inventory load indicator
SetWeights();
currentWeightLevel = 0;
movementSprites = [sPlayerRun, sPlayerRun, sPlayerWalk, sPlayerWalk];
// How much does inventory weigh
inventoryWeight = 0;

moveSpd = [2, 1.6, 1.2, 1];
xspd = 0;
xspdTemp = 0;
yspd = 0;

face = 1;

//Chests
chestId = 0;

//ladder
ladderSpd = 1;
weightLadderSlip = 0.1;
isLadder = false;
topLadder = false;

//dash
dashBuffer = 30;
dashTimer = 0;
dashCooldown = 120;
dashCooldownTimer = 0;
dashHoldTimer = 0;
dashAddSpd = 0.3;
isDashing = false;
hasDashed = false;

// True if equipment load is met as well as a falling velocity
can_break_orange = false;
can_break_red = false;
//Jumping
grav = .163;
	//Falling speed
termVelValues = [4, 5, 6];
termVel = termVelValues[0];
	//On ground
onGround = true;
	//was in air - needed for first contact with ground
wasMidair = false;
	//Maximum number of jumps
jumpMax = 1;
jumpCount = 0;

//Timers for in-between animations
jumpStartTimer = 0;
jumpDuration = 1;

//See if player is interacting
isInteracting = false; 

jumpHoldTimer = 0;
	//Jump values for successive jumps
	jumpHoldFrames[0] = 8;
	jspd[0] = [-3.20, -3, -2.82, -2.5];
	//jumpHoldFrames[1] = 5;
	//jspd[1] = [-2.70, -2.4, -2.05, -1.75];

top = false;

isBlocked = false;
attacking = false;
isdying = false;
isActive = true;


//debug noclip
noclip = false;

//Moving platforms
currentFloorPlat = noone;
moveplatXspd = 0
controlsSetup();