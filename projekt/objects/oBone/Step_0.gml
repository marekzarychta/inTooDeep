var _subPixel = .5;

yspd += grav;

//Check wall collision
if place_meeting(x + xspd, y, oWall)
{
	//Walk up to wall precisely
	var _pixelCheck = _subPixel * sign(xspd);
	
	//Move as close to the wall as possible in 0.5px increments
	while !place_meeting(x+_pixelCheck, y, oWall)
	{
		x += _pixelCheck;
	}
	
	//Stop movement to collide
	xspd = 0;
}
	
if place_meeting(x + xspd, y, oWallSemiSolid)
{
	//Walk up to wall precisely
	var _pixelCheck = _subPixel * sign(xspd);
	
	//Move as close to the wall as possible in 0.5px increments
	while !place_meeting(x+_pixelCheck, y, oWallSemiSolid)
	{
		x += _pixelCheck;
	}
	
	//Stop movement to collide
	xspd = 0;
}

if place_meeting(x, y + yspd, oWall)
{
	//Walk up to wall precisely
	var _pixelCheck = _subPixel * sign(yspd);
	
	//Move as close to the wall as possible in 0.5px increments
	while !place_meeting(x, y+_pixelCheck, oWall)
	{
		y += _pixelCheck;
	}
	
	//Stop movement to collide
	xspd = 0;
	yspd = 0;
}

x += xspd;
y += yspd;