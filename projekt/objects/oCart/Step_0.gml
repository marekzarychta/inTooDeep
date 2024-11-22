if (place_meeting(x + xspd, y, oCart)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
{
	var otherCart = instance_place(x + xspd, y, oCart);
	
	var tempSpd = otherCart.xspd;
	
	otherCart.xspd = xspd;
	
	xspd = tempSpd;
	
}


vel = smooth(vel, 0, xfriction);

xspd = moveDir * vel;

var _subPixel = 0.5;

if (place_meeting(x + xspd, y, oPlayer)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
{
	//var _pixelCheck = _subPixel * sign(xspd);
	
	////Move as close to the wall as possible in 0.5px increments
	//while !place_meeting(x+_pixelCheck, y, oPlayer)
	//{
	//	x += _pixelCheck;
	//}
	
	vel = smooth(vel, 0, xfriction);
	
	xspd = moveDir * vel;
	
	oPlayer.xspd = xspd;
}

if (place_meeting(x + xspd, y, oWall)) // || (place_meeting(x + xspd, y, oBreakableWallOrange) && yspd == 0)
{
	var _pixelCheck = _subPixel * sign(xspd);
	
	//Move as close to the wall as possible in 0.5px increments
	while !place_meeting(x+_pixelCheck, y, oWall)
	{
		x += _pixelCheck;
	}
	
	//Stop movement to collide
	moveDir *= -1;
	vel = smooth(vel, 0, xfriction - 0.1);
	
}

xspd = moveDir * vel;

x += xspd;

yspd += grav;

if (place_meeting(x, y + yspd, oWall)) {
        // Move up to wall precisely
        var _pixelCheck = _subPixel * sign(yspd);

        // Move as close to the wall as possible in 0.5px increments
        while !place_meeting(x, y + _pixelCheck, oWall) {
            y += _pixelCheck;
        }

        // Bonk
        if (yspd < 0) {
            jumpHoldTimer = 0;
        }

        // Stop movement to collide
        yspd = 0;  // Setting yspd to 0 only when truly colliding

}

y += yspd;