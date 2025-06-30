function ENG_dictionary() {
	
	// Create dictionary
    var dick = ds_map_create();
	
	// SHOP NPC //
	ds_map_add(dick, "oShopNPC_textbox", "Talk");
	
	ds_map_add(dick, "oShopNPC_dialogue1", "\"Welcome, welcome\ntraveller to our...\nI mean my little\nshop hehehehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue2", "\"I have something\nhere that may\nsuit your needs,\nit'll put you right\nback on your feet!\"");
	ds_map_add(dick, "oShopNPC_dialogue3", "\"First time huh?\nI guess you can get\na special discount\nfor that\nhehehehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue4", "\"What do you want?\"");
	ds_map_add(dick, "oShopNPC_dialogue5", "\"Hello there fellow\ntraveller! Already\nback here? You\ncan't take care of\nyourself? hehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue6", "\"No freebies this\ntime though...\"");
	
	ds_map_add(dick, "oShopNPC_fail1", "I'm already fine");
	ds_map_add(dick, "oShopNPC_fail2", "It's too expensive");
    
	ds_map_add(dick, "oShopNPC_buttonBeer", "Big Beer");
	ds_map_add(dick, "oShopNPC_buttonLeave", "Leave");
	
	// TASK NPC //
	
	ds_map_add(dick, "oTaskNPC_textbox", "Talk");
	ds_map_add(dick, "oTaskNPC_gold", "Gold");
	
	ds_map_add(dick, "oTaskNPC_remaining1", "\nYou have to do\n");
	ds_map_add(dick, "oTaskNPC_remaining2", " more.");
	
	// Return dictionary
    return dick;
	
}