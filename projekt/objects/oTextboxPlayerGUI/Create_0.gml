textVal = "";           // Default text
textWidth = 0;          // To store the text width
followTimer = 120;      // Default timer for 2 seconds (60 FPS * 2 seconds)
followPlayer = false;   // Default to not follow the player
obj_player = oPlayer;
x = obj_player.screenpos_x;
y = obj_player.screenpos_y-(38*4);