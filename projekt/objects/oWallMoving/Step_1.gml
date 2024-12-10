//Move in a circle

dir+=rotSpd;

//Get target position
var _targetX = xstart + lengthdir_x( radius, dir );
var _targetY = ystart + lengthdir_y( radius, dir );

//get xspd, yspd
xspd = _targetX - x;
yspd = _targetY - y;


//move
x += xspd;
y += yspd;