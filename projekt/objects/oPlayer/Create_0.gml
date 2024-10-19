//Movement
	//Movement direction
moveDir = 0;

// Inventory load indicator
weightLevels = [0, 1, 2, 3];
currentWeightLevel = 0;

// How much does inventory weigh
inventoryWeight = 0;

moveSpd = [2, 1.5, 1, 0.5];
xspd = 0;
yspd = 0;

face = 1;

//Chests
chestId = 0;



//Jumping
grav = .275;
	//Falling speed
termVel = 4;
	//On ground
onGround = true;
	//Maximum number of jumps
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
	//Jump values for successive jumps
	jumpHoldFrames[0] = 9;
	jspd[0] = [-3.15, -2.85, -2.5, -2];
	jumpHoldFrames[1] = 5;
	jspd[1] = [-2.70, -2.4, -2.05, -1.75];

controlsSetup();