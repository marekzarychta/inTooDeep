dialogues = ["Do you want to\nbuy some stuff?", "What do you want?"];

openable = false;
marked = false;


gui = false;

iterator = 0;

talk = 0;

choice = 0;

shopContent = ds_list_create();

var item1 = instance_create_layer(x, y, layer, oHeal);
ds_list_add(shopContent, item1);

//var item2 = instance_create_layer(x, y, layer, oHeal);
//item2.name = "Big Bear";
//item2.healValue = 2;
//item2._value = 35;
//ds_list_add(shopContent, item2);