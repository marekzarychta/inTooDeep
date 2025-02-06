draw_set_font(Fnt_dialogues);
draw_set_color(c_white);
draw_set_halign(fa_left);
if (room != przejscie) {
	var height_ = 200;
	draw_set_valign(fa_middle);
	//draw_sprite_stretched(sDialogueBox, 0, 20, height_, 200, 100);
	draw_sprite_stretched(sSakiewka, 0, 20, height_ + 10, 64, 64);
	draw_set_color(c_black);
	draw_text(102, height_ + 50, string(gold)+"g");
	draw_text(98, height_ + 50, string(gold)+"g");
	draw_text(100, height_ + 52, string(gold)+"g");
	draw_text(100, height_ + 48, string(gold)+"g");
	draw_set_color(c_white);
	draw_text(100, height_ + 50, string(gold)+"g");
	
	
	
	draw_set_valign(fa_top);
}
draw_set_halign(fa_center);

if (activeTask != noone && instance_exists(activeTask)) {
	var task = ds_list_find_value(global.task_list, activeTask.numer);
	
	var width = display_get_gui_width();
	
	var box_w = 250;
	var box_h = 150;
	var margin = 20;
	
	var color = make_color_rgb(100, 100, 100);
	draw_set_color(color);
	//draw_rectangle(width - box_w - margin, margin, width - margin, box_h + margin, false);
	//draw_sprite_stretched(sDialogueBox, 0, width - box_w - margin, margin, width, box_h);
	
	var val = task._value - task.counter;
	var text = "";
	
	
	//color = make_color_rgb(240, 50, 50);
	
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	if (val > 0) {
		text = task.desc + ": "+string(task.counter) + "/" + string(task._value);
		draw_set_color(c_black);
		draw_text(width - 26 -margin - box_w, margin, text);
		draw_text(width - 22 -margin - box_w, margin, text);
		draw_text(width - 24 -margin - box_w, margin + 2, text);
		draw_text(width - 24 -margin - box_w, margin - 2, text);
		
		draw_set_color(c_white);
		draw_text(width - 24 -margin - box_w, margin, text);
		draw_sprite_stretched(sCheckboxEmpty, 0, width - 24 - margin, margin, 24, 24);
	} else {
		text = task.desc + ": "+string(task._value) + "/" + string(task._value);
		draw_set_color(c_black);
		draw_text(width - 26 -margin - box_w, margin, text);
		draw_text(width - 22 -margin - box_w, margin, text);
		draw_text(width - 24 -margin - box_w, margin + 2, text);
		draw_text(width - 24 -margin - box_w, margin - 2, text);
		
		draw_set_color(c_white);
		draw_text(width - 24 -margin - box_w, margin, text);
		draw_sprite_stretched(sCheckboxFull, 0, width - 24 - margin, margin, 24, 24);	
	}
	

	//draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}
