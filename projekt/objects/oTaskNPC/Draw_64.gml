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



	var task = ds_list_find_value(global.task_list, task_obj.numer);
		
	var mess = "";
	
	if (!finished) {
		
		
		if (isTaskAcitve) {
			mess = task_obj.desc + " \nYou have to do " + string(task._value - task.counter) + " more.";
		} else {
			mess = task_obj.words;
		}
		if (talk == 1) {
			mess = task_obj.desc;
		}
	} else {
		mess = "Thank you for your help.";
	} 
	
	var padding = 4;
	var box_w = 300;
	var box_h = 120;
	
	var offset = 120;

	// Obliczenie pozycji GUI nad obiektem
	var text_x = gui_x - box_w / 2;
	var text_y = gui_y - sprite_height - box_h - offset; // Nad obiektem

	//show_debug_message("x: "+string(text_x) + " y: "+string(text_y));
	draw_set_font(Fnt_UI); 
	draw_set_halign(fa_center);
	
	// Rysowanie tła
	draw_set_color(c_white);
	draw_rectangle(text_x , text_y, text_x + box_w, text_y + box_h, false);

	// Rysowanie tekstu
	draw_set_color(c_black);
	draw_text(text_x + box_w / 2, text_y + padding, mess);
	if (talk == 1) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		// yes/no cordinates
	
	
		var no_y = gui_y - sprite_height - offset - 24;
	
		draw_text(text_x + 40, no_y - 24 - 2 * padding, "yes");
		draw_text(text_x + 40, no_y, "no");
	
	
		draw_line_width(text_x + padding, (choice ? no_y - 36 - 2 * padding : no_y - 12), text_x + 3 * padding, (choice ? no_y - 24 - 2 * padding : no_y), 2);
		draw_line_width(text_x + padding, (choice ? no_y - 12 - 2 * padding : no_y + 12), text_x + 3 * padding, (choice ? no_y - 24 - 2 * padding : no_y), 2);

	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}