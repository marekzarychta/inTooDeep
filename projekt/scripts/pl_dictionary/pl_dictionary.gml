function PL_dictionary() {
	
	// Create dictionary
    var dick = ds_map_create();
	
	// SHOP NPC //
	ds_map_add(dick, "oShopNPC_textbox", "Rozmawiaj");
	
	ds_map_add(dick, "oShopNPC_dialogue1", "\"Witaj, witaj\npodrozniku w naszym...\nto znaczy moim malym\nsklepiku hehehehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue2", "\"Mam tu cos\nco moze Ci\nsie przydac,\npostawi Ci na\nnogi raz dwa!\"");
	ds_map_add(dick, "oShopNPC_dialogue3", "\"Pierwszy raz, co?\nMysle, ze mozesz\ndostac za to\nspecjalna znizke\nhehehehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue4", "\"Co podac?\"");
	ds_map_add(dick, "oShopNPC_dialogue5", "\"Witaj mily\npodrozniku! Znow\ntutaj? Nie potrafisz\nsam o siebie\nzabdac? hehehe\"");
	ds_map_add(dick, "oShopNPC_dialogue6", "\"Tym razem bez\ngratisow...\"");
    
	ds_map_add(dick, "oShopNPC_fail1", "Jestem zdrow jak ryba");
	ds_map_add(dick, "oShopNPC_fail2", "Mam za malo zlota");
	
	ds_map_add(dick, "oShopNPC_buttonBeer", "Duze piwo");
	ds_map_add(dick, "oShopNPC_buttonLeave", "Wyjdz");
    
	// TASK NPC //
	
	ds_map_add(dick, "oTaskNPC_textbox", "Rozmawiaj");
	ds_map_add(dick, "oTaskNPC_gold", "Zloto");
	
	ds_map_add(dick, "oTaskNPC_remaining1", "\nPotrzebujesz\n");
	ds_map_add(dick, "oTaskNPC_remaining2", " wiecej.");
	
	// Return dictionary
	return dick;
	
}