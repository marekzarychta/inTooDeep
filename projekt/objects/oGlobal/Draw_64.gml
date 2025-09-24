if (!cutscene) {

	draw_set_font(Fnt_dialogues);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	if (room != przejscie) {
		var height_ = 200;
		draw_set_valign(fa_middle);
		//draw_sprite_stretched(sDialogueBox, 0, 20, height_, 200, 100);
		draw_sprite_stretched(sItem, 0, 20, height_ + 10, 64, 64);
		draw_set_color(c_black);
		draw_text(102, height_ + 50, string(gold));
		draw_text(98, height_ + 50, string(gold));
		draw_text(100, height_ + 52, string(gold));
		draw_text(100, height_ + 48, string(gold));
		draw_set_color(c_white);
		draw_text(100, height_ + 50, string(gold));
	
	
	
		draw_set_valign(fa_top);
	}
	draw_set_halign(fa_center);

	if (activeTask != noone && instance_exists(activeTask)) {
		var task = ds_list_find_value(global.task_list, activeTask.numer);
	
		var width = display_get_gui_width();
	
		var box_w = 380;
		var box_h = 150;
		var margin = 40;
		var marginUp = 20;
	
		var color = make_color_rgb(100, 100, 100);
		draw_set_color(color);
		//draw_rectangle(width - box_w - margin, margin, width - margin, box_h + margin, false);
		//draw_sprite_stretched(sDialogueBox, 0, width - box_w - margin, margin, width, box_h);
	
		var val = task._value - task.counter;
		var text = "";
	
	
		//color = make_color_rgb(240, 50, 50);
	
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		text = task.desc;
		box_w = string_width(text);
		draw_set_color(c_black);
		draw_text(width - 26 -margin - box_w, marginUp, text);
		draw_text(width - 22 -margin - box_w, marginUp, text);
		draw_text(width - 24 -margin - box_w, marginUp + 2, text);
		draw_text(width - 24 -margin - box_w, marginUp - 2, text);
		
		draw_set_color(c_white);
		draw_text(width - 24 -margin - box_w, marginUp, text);
		var h = string_height(text);
		var offUp = -(20 + h / 2 - 2);
		if (val > 0) {
			text = string(task.counter) + " of " + string(task._value);
			draw_set_color(c_black);
			draw_text(width - 26 -margin - box_w, marginUp + h, text);
			draw_text(width - 22 -margin - box_w, marginUp + h, text);
			draw_text(width - 24 -margin - box_w, marginUp + h + 2, text);
			draw_text(width - 24 -margin - box_w, marginUp + h - 2, text);
		
			draw_set_color(c_white);
			draw_text(width - 24 -margin - box_w, marginUp + h, text);
			margin -= 10;
			var size = 48;
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin + 3, marginUp + offUp + h + 2, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin - 3, marginUp + offUp + h + 2, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h + 5, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h - 1, size, size, c_black, 1);
			size -= 2;
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin + 1, marginUp + offUp + h + 2, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin - 1, marginUp + offUp + h + 2, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h + 4, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h + 0, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h + 2, size, size, c_white, 1);

			size += 1;
			draw_sprite_stretched_ext(sCheckboxEmpty, 0, width - 24 - margin, marginUp + offUp + h + 2, size, size, c_white, 1);

		} else {
			text = string(task._value) + " of " + string(task._value);
			draw_set_color(c_black);
			draw_text(width - 26 -margin - box_w, marginUp + h, text);
			draw_text(width - 22 -margin - box_w, marginUp + h, text);
			draw_text(width - 24 -margin - box_w, marginUp + h + 2, text);
			draw_text(width - 24 -margin - box_w, marginUp + h - 2, text);
		
			draw_set_color(c_white);
			draw_text(width - 24 -margin - box_w, marginUp + h, text);
			margin -= 10;
			var size = 48;

			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin + 3, marginUp + offUp + h + 2, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin - 3, marginUp + offUp + h + 2, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h + 5, size, size, c_black, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h - 1, size, size, c_black, 1);
			size -= 2;
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin + 1, marginUp + offUp + h + 2, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin - 1, marginUp + offUp + h + 2, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h + 4, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h + 0, size, size, c_white, 1);
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h + 2, size, size, c_white, 1);

			size += 1;
			draw_sprite_stretched_ext(sCheckboxFull, 0, width - 24 - margin, marginUp + offUp + h + 2, size, size, c_white, 1);
		}
	

		//draw_set_halign(fa_left);
		draw_set_valign(fa_top);
			draw_set_halign(fa_left);
		draw_set_color(c_white);
	}

}
