if (gui) {

	var ratioX = 1920 / 480;
	var ratioY = 1080 / 272;
	var width = 200;
	var height = 100;
	
	var x_start = view_wport[0];
	var y_start = view_hport[0];	
	var _x = (x) % 480;
	var _y = (y) % 272; 
	
	_x += view_xport[0];
	_y += view_yport[0];
	
	draw_rectangle(_x * ratioX, _y * ratioY , _x * ratioX + width, _y * ratioY + height, true);
}