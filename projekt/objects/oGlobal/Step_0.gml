if(keyboard_check_pressed(ord("M")) == 1) {
	if(global.current_dictionary == global.ENG_dictionary) {
		switch_language("PL");
	} else {
		switch_language("EN");
	}
}
