diff = false;
sprite = sButton;
sprite_hover = sButton_hover;

sprite_index = sprite;

hover = false;

o_name = "Start";

w = 64;
h = 24;

action = function() {
	file_delete("levels.txt");
	var transition = instance_create_layer(0, 0, layer, oTransition);
	transition.fade_out = true;
	
	if (instance_exists(oLevelSelector) && oLevelSelector.chosed) {
		transition.setnextroom = true;
		if (!instance_exists(oGlobal)) {
			var global_ = instance_create_layer(x, y, layer, oGlobal);
			global_.roomCounter = oLevelSelector.room_choosed
			setUIvisibility(false);
		}
		switch (oLevelSelector.room_choosed) {
			case 1:
			transition.setnextroom_value = demo;	
			break;
			case 2: 
			transition.setnextroom_value = demo2;	
			break;
			case 3:
			transition.setnextroom_value = demo3;		
			break;
		}
	}
};