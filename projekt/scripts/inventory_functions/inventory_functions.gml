// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventoryIsEmpty(rootObject) {
    with (rootObject) {
        var size = ds_list_size(inventory);
		if size == 0
			return true;
    }
    return false;
}
function InventoryIsFull(rootObject) {
    with (rootObject) {
        var size = ds_list_size(inventory);
		if size < INVENTORY_GRID_X * INVENTORY_GRID_Y
			return false;
    }
    return true;
}

function InventoryTakenPositon(rootObject, _x, _y){
	var size = ds_list_size(rootObject.inventory);
	for(var i = 0; i < size; i++){
		var item = ds_list_find_value(rootObject.inventory, i);
		if(item.grid_x == _x && item.grid_y == _y)
		{
			return item;
		}
	}
		
	return noone;
}

	
function InventoryAdd(rootObject, itemType){
	if(!InventoryIsFull(rootObject)) {
		for (var _y = 0; _y < INVENTORY_GRID_Y; _y++) {
			for (var _x = 0; _x < INVENTORY_GRID_X; _x++) {
				if InventoryTakenPositon(rootObject, _x, _y) == noone {
				
					var item = itemType;
				
					//if itemType == 1 {
					//	item = instance_create_depth(0, 0, 20, oTestCoin);		
					//}
					item.grid_x = _x;
					item.grid_y = _y;
					item.item_value = irandom_range(5, 20);
					item.in_inventory = true;
					oPlayer.inventoryWeight += item.weight;
					ds_list_add(rootObject.inventory, item);
					return true;
				}
			}
		}
		return false;
		
	}
	else
	{
		show_debug_message("Inventory full");
	}
}

function InventoryRemove(rootObject) {
	
	
	if (!InventoryIsEmpty(rootObject)){
		for (var _y = INVENTORY_GRID_Y - 1; _y >= 0; _y--) {
			for (var _x = INVENTORY_GRID_X - 1; _x >= 0 ; _x--) {
				var item = InventoryTakenPositon(rootObject, _x, _y);
				
			
				if item != noone {
					
					ds_list_delete(rootObject.inventory, ds_list_find_index(rootObject.inventory, item));
					//instance_destroy(item);
					
					
					return item;
				}
			}
		}
		//show_debug_message(object_get_name(oTestCoin));
	}
	else
	{
		show_debug_message("Inventory empty");
		
	}
	return noone;
}

function InventoryRemoveChoosen(rootObject){
	
	
	if (!InventoryIsEmpty(rootObject)){
		for (var _y = INVENTORY_GRID_Y - 1; _y >= 0; _y--) {
			for (var _x = INVENTORY_GRID_X - 1; _x >= 0 ; _x--) {
				var item = InventoryTakenPositon(rootObject, _x, _y);
				
			
				if item != noone && item.choosen {
					
					ds_list_delete(rootObject.inventory, ds_list_find_index(rootObject.inventory, item));
					
					return item;
				}
			}
		}
		return noone;
	}
	else
	{
		show_debug_message("Inventory empty");
	}
}

function InventoryCalculateWeight(rootObject){
	if (!InventoryIsEmpty(rootObject)){
		var _weight = 0;
		var size = ds_list_size(rootObject.inventory);
        for (var i = 0; i < size; i++) {
            _weight += ds_list_find_value(rootObject.inventory, i).weight;
        }
		oPlayer.inventoryWeight = _weight;
	} else {
		oPlayer.inventoryWeight = 0;
	}
}

function OpenInventory(rootObject) {
	
	draw_sprite_stretched(sInventory, 0, x, y, inventory_w, inventory_h);
	
	

	
	for (var i = 0; i < INVENTORY_GRID_Y; i++) {
		var _y = y + i * 16 + y_offset;
		for (var j = 0; j < INVENTORY_GRID_X; j++) {
			var _x = x + j * 16 + x_offset;
			draw_sprite(sGrid, 0, _x-1, _y-1);
			draw_sprite_stretched(sSlot, 0, _x, _y, 14, 14);
			
		}
		
	}	
	
	var size = ds_list_size(rootObject.inventory);
	
	for (var i = 0; i < size; i++) {
		var item = ds_list_find_value(rootObject.inventory, i);
		if item != rootObject.dragging_item
			draw_sprite_stretched(item.inv_sprite, 0, x + item.grid_x * 16 + x_offset + 2, y + item.grid_y * 16 + y_offset + 2, 10, 10);
		if item.choosen {
			draw_sprite_stretched(sMarked, 0, x + item.grid_x * 16 + x_offset + 2, y + item.grid_y * 16 + y_offset + 2, 10, 10);	
		}
	}
	
	if (rootObject.dragging_item != noone) {
		
	    draw_set_color(c_yellow); 
	    draw_sprite_stretched(rootObject.dragging_item.inv_sprite, 0, mouse_x, mouse_y, 10, 10); // Rysowanie przedmiotu w miejscu kursora
	}
	
	// przyciski
	
	but1.x = rootObject.x + INVENTORY_GRID_X * 16 + x_offset * 2;
	but1.y = rootObject.y + y_offset;
	
	draw_sprite_stretched(but1.sprite_index, 0, but1.x, but1.y, 32, 16);
	draw_set_font(Fnt_small);
	draw_set_color(c_black);
	draw_text(but1.x + but1.w / 2, but1.y + but1.h / 2, string(but1.o_name));
}

