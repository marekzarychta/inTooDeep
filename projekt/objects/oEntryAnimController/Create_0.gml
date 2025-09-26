standing_buffer1 = 30;
standing_buffer2 = 120;
standing_timer = 0;
index = 0;
blockControls(true);
if (instance_exists(oGlobal)) {
	if (!oGlobal.played_entry_cutscene)	{
		cutscene = instance_create_layer(x, y, layer_get_id("GUI_cutscene"), oTransitionCutScene);
	}
}




