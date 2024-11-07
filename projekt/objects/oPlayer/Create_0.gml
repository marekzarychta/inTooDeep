//hitbox_delay = 0;

//Attack controller
attackCooldown = 45; // Attack cooldown of 60 frames -> roughly 1 second
attackCooldownTimer = 0; // Timer that resets the cooldown after attacking
attackingTimer = 0;
damage = 10;

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
	//Maximum number of jumps
jumpMax = 1;
jumpCount = 0;

//Timers for in-between animations
jumpStartTimer = 0;
jumpDuration = 1;

//See if player is interacting
isInteracting = false; 
interactionTimer = 60;

jumpHoldTimer = 0;
	//Jump values for successive jumps
	jumpHoldFrames[0] = 8;
	jspd[0] = [-3.20, -3, -2.83, -2.5];
	//jumpHoldFrames[1] = 5;
	//jspd[1] = [-2.70, -2.4, -2.05, -1.75];

top = false;

attacking = false;
isdying = false;

controlsSetup();
