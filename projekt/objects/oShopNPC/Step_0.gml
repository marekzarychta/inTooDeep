if (prevMarked != marked) {
	prevMarked = marked;
	markedChange = true;
}

if (marked && sprite_index == sprites[0]) {
	sprite_index = sprites[1];
	animating = true;
} else if (!marked && sprite_index == sprites[4]) {
	sprite_index = sprites[3];
	animating = true;
}
	
	

if (animating) {
	//if (marked) {
	//	image_speed = abs(image_speed);	
	//} else {
	//	image_speed = -abs(image_speed);	
	//}
		
		
	if (floor(image_index) >= image_number - 1) {
		animating = false;
		if (sprite_index == sprites[1]) {
			sprite_index = sprites[4];
		} else if (sprite_index == sprites[3]) {
			sprite_index = sprites[0];
		}
	}
}
markedChange = false;

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

		
	if (marked && openable && oPlayer.isInteracting) && oPlayer.isAlive {
    
		gui = true;
		oGlobal.gui = true;
		
	}
	
	
		
	
	
	
} else {
	oPlayer.isActive = false;
	blockControls(true);
	var closeKey = keyboard_check_pressed(vk_escape) + gamepad_button_check_pressed(0,gp_face2);
	closeKey = clamp(closeKey,0,1);
	
	var upKey = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W")) + gamepad_button_check_pressed(0,gp_padu);
    upKey = clamp(upKey, 0, 1);

    var downKey = keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")) + gamepad_button_check_pressed(0,gp_padd);
	downKey = clamp(downKey, 0, 1);
	
	var acceptKey = keyboard_check_pressed(ord("E")) + keyboard_check_pressed(vk_enter) + gamepad_button_check_pressed(0,gp_face1);
	downKey = clamp(downKey, 0, 1);
	
	
	if (talk == max_talk) {
		if (upKey) {
			choice--;
			if (choice < 0) {
				choice += ds_list_size(shopContent) + 1;
			}
		}
		
		if (downKey) {
			choice++;
			
		}
		
		
	}
	choice %= (ds_list_size(shopContent) + 1);
	if (acceptKey) {
		if (talk == max_talk) {
			if (choice != ds_list_size(shopContent)) {
				var item = ds_list_find_value(shopContent, choice);
		
		
				if (oGlobal.gold >= item._value) {
					if (oPlayer.current_health < oPlayer.max_health) {
						oGlobal.gold -= item._value;
						
						oPlayer.current_health += item.healValue;
						oPlayer.flashColor = c_green;
						oPlayer.flashAlpha = 0.8;
						
					} else {
						createFollowingTextbox(oPlayer.x, oPlayer.y, "i'm already fine");
						grunt();
					}
					
				} else {
					createFollowingTextbox(oPlayer.x, oPlayer.y, "it's too expensive");
					grunt();
				}
			} else {
				closeKey = 1;
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
