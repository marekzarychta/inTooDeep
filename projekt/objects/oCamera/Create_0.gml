boxSizeX = 72;
boxSizeY = 72;

midX = oPlayer.x;

xspd = 0;

_camX = 0;
_camY = 0;


bufferNotMoving = 60;
timerNotMoving = 0;

centrVel = 1.5;

_camWidth = camera_get_view_width(view_camera[0]);
_camHeight = camera_get_view_height(view_camera[0]);

leftEdge = 0;
rightEdgeX = room_width - _camWidth;
rightEdgeY = room_height - _camHeight;