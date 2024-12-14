
// Wywołanie getControls() (np. w kontrolerze)

getControls();

if (inventoryKeyPressed) {
    opened = !opened;
}
// Animacja wysuwania/chowania
if (opened) {
    x = min(x + slide_speed, 0); // Przesuwanie w prawo (wysuwanie)
	visible = true;
} else {
    x = max(x - slide_speed, -960); // Przesuwanie w lewo (chowanie)
	if(x < -500){
		visible = false;
	}
}

// Sprawdzanie, czy kursor znajduje się na przedmiocie
hovered_item = -1; // Domyślnie brak

//pozycja myszki względem okna
//var mx = window_mouse_get_x();
//var my = window_mouse_get_y();

// Oblicz liczbę wierszy na podstawie liczby przedmiotów
rows = ceil(ds_list_size(oInventory.inventory) / max_columns);

if(opened){
	// Nawigacja po ekwipunku
	if (rightKey) { // Strzałka w prawo
	    if (!rightPressed) { // Zapobiega wielokrotnemu reagowaniu na pojedyncze naciśnięcie
	        selected_item = (selected_item + 1) mod ds_list_size(oInventory.inventory); // Następny przedmiot
	        rightPressed = true; // Flaga zapobiegająca wielokrotnemu wywołaniu
	    }
	} else {
	    rightPressed = false;
	}

	if (leftKey) { // Strzałka w lewo
	    if (!leftPressed) {
	        selected_item = (selected_item - 1 + ds_list_size(oInventory.inventory)) mod ds_list_size(oInventory.inventory); // Poprzedni przedmiot
	        leftPressed = true;
	    }
	} else {
	    leftPressed = false;
	}

	if (downKey) { // Strzałka w dół
	    if (!downPressed) {
	        selected_item += max_columns; // Przejście w dół
	        if (selected_item >= ds_list_size(oInventory.inventory)) {
	            selected_item -= ds_list_size(oInventory.inventory); // Wracamy na początek
	        }
	        downPressed = true;
	    }
	} else {
	    downPressed = false;
	}

	if (upKey) { // Strzałka w górę
	    if (!upPressed) {
	        selected_item -= max_columns; // Przejście w górę
	        if (selected_item < 0) {
	            selected_item += ds_list_size(oInventory.inventory); // Wracamy na koniec
	        }
	        upPressed = true;
	    }
	} else {
	    upPressed = false;
	}
}
