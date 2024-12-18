//pobranie kontrolek
    var rightKey = keyboard_check_pressed(vk_right) + gamepad_button_check_pressed(0,gp_padr);
    rightKey = clamp(rightKey, 0, 1);


    var leftKey = keyboard_check_pressed(vk_left)  + gamepad_button_check_pressed(0,gp_padl);
    leftKey = clamp(leftKey, 0, 1);

	
	var closeKey = keyboard_check_pressed(vk_escape) + gamepad_button_check_pressed(0,gp_face2);
	closeKey = clamp(closeKey,0,1);
	
	var inventoryKey = keyboard_check_pressed(vk_tab) + gamepad_button_check_pressed(0,gp_shoulderl);
	inventoryKey = clamp(inventoryKey,0,1);
	
	var upKey = keyboard_check_pressed(vk_up) + gamepad_button_check_pressed(0,gp_padu);
    upKey = clamp(upKey, 0, 1);

    var downKey = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0,gp_padd);
	downKey = clamp(downKey, 0, 1);

if (!opened and inventoryKey) {
    opened = !opened;
}else if opened and (inventoryKey or closeKey){
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
    if(ds_list_size(oInventory.inventory) > 1) { // Sprawdzamy, czy jest więcej niż 1 przedmiot w ekwipunku
        // Nawigacja po ekwipunku
        if (rightKey) { // Strzałka w prawo
            if (!rightPressed) { // Zapobiega wielokrotnemu reagowaniu na pojedyncze naciśnięcie
                selected_item = (selected_item + 1) mod ds_list_size(oInventory.inventory); // Następny przedmiot
                if (selected_item >= ds_list_size(oInventory.inventory)) {
                    selected_item = 0; // Wracamy na początek
                }
                rightPressed = true; // Flaga zapobiegająca wielokrotnemu wywołaniu
            }
        } else {
            rightPressed = false;
        }

        if (leftKey) { // Strzałka w lewo
            if (!leftPressed) {
                selected_item = (selected_item - 1 + ds_list_size(oInventory.inventory)) mod ds_list_size(oInventory.inventory); // Poprzedni przedmiot
                if (selected_item < 0) {
                    selected_item = ds_list_size(oInventory.inventory) - 1; // Wracamy na koniec
                }
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
    
    // Zabezpieczenie: jeśli wybrany przedmiot został usunięty z ekwipunku
    if (selected_item >= ds_list_size(oInventory.inventory)) {
        selected_item = ds_list_size(oInventory.inventory) - 1; // Przejście na ostatni dostępny element
    }
}
