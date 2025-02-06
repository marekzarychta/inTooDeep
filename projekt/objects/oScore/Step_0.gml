
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

if (time % 3 == 0) {
	
	index++;
	
	if (index > string_length(sentence)) show = true;
}

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

if (_count && timer2 % 4 == 0 && val < 15) {
	val++;
	if (val == 15) {
		
		adding = true;
	}
}

if (timer2 > val * 10) {
	_count = false;
}

if (adding && timer2 % 3 == 0) {
	
	if (hajs == oGlobal.gold) {
		adding = false;
	}
	hajs++;
}