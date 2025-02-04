if (gui) {
	
	// Pobranie aktywnej kamery
	var cam = view_get_camera(0);

	// Pobranie współrzędnych i rozmiaru widoku
	var view_x = camera_get_view_x(cam);
	var view_y = camera_get_view_y(cam);
	var view_w = camera_get_view_width(cam);
	var view_h = camera_get_view_height(cam);

	// Pobranie rozmiaru portu widoku (to jak duży widok jest na ekranie)
	var port_w = display_get_gui_width();  
	var port_h = display_get_gui_height();

	// Przeliczenie współrzędnych pokoju na GUI
	var gui_x = ((x - view_x) / view_w) * port_w;
	var gui_y = ((y - view_y) / view_h) * port_h;



		
	var mess = dialogues[talk];
	var padding = 4;
	var box_w = 300;
	var box_h = 140;
	
	var offset = 120;

	// Obliczenie pozycji GUI nad obiektem
	var text_x = gui_x - box_w / 2;
	var text_y = gui_y - sprite_height - box_h - offset; // Nad obiektem

	//show_debug_message("x: "+string(text_x) + " y: "+string(text_y));
	draw_set_font(Fnt_UI); 
	draw_set_halign(fa_center);
	
	// Rysowanie tła
	draw_set_color(c_white);
	//draw_rectangle(text_x , text_y, text_x + box_w, text_y + box_h, false);
	draw_sprite_stretched(sDialogueBox, 0, text_x , text_y, box_w, box_h);

	// Rysowanie tekstu
	draw_set_color(c_black);
	draw_text(text_x + box_w / 2, text_y + padding, mess);
	if (talk == 1) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		// yes/no cordinates
	
	
		var no_y = gui_y - sprite_height - offset - 24;
	
		var item = ds_list_find_value(shopContent, 0);
	
		draw_sprite_stretched(sHeartMini, 0, text_x + padding + 14, no_y - 34 - 4 * padding, 20, 20);
		draw_text(text_x + padding + 40, no_y - 24 - 4 * padding, item.name);
		draw_text(text_x + box_w - 50, no_y - 24 - 4 * padding, item._value);
	
	
		//draw_line_width(text_x + padding, (choice ? no_y - 36 - 2 * padding : no_y - 12), text_x + 3 * padding, (choice ? no_y - 24 - 2 * padding : no_y), 2);
		//draw_line_width(text_x + padding, (choice ? no_y - 12 - 2 * padding : no_y + 12), text_x + 3 * padding, (choice ? no_y - 24 - 2 * padding : no_y), 2);

		draw_sprite_stretched(sSelectedBox, 0, text_x + 2 * padding, (choice == 0 ? no_y - 36 - 5 * padding : no_y - padding - 12), box_w - 4 * padding, 24 + 3 * padding);

	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}