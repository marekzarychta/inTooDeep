/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (isAlive && xspd != 0)
{
    
    var look_ahead = sign(xspd) * 16; 
    
    var ground_ahead = place_meeting(x + look_ahead, y + 1, oWall);
    
    if (!ground_ahead && onGround && !special_slope)
	{
        
        x -= xspd; 
        
        xspd = 0;
        
        if (!following)
		{
            moveDir *= -1;
        }
		else
		{
            sprite_index = sprites[0];
        }
    }
}