function CloseInventory() {
	instance_destroy(but1.id);	
}

function dragItem(rootObject) {
	var _x = -1;
	var _y = -1;
	if mouse_x > rootObject.x + x_offset && mouse_x < rootObject.x + x_offset + 16 * INVENTORY_GRID_X {
		_x = floor((mouse_x - x - x_offset) / 16);  
	}
	if mouse_y > rootObject.y + y_offset && mouse_y < rootObject.y + y_offset + 16 * INVENTORY_GRID_Y {
		_y = floor((mouse_y - y - y_offset) / 16); 
	}
		
	var item;
	
	show_debug_message(string(_x) + " " + string(_y));
	
	if _x != -1 && _y != -1 {
		item = InventoryTakenPositon(rootObject, _x, _y);	
		if item != noone {
			rootObject.dragging_index = ds_list_find_index(rootObject.inventory, item);
			rootObject.dragging_item = item;
		
		}
	}
	
	
}

function releaseItem(rootObject) {
	if (rootObject.dragging_item != noone) {
	    var _x = -1;
		var _y = -1;
		if mouse_x > rootObject.x + x_offset && mouse_x < rootObject.x + x_offset + 16 * INVENTORY_GRID_X {
			_x = floor((mouse_x - x - x_offset) / 16);  
		}
		if mouse_y > rootObject.y + y_offset && mouse_y < rootObject.y + y_offset + 16 * INVENTORY_GRID_Y {
			_y = floor((mouse_y - y - y_offset) / 16);  
		}
		
		var item;
	
		if _x != -1 && _y != -1 {
			item = InventoryTakenPositon(rootObject, _x, _y);	
			if item == noone {
				rootObject.dragging_item.grid_x = _x;
				rootObject.dragging_item.grid_y = _y;
			}
		}
	
		
	
	    rootObject.dragging_item = noone;
	    rootObject.dragging_index = -1;
	}	
}

function DropAllItems(rootObject) {
	var size = ds_list_size(rootObject.inventory);
	var item = instance_create_layer(oPlayer.x, oPlayer.y, oChest.layer, oBag);
	
	for (var i = 0; i < size; i++) {
		ds_list_add(item.items, InventoryRemove(rootObject));	
		
	}
	
	
}

function DropItems(rootObject) {
	var size = choosenSize(rootObject);
	var item = instance_create_layer(oPlayer.x, oPlayer.y, oChest.layer, oBag);
	show_debug_message(string(size));
	for (var i = 0; i < size; i++) {
		var c = InventoryRemoveChoosen(rootObject);
		ds_list_add(item.items, c);	
		c.choosen = false;
		
	}
}

function choosenSize(rootObject) {
	var counter = 0;
	var size = ds_list_size(rootObject.inventory);
	for (var i = 0; i < size; i++) {
		var item = ds_list_find_value(rootObject.inventory, i);
		if item.choosen {
			counter++;	
		}
	}
	return counter;
}

function MarkItem(rootObject) {
	var _x = -1;
	var _y = -1;
	if mouse_x > rootObject.x + x_offset && mouse_x < rootObject.x + x_offset + 16 * INVENTORY_GRID_X {
		_x = floor((mouse_x - x - x_offset) / 16);  
	}
	if mouse_y > rootObject.y + y_offset && mouse_y < rootObject.y + y_offset + 16 * INVENTORY_GRID_Y {
		_y = floor((mouse_y - y - y_offset) / 16); 
	}
		
	var item;
	
	show_debug_message(string(_x) + " " + string(_y));
	
	if _x != -1 && _y != -1 {
		item = InventoryTakenPositon(rootObject, _x, _y);	
		if item != noone {
			
			item.choosen = !item.choosen;		
		}
	}
}

function debugAdd() {
	var newItem = instance_create_layer(0, 0, oChest.layer, oCoin);
	if newItem.weight + oPlayer.inventoryWeight <= oPlayer.maxInventoryWeight {
		InventoryAdd(id, newItem);
	} else {
		instance_destroy(newItem);	
	}
}