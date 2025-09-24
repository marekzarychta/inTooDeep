pause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;
pauseKey = 0;

// Game resolution, just in case something messes up
resW = 1920;
resH = 1080;

checkpoint = false;
wasPaused = false;
animation = false;

time = 20;
vely = (window_get_height()) / time;
start_x = 0;
start_y = 0;
index = 0;

buttons = [[194, 108, 273, 130
], [165, 146, 303, 167
], [195, 182, 274, 200
]];

keyboard = true;
prev_mouseY = 0;
prev_mouseX = 0;
onlyOne = false;