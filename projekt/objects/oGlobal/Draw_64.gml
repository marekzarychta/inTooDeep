if (!cutscene) {
	
	if (start_room_text_anim) {
		draw_set_alpha(alfa);
		draw_set_font(Fnt_UI_big);
		draw_set_color(c_white);
		draw_line_width((-30 + window_get_width() - string_width(start_text[roomCounter - 1]))/ 2 , window_get_height() / 2, (60 + window_get_width() + string_width(start_text[roomCounter - 1]))/ 2 , window_get_height() / 2, 6)
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(window_get_width() / 2, window_get_height() / 2, start_text[roomCounter - 1]);
		draw_set_alpha(1);
	}
	
	if (ejzert_mode) {
		
		var time = current_time - speed_run_timer;
		var sec = floor(time / 1000);
		var _min = floor(sec / 60);
		var _sec = sec % 60;
		draw_set_font(Fnt_UI_big);
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(375, 16 + sprite_get_height(sHealthBar) / 2, (_min < 10 ? "0" : "") + string(_min)+":"+(_sec < 10 ? "0" : "")+string(_sec));
		
		draw_set_alpha(alfa);
		
		//draw_line_width((-30 + window_get_width() - string_width(start_text[roomCounter - 1]))/ 2 , window_get_height() / 2, (60 + window_get_width() + string_width(start_text[roomCounter - 1]))/ 2 , window_get_height() / 2, 6)
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(window_get_width() / 2, window_get_height() / 2, "Speedrun mode activated");
		draw_set_alpha(1);
	}
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
		var strip_val = 1 - task.counter / task._value;
	
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
		
		var text_len = string_width(string(task.counter) + " of " + string(task._value));
		
		var block_size = (20 + margin + box_w) / task._value;
		draw_set_color(c_green);
		draw_rectangle(width - 26 -margin - box_w, marginUp + h + 39, (width - 6) - (20 + margin + box_w) * strip_val, marginUp + h + 75, 0);
		draw_set_color(c_white);
		for (var i = 0; i < task.counter; i++) {
			draw_sprite_stretched(sWeightPoint_3, 0, width - 26 -margin - box_w + block_size * i, marginUp + h + 40, block_size, 36);
		}
		
		
		draw_sprite_stretched_ext(sSelectedBox, 0, width - 26 -margin - box_w, marginUp + h + 38, 20+margin +box_w, 36, c_white, 1);
		draw_sprite_stretched_ext(sSelectedBox, 0, width - 26 -margin - box_w, marginUp + h + 42, 20+margin +box_w, 36, c_white, 1);
		draw_sprite_stretched_ext(sSelectedBox, 0, width - 28 -margin - box_w, marginUp + h + 40, 20+margin +box_w, 36, c_white, 1);
		draw_sprite_stretched_ext(sSelectedBox, 0, width - 24 -margin - box_w, marginUp + h + 40, 20+margin +box_w, 36, c_white, 1);
		
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
