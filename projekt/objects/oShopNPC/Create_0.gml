dialogues = [["oShopNPC_dialogue1", "oShopNPC_dialogue2", "oShopNPC_dialogue3", "oShopNPC_dialogue4"],
["oShopNPC_dialogue5", "oShopNPC_dialogue6", "oShopNPC_dialogue4"]];

openable = false;
marked = false;
prevMarked = false;
back = false;
animating = false;
markedChange = false;

gui = false;

iterator = 0;

room_num = 0;
if (room_get_name(room) != "demo") room_num = 1;

talk = 0;
max_talk = array_length(dialogues[room_num]) - 1;

choice = 0;

shopContent = ds_list_create();

free = false;

setted = 20;

if (room == demo) free = true;

var item1 = instance_create_layer(x, y, layer, oHeal);

if (free) {
	item1._value = 0;
}

ds_list_add(shopContent, item1);

sprites = [sNPCShopIdle, sNPCShopApproach, sNPCShopMove, sNPCShopLeave, sNPCShopNearby];

var item2 = instance_create_layer(x, y, layer, oHeal);
item2.name = get_trans("oShopNPC_beer");
item2.healValue = 2;
item2._value = setted * 2 - 5;
ds_list_add(shopContent, item2);
