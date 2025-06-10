//treating interactive things like chests
var text, text2;

//if !InventoryIsEmpty(oInventory) {
	text = "   deposit";
//} else {
	text2 = "   retrieve";
//}

//if InventoryIsEmpty(oInventory) && ds_list_size(global.lista) == 0 {
	//text = "   deposit";	
//}

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


// Tworzenie lub usuwanie `oTextbox`


if (prevMarked != marked) {
	prevMarked = marked;
	markedChange = true;
}

if (!markedChange) {	

	
	if ds_list_size(global.lista) > 0 && !animating {
		sprite_index = fullSprite;
	} else if ds_list_size(global.lista) == 0 && !animating {
		sprite_index = closedSprite;	
	}

	if marked && openable && !animating && ds_list_size(global.lista) == 0 {
		sprite_index = markSprite;	
	} else if marked && openable && !animating && ds_list_size(global.lista) > 0 {
		sprite_index = markSpriteFull;	
	} 

	//poza zasiegiem nie wykrywani wiec marked jest na false i nie ma kolizji wiec openable jest na false
	if !marked && !openable && !animating {
		sprite_index = outRangeSprite;	
	}

}

//w zasiegu - animacja
if ds_list_size(global.lista) > 0 && (sprite_index == outRangeSprite && marked || markedChange && sprite_index == rangeSpriteFull && image_speed < 0) {
	audio_play_sound(snd_deposit_arrive,0,false);
	sprite_index = rangeSpriteFull;	
	if (markedChange && sprite_index == rangeSpriteFull && _i != -1) {
		image_index	= _i;
	}
	image_speed = abs(image_speed);
	animating = true;
	
} else if ds_list_size(global.lista) > 0 && (sprite_index == fullSprite && !marked || markedChange && sprite_index == rangeSpriteFull  && image_speed > 0) {
	sprite_index = rangeSpriteFull;	
	image_index = image_number - 1;
	if (markedChange && sprite_index == rangeSpriteFull  && _i != -1) {

		image_index	= _i;
	}
		audio_stop_sound(snd_deposit_arrive);
		audio_play_sound(snd_deposit_leave,0,false);
	image_speed = -abs(image_speed);
	animating = true;
	
} else if ds_list_size(global.lista) == 0 && (sprite_index == outRangeSprite && marked || markedChange && sprite_index == rangeSprite && image_speed < 0) {
	audio_play_sound(snd_deposit_arrive,0,false);
	sprite_index = rangeSprite;	
	if (markedChange && sprite_index == rangeSprite  && _i != -1) {
		image_index	= _i;
	}
	image_speed = abs(image_speed);
	animating = true;
} else if ds_list_size(global.lista) == 0 && (sprite_index == closedSprite && !marked || markedChange && sprite_index == rangeSprite && image_speed > 0) {

	sprite_index = rangeSprite;	
	image_index = image_number - 1;
	if (markedChange && sprite_index == rangeSprite  && _i != -1) {
		image_index	= _i;
	}
		audio_stop_sound(snd_deposit_arrive);
		audio_play_sound(snd_deposit_leave,0,false);
	image_speed = -abs(image_speed);
	animating = true;
}

if (animating) {
	//if (marked) {
	//	image_speed = abs(image_speed);	
	//} else {
	//	image_speed = -abs(image_speed);	
	//}
	_i = image_index;
	show_debug_message("animacja");
	if (floor(image_index) >= image_number - 1 && image_speed == 1) || (floor(image_index) <= 0 && image_speed == -1) {
		animating = false;
		_i = -1;
		show_debug_message("koniec");
	}
}
markedChange = false;

if (openable && marked && !animating) {
    if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
        textBoxInstance = createTextboxGUI(x, y - 40, text); // Tworzymy textbox
		textBoxInstance.depo = true;
    } else if instance_exists(textBoxInstance) {
        textBoxInstance.textVal = text;
		textBoxInstance.depo = true;
    }

} else {
    if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
        instance_destroy(textBoxInstance); // Usuwamy go
        textBoxInstance = noone; // Resetujemy wskaźnik
    }
}

