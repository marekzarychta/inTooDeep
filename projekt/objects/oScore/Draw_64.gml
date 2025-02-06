draw_set_font(Fnt_dialogues_bigger);



var _x = display_get_gui_width() / 2, _y = 100;

var offset1 = 100;

draw_sprite_stretched(sDialogueBox, 0, 100, _y, display_get_gui_width() - 200, display_get_gui_height() - 2 * _y);

draw_set_color(c_black);
draw_text(_x + 2, _y + offset1, string_copy(sentence, 1, index));
draw_text(_x - 2, _y + offset1, string_copy(sentence, 1, index));
draw_text(_x, _y + 2 + offset1, string_copy(sentence, 1, index));
draw_text(_x, _y - 2 + offset1, string_copy(sentence, 1, index));
draw_set_color(c_white);
draw_text(_x, _y + offset1, string_copy(sentence, 1, index));

var offset2 = 400 + offset1; 

var box_w = (display_get_gui_width() - 500) / 7;
var box_x = 100 + 150;

if (show) {
	draw_sprite_stretched_ext(sDialogueBox, 0, box_x, offset2, box_w, box_w, c_grey, 1);
	draw_sprite_stretched_ext(sDialogueBox, 0, box_x + 2 * box_w, offset2, box_w, box_w, c_grey, 1);
	draw_sprite_stretched_ext(sDialogueBox, 0, box_x + 4 * box_w, offset2, box_w, box_w, c_grey, 1);
	draw_sprite_stretched_ext(sDialogueBox, 0, box_x + 6 * box_w, offset2, box_w, box_w, c_grey, 1);
	
	
	
	
	
	for (var i = 0; i < count; i++) {
		
		draw_sprite_stretched(sGoldBar, iter, box_x + i * 2 * box_w, 20 + offset2 - box_w / 2, box_w, box_w);
	}
	var offset3 = offset2 + 150;
	var rOff = 120;
	if (_count) {
		for (var i = 0; i < count; i++) {
			draw_sprite_stretched(sPlus, 0, box_x + rOff - 70 + i * 2 * box_w, _y + 10 + offset3, 30, 30)
			draw_set_color(c_black);
			draw_text( box_x + rOff+ i * 2 * box_w + 2, _y + offset3, string(val));
			draw_text( box_x + rOff+ i * 2 * box_w - 2, _y + offset3, string(val));
			draw_text( box_x + rOff+ i * 2 * box_w, _y + 2 + offset3, string(val));
			draw_text( box_x + rOff+ i * 2 * box_w, _y - 2 + offset3, string(val));
			draw_set_color(c_white);
			draw_text( box_x + rOff+ i * 2 * box_w, _y + offset3, string(val));
		}
	}
	var offset4 = offset3 + 100;
	var text = "Your gold: "+string(hajs);
	//if (adding) {
		draw_set_color(c_black);
		draw_text( _x + 2, _y + offset4, text);
		draw_text( _x - 2, _y + offset4, text);
		draw_text(  _x , _y + 2 + offset4, text);
		draw_text(  _x , _y - 2 + offset4, text);
		draw_set_color(c_white);
		draw_text(  _x , _y + offset4, text);
	//}
	//draw_sprite_stretched(sGoldBar, 0, box_x + 2 * box_w, offset2, box_w, box_w);
	//draw_sprite_stretched(sGoldBar, 0, box_x + 4 * box_w, offset2, box_w, box_w);
	//draw_sprite_stretched(sGoldBar, 0, box_x + 6 * box_w, offset2, box_w, box_w);
}
