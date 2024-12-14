if(visible && ds_list_size(oInventory.inventory) > 0){
	// Tło interfejsu
	draw_set_color(c_black);
	draw_rectangle(x, y, x + slot_size * max_columns + padding * 2, y + slot_size * ceil(ds_list_size(oInventory.inventory) / max_columns) + padding * 2, false);


	// Siatka przedmiotów
	for (var i = 0; i < ds_list_size(oInventory.inventory); i++) {
	    var item = oInventory.inventory[| i];
	    var col = i mod max_columns;
	    var row = i div max_columns;
	    var slot_x = x + padding + col * slot_size;
	    var slot_y = y + padding + row * slot_size;

	    // Rysowanie tła slotu
	    if (i == selected_item) {
	        draw_set_color(c_yellow); // Kolor podświetlenia dla zaznaczonego przedmiotu
	    } else {
	        draw_set_color(c_white); // Domyślny kolor
	    }
	    draw_rectangle(slot_x, slot_y, slot_x + slot_size, slot_y + slot_size, false);

	    // Rysowanie ikony przedmiotu
	    draw_sprite(item.sprite_index, 0, slot_x + slot_size / 2, slot_y + slot_size / 2);

	    // Rysowanie liczby przedmiotów, jeśli więcej niż 1
	        draw_set_color(c_white);
	        draw_text(slot_x + slot_size - 8, slot_y + slot_size - 8, string(1));
	}

	// Wyświetlanie informacji o zaznaczonym przedmiocie w stałym prostokącie
	if (selected_item >= 0) {
	    var selected_item_data = oInventory.inventory[| selected_item];
    
	    // Tekst do wyświetlenia
	    var item_info = "Name: " + "test" + "\n" +
	                    "Weight: " + string(selected_item_data.weight) + "\n" +
	                    "Value: " + string(selected_item_data.item_value);

	    // Obliczanie szerokości i wysokości tekstu
	    var text_width = string_width(item_info);
	    var text_height = string_height(item_info);

	    // Współrzędne prostokąta z informacjami
	    var row = selected_item div max_columns;
	    var info_x = x + slot_size * max_columns + padding * 3; // Po prawej stronie ekwipunku
	    var info_y = y + padding + row * slot_size; // Wysokość zgodna z wysokością rzędu przedmiotu


	    // Tło prostokąta, rozmiar dopasowany do rozmiaru tekstu
	    draw_set_color(c_black);
	    draw_rectangle(info_x, info_y, info_x + text_width + 16, info_y + text_height + 16, false); // 16 to padding wewnętrzny

	    // Tekst w prostokącie, wyrównany do lewej
	    draw_set_color(c_white);
	    draw_text(info_x + 8 + text_width/2, info_y + 8 + text_height/2, item_info); // 8 to margines wewnętrzny
	}
}