if (openable && marked && !animating) {
    if (textBoxInstance2 == noone || !instance_exists(textBoxInstance2)) { // Tylko jeśli textbox nie istnieje
        textBoxInstance2 = createTextboxGUI(x, y - 40, text2); // Tworzymy textbox
		textBoxInstance2.normal = false;
		textBoxInstance2.depo = true;
		
    } else if instance_exists(textBoxInstance2) {
        textBoxInstance2.textVal = text2;
		textBoxInstance2.normal = false;
		textBoxInstance2.depo = true;
    }

} else {
    if (textBoxInstance2 != noone && instance_exists(textBoxInstance2)) { // Jeśli istnieje textbox
        instance_destroy(textBoxInstance2); // Usuwamy go
        textBoxInstance2 = noone; // Resetujemy wskaźnik
		
    }
}
		
if (marked && openable && !animating && oPlayer.isInteracting) /*&& !oInventory.opened*/ && oPlayer.isAlive {
    
	
	
		if (oPlayer.depositKey) {
			if !InventoryIsEmpty(oInventory) {
				audio_play_sound(snd_pickup, 0, false);

				//for (var i = ds_list_size(oInventory.inventory) - 1; i >= 0 ; i--) {	
				var i = ds_list_size(oInventory.inventory) - 1
				var item = ds_list_find_value(oInventory.inventory, i);	
				if item != noone {
					//ListAdd(items, item);	
					ds_list_add(items, item);
					ds_list_delete(oInventory.inventory, i);
					createMiniTextbox(oPlayer.x,oPlayer.y, "weight", "-");
				}
				//}
				
			} else{
				grunt();
				textbox = createFollowingTextboxGUI(oPlayer.x,oPlayer.y,"nothing to deposit");
		
			}
		}
	//} else {
		if (oPlayer.useKey2) {
			if(ds_list_size(items) != 0) {
			
				audio_play_sound(snd_pickup, 0, false);
				//for (var i = ds_list_size(items) - 1; i >= 0 ; i--) {	
				var i = ds_list_size(items) - 1;
					var item = ds_list_find_value(items, i);	
					if item != noone && item.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
						//ListAdd(items, item);	
						ds_list_add(oInventory.inventory, item);
						ds_list_delete(items, i);
						InventoryCalculateWeight(oInventory);
						createMiniTextbox(oPlayer.x,oPlayer.y, "weight", "+");
					} /*else {
						break;	
					}
				}*/
				

			} else{
				grunt();
				textbox = createFollowingTextboxGUI(oPlayer.x,oPlayer.y,"nothing to retrive");
		
			}
		}
	//}

	
	
	
	//when player opened -> open 2 windows
	//global.openedDep = true;
	//with (oInventory) {
	//	//event_perform(ev_keypress, ord("I"));	
	//	inventoryActiveFunc();
	//}
}

//===========DOTYCZY GUI==============


//if (marked && openable && keyboard_check_pressed(ord("R"))) /*&& !oInventory.opened*/ && oPlayer.isAlive {
//    //when player opened -> open 2 windows
//	//global.openedDep = true;
//	//with (oInventory) {
//	//	//event_perform(ev_keypress, ord("I"));	
//	//	inventoryActiveFunc();
//	//}
//	if !InventoryIsFull(oInventory) {	
//		var item = Remove(items);	
//		if item != noone {
//			ListAdd(oInventory.inventory, item);	
//		}
//	}
//}


	
	
//if (mouse_check_button_pressed(mb_right) && global.openedDep) {
//    MarkItemDep(id);
//	//marking in deposit window
//}

//if (mouse_check_button_pressed(mb_left) && global.openedDep) {
//    dragDepItem(id);
//}

//if (mouse_check_button_released(mb_left) && global.openedDep) {
//	releaseItem(id);	
//}

