// Check if the textbox should follow the player
if (followPlayer) {
    // Assuming `obj_player` is the player object - in the future we could add following textboxes to other stuff
    x = obj_player.x - 16;
    y = obj_player.y - 32;
    
    // Decrement the timer
    followTimer -= 1;
    
    // Destroy the textbox when the timer reaches 0
    if (followTimer <= 0) {
        instance_destroy();
    }
}
