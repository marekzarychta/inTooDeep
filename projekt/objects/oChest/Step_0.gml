if (place_meeting(x, y, oPlayer)) {
    openable = true; 
} else {
    openable = false; 
}

if (openable && keyboard_check_pressed(ord("E"))) {
    
    instance_change(oChestOpen, true);
}
