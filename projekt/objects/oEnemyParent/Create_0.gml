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
termVel = 4;

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
