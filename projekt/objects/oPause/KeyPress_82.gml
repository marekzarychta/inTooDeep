//if (pause) {
//	checkpoint = true;	
//	pause = false;
//	instance_activate_all();
//	if(surface_exists(pauseSurf)) {
//		surface_free(pauseSurf);
//	}
//	if(buffer_exists(pauseSurfBuffer)) {
//		buffer_delete(pauseSurfBuffer);
//	}
//	gpu_set_blendenable(true);
//	if (instance_exists(oPlayer)) {
//		with (oPlayer) {
//			event_perform(ev_keypress, vk_enter);	
//		}
//	}
//}
