var task = ds_list_find_value(global.task_list, taskNumer);

task_obj = ds_list_find_value(global.task_list, taskNumer);
max_talk = array_length(task_obj.words) - 1;
max_end_talk = array_length(task_obj.endWords) - 1;

if (task.compleated) {
	_finished = true;
}

if (sprite_index == sJarSleep && marked) {
	sprite_index = sJarAwake;
}

if (sprite_index == sJarAwake && image_index >= image_number - 1) {
	sprite_index = sJarIdle;
}

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
	
	
	
	//if (done) {
	//	talk = 1;
	//}
	
	if (openable && marked && messTimer >= messBuffer && !_finished) {
		if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
		    textBoxInstance = createTextbox(x, y - 40, text); // Tworzymy textbox
		} else if instance_exists(textBoxInstance) {
		    textBoxInstance.textVal = text;
		}

	} else {
		if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
		    instance_destroy(textBoxInstance); // Usuwamy go
		    textBoxInstance = noone; // Resetujemy wskaźnik
		}
	}

		
	if (marked && openable && oPlayer.isInteracting) && oPlayer.isAlive && !_finished {
    
		if (done) {
			
			
			isTaskAcitve = false;
			
			task.compleated = true;
			oGlobal.activeTask = noone;
			
		} 
		oGlobal.gui = true;
		if(sprite_index == sGhostIdle){
		audio_play_sound(snd_ghost,0,false);
		}
		else if(sprite_index == sCerberIdle){
			audio_play_sound(snd_cerber,0,false);
		}
		gui = true;
		//messTimer = messBuffer
		
				
			
		
			
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
	
	var acceptKey = keyboard_check_pressed(ord("E")) + gamepad_button_check_pressed(0,gp_face4);
	downKey = clamp(downKey, 0, 1);
	
	
	if (talk == max_talk + 1) {
		if (upKey || downKey) {
			choice = !choice;
		}
	}
	
	if (acceptKey) {
		talk++;
		if (!isTaskAcitve && !done) {
			if (talk > max_talk + 1) {
				gui = false;
				oGlobal.gui = false;
				oPlayer.isActive = true;
				talk = 0;
				if (!done) {
				
					if (choice) {
						oGlobal.activeTask = instance_create_layer(task_obj.x, task_obj.y, task_obj.layer, oTask);
						oGlobal.activeTask.desc = task_obj.desc;
						oGlobal.activeTask._value = task_obj._value;
						oGlobal.activeTask.words = task_obj.words;
						oGlobal.activeTask.numer = task_obj.numer;
			
						isTaskAcitve = true;
					}
				} 
			}
		} else {
			if (isTaskAcitve) {
				gui = false;
				oGlobal.gui = false;
				oPlayer.isActive = true;
				talk = 0;
			}
			
			if (done) {
				if (talk > max_end_talk) {
					_finished = true;
					oGlobal.gold += 20;
					gui = false;
					oGlobal.gui = false;
					oPlayer.isActive = true;
					talk = 0;
				}
			}
			
		}
		
	}
	
	if (closeKey) {
		gui = false;
		oGlobal.gui = false;
		oPlayer.isActive = true;
	}
}

if (isTaskAcitve && debug_mode) {
	var task = ds_list_find_value(global.task_list, task_obj.numer);
	
	show_debug_message("Aktualny stan taska: " + string(task.counter) + " i jego numer " + string(task.numer));
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
	
//	if (!_finished) {
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
