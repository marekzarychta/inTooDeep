//Movement
	//Movement direction

moveDir = 1;
moveSpd = 0.5;
xspd = 0;
yspd = 0;

//Jumping
grav = .275;
	//Falling speed
termVel = 4;

edgeBuffer = 2;
edgeTimer = 0;

following = false; 

jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;
	//Jump values for successive jumps
	jumpHoldFrames = 4;
	jspd = -3.75;

controlsSetup();