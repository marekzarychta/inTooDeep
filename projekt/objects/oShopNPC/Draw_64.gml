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



		
	var mess = dialogues[room_num][talk];
	var padding_y = 10;
	var padding_x = 8;
	var box_w = 390;
	var box_h = 250;
	
	var offset = 210;

	// Obliczenie pozycji GUI nad obiektem
	var text_x = gui_x - box_w / 2;
	var text_y = gui_y - sprite_height - box_h - offset; // Nad obiektem

	//show_debug_message("x: "+string(text_x) + " y: "+string(text_y));
	draw_set_font(Fnt_dialogues); 
	draw_set_halign(fa_center);
	
	// Rysowanie tła
	
	//draw_rectangle(text_x , text_y, text_x + box_w, text_y + box_h, false);
	draw_sprite_stretched(sDialogueBox, 0, text_x , text_y, box_w, box_h);
draw_set_halign(fa_left);
	// Rysowanie tekstu
	draw_set_color(c_black);
	draw_text(text_x + 2 + padding_x, text_y + padding_y, mess);
	draw_text(text_x - 2 + padding_x, text_y + padding_y, mess);
	draw_text(text_x + padding_x, text_y + 2 + padding_y, mess);
	draw_text(text_x + padding_x, text_y - 2 + padding_y, mess);
	draw_set_color(c_white);
	draw_text(text_x + padding_x, text_y + padding_y, mess);
	if(gamepad_is_connected(0)){
		keyicon = sButtonA;
	}else{
		keyicon = sKeyE;
	}
	if (talk != max_talk) {
		draw_sprite_stretched(keyicon, 0, text_x + box_w - 70, text_y + box_h - 48, 32, 32);
		draw_sprite_stretched(sArrow, 0, text_x + box_w - 38, text_y + box_h - 48, 31, 31);
	}
	padding_y = 4;
	padding_x = 4;
	if (talk == max_talk) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		// yes/no cordinates
	
	
		var no_y = gui_y - sprite_height - offset - 70;
	
		var item = ds_list_find_value(shopContent, 0);
		
		draw_sprite_stretched(sHeartMini, 0, text_x + padding_y + string_width(item.name) + 75, no_y - 54 - 4 * padding_y, 20, 20);
		draw_sprite_stretched(sPlus, 0, text_x + padding_y + string_width(item.name) + 55, no_y - 52 - 4 * padding_y, 17, 17);
		
		var rightOffset = 100;
		
		draw_set_color(c_black);
		draw_text(text_x + 2 + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		draw_text(text_x + 2 + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x - 2 + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		draw_text(text_x - 2 + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x + padding_x + 40, no_y - 50 - 4 * padding_y, item.name);
		draw_text(text_x + box_w - rightOffset, no_y - 50 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x + padding_x + 40, no_y - 46 - 4 * padding_y, item.name);
		draw_text(text_x + box_w - rightOffset, no_y - 46 - 4 * padding_y, string(item._value) + " g");
		
		if (instance_exists(oGlobal) && item._value > oGlobal.gold) {
			draw_set_color(make_color_rgb(240, 50, 50));
		} else {
			draw_set_color(c_white);
		}
		draw_text(text_x + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		draw_set_color(c_white);
		draw_text(text_x + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		
		item = ds_list_find_value(shopContent, 1);
		no_y += 24 + 4 * padding_y;
		
		draw_sprite_stretched(sHeartMini, 0, text_x + padding_x + string_width(item.name) + 75, no_y - 54 - 4 * padding_y, 20, 20);
		draw_sprite_stretched(sHeartMini, 0, text_x + padding_x + string_width(item.name) + 85, no_y - 54 - 4 * padding_y, 20, 20);
		
		draw_sprite_stretched(sPlus, 0, text_x + padding_x + string_width(item.name) + 55, no_y - 52 - 4 * padding_y, 17, 17);
		
		rightOffset = 100;
		
		draw_set_color(c_black);
		draw_text(text_x + 2 + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		draw_text(text_x + 2 + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x - 2 + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		draw_text(text_x - 2 + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x + padding_x + 40, no_y - 50 - 4 * padding_y, item.name);
		draw_text(text_x + box_w - rightOffset, no_y - 50 - 4 * padding_y, string(item._value) + " g");
		draw_text(text_x + padding_x + 40, no_y - 46 - 4 * padding_y, item.name);
		draw_text(text_x + box_w - rightOffset, no_y - 46 - 4 * padding_y, string(item._value) + " g");
		
		draw_text(text_x + 2 + padding_x + 40, no_y - 24, "Leave");
		draw_text(text_x - 2 + padding_x + 40, no_y - 24, "Leave");
		draw_text(text_x + padding_x + 40, no_y - 26, "Leave");
		draw_text(text_x + padding_x + 40, no_y - 22, "Leave");
		
		if (instance_exists(oGlobal) && item._value > oGlobal.gold) {
			draw_set_color(make_color_rgb(240, 50, 50));
		} else {
			draw_set_color(c_white);
		}
		draw_text(text_x + box_w - rightOffset, no_y - 48 - 4 * padding_y, string(item._value) + " g");
		
		draw_set_color(c_white);
		draw_text(text_x + padding_x + 40, no_y - 48 - 4 * padding_y, item.name);
		
		draw_text(text_x + padding_x + 40, no_y - 24, "Leave");
	
	
		//draw_line_width(text_x + padding_y, (choice ? no_y - 36 - 2 * padding_y : no_y - 12), text_x + 3 * padding_y, (choice ? no_y - 24 - 2 * padding_y : no_y), 2);
		//draw_line_width(text_x + padding_y, (choice ? no_y - 12 - 2 * padding_y : no_y + 12), text_x + 3 * padding_y, (choice ? no_y - 24 - 2 * padding_y : no_y), 2);

		draw_sprite_stretched(sSelectedBox, 0, text_x + 2 * padding_x, no_y - 84 - 9 * padding_y + choice * (24 + 4 * padding_y), box_w - 4 * padding_y, 24 + 3 * padding_y);
		draw_sprite_stretched(keyicon, 0, text_x + box_w - 70, text_y + box_h - 48, 32, 32);
		draw_sprite_stretched(keyicon, 0, text_x + box_w - 70, text_y + box_h - 48, 32, 32);
		draw_sprite_stretched(sArrow, 0, text_x + box_w - 38, text_y + box_h - 48, 31, 31);
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}