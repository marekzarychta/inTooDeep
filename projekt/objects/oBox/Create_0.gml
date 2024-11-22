velStart = 3;
dist = 48;

f = velStart * velStart / (2 * dist);

moveBuffer = velStart / f;
moveTimer = moveBuffer;


startX = x;

blockadeInstance = noone;

xspd = 0;

isMoving = false;
moveDir = 0;

onGround = true;
grav = 0.163;
yspd = 0;
termVel = 4;
