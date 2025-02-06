	if firstColision and textTimer>0 
	{
		//draw_set_font(Fnt_UI_big);
		//draw_text(960,135,"checkpoint reached");
		//draw_set_font(Fnt_UI);
		//instance_create_layer(x, y, oGlobal.layer, oCheckpointNotify);
		sprite_frame += sprite_speed;
		if (sprite_frame >= 18) sprite_frame = 18;
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_sprite_stretched(sCheckpointNotification, sprite_frame, - 176 * 3 + display_get_gui_width() / 2, 100 - 56 * 3, 176 * 6, 56 * 6);
		draw_set_halign(fa_left);
		
	}