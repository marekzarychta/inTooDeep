if !opened {

	 
    // Upewnij się, że `textBoxInstance` jest zainicjalizowana, jeśli jeszcze tego nie zrobiono
    if (!variable_instance_exists(id, "textBoxInstance")) {
        textBoxInstance = noone;
    }
    var text = "leave";

    if (oPlayer.chestId == id && oPlayer.isAlive) {
        marked = true;
    } else {
        marked = false;
    }

    var dis = oPlayer.x - x;


    if (place_meeting(x, y, oPlayer) || (oCart == object_index)) {
        openable = true; 

    } else {
        openable = false;
    }

    sprite_index = closedSprite;

    // Tworzenie lub usuwanie `oTextbox`
    if (openable && marked) {
        if (textBoxInstance == noone || !instance_exists(textBoxInstance)) { // Tylko jeśli textbox nie istnieje
            textBoxInstance = createTextboxGUI(x - 15, y, text); // Tworzymy textbox
        } else if instance_exists(textBoxInstance) {
            textBoxInstance.textVal = text;
        }
        sprite_index = markSprite;
    } else {
        if (textBoxInstance != noone && instance_exists(textBoxInstance)) { // Jeśli istnieje textbox
            instance_destroy(textBoxInstance); // Usuwamy go
            textBoxInstance = noone; // Resetujemy wskaźnik
        }
    }
	if (marked && openable && oPlayer.isInteracting) && !oInventory.opened && oPlayer.isAlive {
    
	    room_persistent = false;
		toGold();
		var transition = instance_create_layer(0, 0, oGlobal.layer, oTransition);
		transition.fade_out = true;
		touch = true;
		opened = true;
	}	
}
//else {
//	sprite_index = openedSprite;	
//	if (instance_exists(textBoxInstance))
//		instance_destroy(textBoxInstance);
//}