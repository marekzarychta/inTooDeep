//Attack controller
attackCooldown = 60; // Attack cooldown of 60 frames -> roughly 1 second
attackCooldownTimer = 0; // Timer that resets the cooldown after attacking

//Health
SetHP();
isAlive = true;

//Movement
	//Movement direction
moveDir = 0;
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


// True if equipment load is met as well as a falling velocity
can_break_floors = false;

//Jumping
grav = .275;
	//Falling speed
termVel = 4;
	//On ground
onGround = true;
	//Maximum number of jumps
jumpMax = 2;
jumpCount = 0;

//Timers for in-between animations
jumpStartTimer = 0;
jumpDuration = 1;

//See if player is interacting
isInteracting = false; 
interactionTimer = 60;

jumpHoldTimer = 0;
	//Jump values for successive jumps
	jumpHoldFrames[0] = 9;
	jspd[0] = [-3.15, -2.85, -2.5, -2];
	jumpHoldFrames[1] = 5;
	jspd[1] = [-2.70, -2.4, -2.05, -1.75];

controlsSetup();
