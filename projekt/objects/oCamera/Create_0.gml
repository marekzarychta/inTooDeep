boxSizeX = 16;
boxSizeY = 30;

midX = oPlayer.x;
midY = oPlayer.y;

xspd = 0;
yspd = 0;




bufferNotMovingX = 1;
timerNotMovingX = 0;

bufferNotMovingY = 5;
timerNotMovingY = 0;

centrVel = 1.5;

_camWidth = camera_get_view_width(view_camera[0]);
_camHeight = camera_get_view_height(view_camera[0]);

leftEdge = 0;
rightEdgeX = room_width - _camWidth;
rightEdgeY = room_height - _camHeight;

_camX = 0;
_camY = 0;