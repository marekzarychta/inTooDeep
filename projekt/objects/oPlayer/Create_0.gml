//Movement
	//Movement direction
moveDir = 0;

moveSpd = 2;
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
	jspd[0] = -3.15;
	jumpHoldFrames[1] = 5;
	jspd[1] = -2.70;

controlsSetup();