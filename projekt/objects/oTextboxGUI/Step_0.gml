/// @description Insert description here
// You can write your code in this editor

//Przeniesienie współrzędnych in-game na współrzędne względem kamery
x = (parentX - camera_get_view_x(view_camera[0])) * 4;
y = (parentY - camera_get_view_y(view_camera[0])) * 4;