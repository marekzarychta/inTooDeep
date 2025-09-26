function setUIvisibility(_vis) {
	if (layer_exists("Popups")) {
		layer_set_visible(layer_get_id("Popups"), _vis);

	}
	if (layer_exists("UI")) {
		layer_set_visible(layer_get_id("UI"), _vis);

	}
	if (layer_exists("Text")) {
		layer_set_visible(layer_get_id("Text"), _vis);	

	}	
	if (layer_exists("GUI")) {
		layer_set_visible(layer_get_id("GUI"), _vis);	

	}	
	
	if (instance_exists(oGlobal)) {
		oGlobal.cutscene = !_vis;	
	}
}

function getStringWithLines(text, width, padding) {
	var lines = ds_list_create();
	var len = getNumberOfWords(text);
	for (var i = 0; i < len; i++) {
		
	}
}

function getNumberOfWords(text) {
	//nie w pełni poprawna funkcja licząca ilość słów
	var count = 1;
	for (var i = 0; i < string_length(text); i++) {
		if (text[i] == " ") {
			count++;	
		}
	}
	return count;
}

function getWord(text, pos) {
	var count = 0;
	var index = 0;
	
	
	for (var i = 0; i < string_length(text); i++) {
		if (text[i] == " ") {
			count++;
			if (pos == count) {
				index = i + 1;	
			}
		}
	}
}


function createTextbox(x, y, text) {
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    var textbox = instance_create_layer(x, y - 16, layer_get_id("Text"), oTextbox);
    textbox.textVal = text;
    return textbox;
}

function createTextboxGUI(valx, valy, text) {
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    var textbox = instance_create_layer(((valx - camera_get_view_x(view_camera[0])) * 4), ((valy - camera_get_view_y(view_camera[0])) * 4), layer_get_id("GUI"), oTextboxGUI);
	textbox.parentX = valx;
	textbox.parentY = valy;

    textbox.textVal = text;
    return textbox;
}

function getScreenPos(){
	var _x = (x - view_get_camera_x(view_camera[0])*4);
	var _y = (x - view_get_camera_x(view_camera[0])*4);
}

function createFollowingTextbox(x, y, text) {
	
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    
    // Create the textbox slightly above the player’s position
    var textbox = instance_create_layer(x, y - 32, layer_get_id("GUI"), oTextboxPlayer);
    textbox.textVal = text;
    textbox.followTimer = 120; // Set a timer for 2 seconds (assuming 60 FPS)
    textbox.followPlayer = true; // Enable following behavior
    
    return textbox;
}

function createFollowingTextboxGUI(x, y, text) {
	
    if (debug_mode) show_debug_message("Creating textbox at: " + string(x) + ", " + string(y) + " with text: " + text);
    
    // Create the textbox slightly above the player’s position
    var textbox = instance_create_layer(x, y - 32, layer_get_id("GUI"), oTextboxPlayerGUI);
    textbox.textVal = text;
    textbox.followTimer = 120; // Set a timer for 2 seconds (assuming 60 FPS)
    textbox.followPlayer = true; // Enable following behavior
    
    return textbox;
}

function createMiniTextbox(x,y, value, sgn, time = 40){
	var textbox = instance_create_layer(x, y - 32, layer_get_id("Text"), oMiniTextbox);
    textbox.textVal = sgn;
	if(value=="health"){
		textbox.icon = sHeartMini;
	}else if (value=="weight"){
		textbox.icon = sWeightMini;
	} else if (value=="mark") {
		textbox.icon = sExclamationMarkMini;
	} else if (value == "gold") {
		textbox.icon = sItem;
	}
    textbox.followTimer = time; // Set a timer for 2 seconds (assuming 60 FPS)
    textbox.followBuffer = time; // Set a timer for 2 seconds (assuming 60 FPS)
    textbox.followPlayer = true; // Enable following behavior
    
    return textbox;
}