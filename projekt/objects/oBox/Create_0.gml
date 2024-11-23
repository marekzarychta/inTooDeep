SetWeights();

velStart = 2.5;
dist = 48;

f = velStart * velStart / (2 * dist);

mass = 0;//weightChangeValue[0];

moveBuffer = velStart / f;
moveTimer = moveBuffer;

blockadeInstance = noone;

xspd = 0;

isMoving = false;
moveDir = 0;

onGround = true;
grav = 0.163;
yspd = 0;
termVel = 4;
