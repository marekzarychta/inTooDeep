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

	if (!marked) {
		talk = 0;
	}


	if (place_meeting(x, y, oPlayer)) {
	    openable = true; 

	} else {
	    openable = false;
	}
	
	

	
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
    
		gui = true;
		oGlobal.gui = true;
		
	}
	
	
		
	
	
	
} else {
	oPlayer.isActive = false;
	blockControls(true);
	var closeKey = keyboard_check_pressed(vk_escape) + gamepad_button_check_pressed(0,gp_face2);
	closeKey = clamp(closeKey,0,1);
	
	var upKey = keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
    upKey = clamp(upKey, 0, 1);

    var downKey = keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
	downKey = clamp(downKey, 0, 1);
	
	var acceptKey = keyboard_check_pressed(ord("E")) + keyboard_check_pressed(vk_enter) + gamepad_button_check_pressed(0,gp_face1);
	downKey = clamp(downKey, 0, 1);
	
	
	if (talk == max_talk) {
		if (upKey) {
			choice--;
			
		}
		
		if (downKey) {
			choice++;
			
		}
		
		choice %= ds_list_size(shopContent);
	}
	
	if (acceptKey) {
		if (talk == max_talk) {
			var item = ds_list_find_value(shopContent, choice);
		
			if (oGlobal.gold >= item._value) {
				oGlobal.gold -= item._value;
				var newItem = instance_create_layer(x, y, layer, item.object_index);
				newItem._value = item._value;
				newItem.name = item.name;
				newItem.healValue = item.healValue;
				ds_list_add(oPlayer.healContent, newItem);
			}
		}
		if (talk < max_talk) talk++;
	}
	
	if (closeKey) {
		gui = false;
		oGlobal.gui = false;
		oPlayer.isActive = true;
		talk = 0;
	}
}




if (gui) {
	if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
		instance_destroy(textBoxInstance); // Usuwamy go
		textBoxInstance = noone; // Resetujemy wskaźnik
	}
	oPlayer.isActive = false;
} 

//if (messTimer < messBuffer) {
//	var task = ds_list_find_value(global.task_list, task_obj.numer);
		
//	var mess = "";
	
//	if (!finished) {
//		mess = task_obj.desc + " \nYou have to do " + string(task._value - task.counter) + " more.";
//		if (!isTaskAcitve) {
//			mess = task_obj.words;
//		}
//	} else {
//		mess = "Thank you for your help.";
//	} 
	
	
		
//	if (messTextBox == noone || !instance_exists(messTextBox)) { // Tylko jeśli textbox nie istnieje
		
//	    messTextBox = instance_create_layer(x, y - 64, layer_get_id("GUI"), oTextboxMessage); // Tworzymy textbox
//	} else if instance_exists(messTextBox) {
//	    messTextBox.textVal = mess;
//	}

	 
//} else {
//	if (messTextBox != noone && instance_exists(messTextBox)) { // Jeśli istnieje textbox
//	    instance_destroy(messTextBox); // Usuwamy go
//	    messTextBox = noone; // Resetujemy wskaźnik

//	}
//}

//messTimer++;
