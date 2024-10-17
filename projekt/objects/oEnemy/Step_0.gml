/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if vel_y < vel_y_max {
		vel_y += grav;
	} else {
		vel_y = vel_y_max;	
	}


if place_meeting(x, y + vel_y, oWall) {
	
	var _pixel_check = .5;
	
	while !place_meeting(x, y + _pixel_check, oWall) {
		y -= _pixel_check;	
	}
	
	vel_y = 0;
}

if place_meeting(x + vel_x, y, oWall) || !place_meeting(x + vel_x, y + vel_y, oWall) {
	vel_x = -vel_x;
}



x += vel_x;

y += vel_y;


