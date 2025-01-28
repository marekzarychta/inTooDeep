if (!gui) {
	var text = "talk";
	if (!variable_instance_exists(id, "textBoxInstance")) {
	    textBoxInstance = noone;
	}

	if (oPlayer.chestId == id && oPlayer.isAlive) {
	    marked = true;
	} else {
	    marked = false;
	}

	var dis = oPlayer.x - x;


	if (place_meeting(x, y, oPlayer)) {
	    openable = true; 

	} else {
	    openable = false;
	}
	show_debug_message(string(marked));

	if (openable && marked) {
	    if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
	        textBoxInstance = createTextbox(x, y - 20, text); // Tworzymy textbox
	    } else if instance_exists(textBoxInstance) {
	        textBoxInstance.textVal = text;
	    }

	} else {
	    if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
	        instance_destroy(textBoxInstance); // Usuwamy go
	        textBoxInstance = noone; // Resetujemy wskaźnik
	    }
	}
		
	if (marked && openable && oPlayer.isInteracting) && oPlayer.isAlive {
    
		//if (instance_exist(task_obj)) {
			gui = true;
			blockControls(true);
		//}
	
	}
} else {
	
	var closeKey = keyboard_check_pressed(vk_escape) + gamepad_button_check_pressed(0,gp_face2);
	closeKey = clamp(closeKey,0,1);
	
	var upKey = keyboard_check_pressed(vk_up) + gamepad_button_check_pressed(0,gp_padu);
    upKey = clamp(upKey, 0, 1);

    var downKey = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0,gp_padd);
	downKey = clamp(downKey, 0, 1);
	
	var acceptKey = keyboard_check_pressed(ord("C")) + gamepad_button_check_pressed(0,gp_face1);
	downKey = clamp(downKey, 0, 1);
	
	
	
	if (upKey || downKey) {
		choice = !choice;
	}
	
	if (acceptKey) {
		gui = false;
		
	}
	
	if (closeKey) {
		gui = false;
	}
}