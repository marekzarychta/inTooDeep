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
	if (instance_exists(oGlobal.activeTask) && instance_exists(task_obj)) {
		if (task_obj.numer == oGlobal.activeTask.numer) {
			var task = ds_list_find_value(global.task_list, task_obj.numer);
			if (task.counter >= task._value) {
				done = true;
			}
		}
	}
	
	if (instance_exists(oGlobal.activeTask)) {
		if (task_obj.numer == oGlobal.activeTask.numer) {
			isTaskAcitve = true;
		} else {
			isTaskAcitve = false;
		}
	}
	

	if (openable && marked && messTimer >= messBuffer) {
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
		
	if (marked && openable && oPlayer.isInteracting) && oPlayer.isAlive && !finished {
    
		
	
	
		if (!isTaskAcitve) {
			gui = true;
			blockControls(true);
		} else {
			if (done) {
				finished = true;
				messTimer = 0;
				oGlobal.gold += 20;
				isTaskAcitve = false;
				oGlobal.activeTask = noone;
			} else {
				messTimer = 0;
			}
		}
	
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
		if (choice) {
			oGlobal.activeTask = instance_create_layer(task_obj.x, task_obj.y, task_obj.layer, oTask);
			oGlobal.activeTask.desc = task_obj.desc;
			oGlobal.activeTask._value = task_obj._value;
			oGlobal.activeTask.words = task_obj.words;
			oGlobal.activeTask.numer = task_obj.numer;
			
			isTaskAcitve = true;
		}
	}
	
	if (closeKey) {
		gui = false;
	}
}

if (isTaskAcitve && debug_mode) {
	var task = ds_list_find_value(global.task_list, task_obj.numer);
	
	show_debug_message("Aktualny stan taska: " + string(task.counter) + " i jego numer " + string(task.numer));
}


if (messTimer < messBuffer) {
	var task = ds_list_find_value(global.task_list, task_obj.numer);
		
	var mess ="";
	if (!finished) {
		mess = task_obj.desc + "Brakuje Ci jeszcze " + string(task._value - task.counter);
	} else {
		mess = "Dziekuje za pomoc";
	}
	if (messTextBox == noone || !instance_exists(messTextBox)) { // Tylko jeśli textbox nie istnieje
		
	    messTextBox = instance_create_layer(x, y - 50, layer_get_id("GUI"), oTextboxMessage); // Tworzymy textbox
	} else if instance_exists(messTextBox) {
	    messTextBox.textVal = mess;
	}

	 
} else {
	if (messTextBox != noone && instance_exists(messTextBox)) { // Jeśli istnieje textbox
	    instance_destroy(messTextBox); // Usuwamy go
	    messTextBox = noone; // Resetujemy wskaźnik
	}
}

messTimer++;