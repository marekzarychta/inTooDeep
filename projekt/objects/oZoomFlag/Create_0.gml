orginalW = camera_get_view_width(view_camera[0]);
orginalH = camera_get_view_height(view_camera[0]);

condition = true;

goToPlaceBuffer = 80;
goToPlaceTimer = 0;

increase_dir = 1;
if (wspX > x) {
	increase_dir = 1;
} else {
	increase_dir = -1;	
}

start_offset = 0;

global.current_k = 1;

global.step_offset = 24;
dx = wspX - x;
dy = wspY - y;
step_x = dx / (k - 1);
step_y = dy / (k - 1);

image_xscale = increase_dir * image_xscale;
speed_x = (k - 1) / sprite_width;