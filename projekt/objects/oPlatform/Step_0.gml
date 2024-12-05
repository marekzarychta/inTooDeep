///// @description Insert description here
//// You can write your code in this editor
//if(place_meeting(x,y,oPlayer) && oPlayer.yspd >=0){
// // Move up to wall precisely
//		var _subPixel = 0.5;
 
//	    var _pixelCheck = _subPixel * sign(oPlayer.yspd);

//	    // Move as close to the wall as possible in 0.5px increments
//	    while !place_meeting(x, y + _pixelCheck, oPlayer) {
//	        oPlayer.y += _pixelCheck;
//	    }

//	    // Bonk
//	    if (oPlayer.yspd < 0) {
//	        oPlayer.jumpHoldTimer = 0;
//	    }

//	    // Stop movement to collide
//	    oPlayer.yspd = 0;  // Setting yspd to 0 only when truly colliding
//}