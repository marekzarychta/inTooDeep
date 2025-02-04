draw_set_font(Fnt_UI);
draw_set_color(c_white);
draw_set_halign(fa_left);
if (room != przejscie) {
	draw_text(20, 300, string("Score: ") + string(gold));
}
draw_set_halign(fa_center);

if (activeTask != noone && instance_exists(activeTask)) {
	var task = ds_list_find_value(global.task_list, activeTask.numer);
	
	var width = display_get_gui_width();
	
	var box_w = 450;
	var box_h = 150;
	var margin = 20;
	
	var color = make_color_rgb(100, 100, 100);
	draw_set_color(color);
	draw_rectangle(width - box_w - margin, margin, width - margin, box_h + margin, false);
	
	var val = task._value - task.counter;
	var text = "";
	
	if (val > 0) {
		color = make_color_rgb(240, 50, 50);
		draw_set_color(color);
		text = task.desc + "\nYou have to get " +string(val) + " more";
	} else {
		color = make_color_rgb(50, 240, 50);
		draw_set_color(color);
		text = "You have done this task!";
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(width - box_w / 2 - margin, margin + box_h / 2, text);
	//draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}
