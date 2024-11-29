function createTextbox(x, y, text) {
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    var textbox = instance_create_layer(x, y - 16, layer_get_id("Text"), oTextbox);
    textbox.textVal = text;
    return textbox;
}

function createFollowingTextbox(x, y, text) {
	
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    
    // Create the textbox slightly above the player’s position
    var textbox = instance_create_layer(x, y - 32, layer_get_id("Popups"), oTextboxPlayer);
    textbox.textVal = text;
    textbox.followTimer = 120; // Set a timer for 2 seconds (assuming 60 FPS)
    textbox.followPlayer = true; // Enable following behavior
    
    return textbox;
}

