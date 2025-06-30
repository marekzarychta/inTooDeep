if (!variable_global_exists("ENG_dictionary")) {
    global.ENG_dictionary = ENG_dictionary();
}

if (!variable_global_exists("PL_dictionary")) {
    global.PL_dictionary = PL_dictionary();
}

if(!variable_global_exists("current_dictionary")) {
	global.current_dictionary = global.ENG_dictionary;
}

function switch_language(lang) {
	
	switch(lang) {
		case "EN":
			global.current_dictionary = global.ENG_dictionary;
			break;
		case "PL":
			global.current_dictionary = global.PL_dictionary;
			break;
		default:
			global.current_dictionary = global.ENG_dictionary;
			break;
	}
	
	change_language();

}

function get_trans(key) {
    if (ds_map_exists(global.current_dictionary, key)) {
        return ds_map_find_value(global.current_dictionary, key);
    } else {
        return key;
    }
}

function change_language() {
	if(instance_exists(oShopNPC)) {
		update_lang_oShopNPC();
	}
}

function update_lang_oShopNPC() {
	var item2 = ds_list_find_value(oShopNPC.shopContent, 1);
	item2.name = get_trans("oShopNPC_buttonBeer");
	show_debug_message(item2.name);
}
