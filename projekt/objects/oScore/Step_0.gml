var keyNext = keyboard_check_pressed(vk_enter);

if (keyNext) {
	if (!first_click) {
		index = string_length(sentence);
		val = 15;
		hajs = oGlobal.gold;
		first_click = true;
	}
	else {
		time = 0;
		adding = false;
		_count = false;
	}
}


if (!_count && !adding) {
	time--;
}
if (time <= 0) {
	oGlobal.roomCounter++;
	oGlobal.roomCounter %= 4;
	if (oGlobal.roomCounter == 0) {
		room_goto(Menu);
	} else {
		room_goto(oGlobal.roomList[oGlobal.roomCounter]);	
	}
}



//maszyna do pisania
if (time % 3 == 0) {
	
	index++;
	
	if (index > string_length(sentence)) show = true;
}


//przerwa do pokazania
if (show) {
	timer_count++;
}

if (timer_count > buffer_count) {
	_count = true;	
}

if (_count || adding) {
	timer2++;
}

iter += 0.2;

//licznik przy sztabkach
if (_count && timer2 % 4 == 0 && val < 15) {
	val++;
	if (val == 15) {
		
		adding = true;
	}
}

if (timer2 > val * 10) {
	_count = false;
}

//zliczanie głównego licznika
if (adding && timer2 % 3 == 0) {
	hajs++;
	if (hajs == oGlobal.gold) {
		adding = false;
	}
	
}


