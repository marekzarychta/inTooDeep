time--;
if (time <= 0) {
	oGlobal.roomCounter++;
	oGlobal.roomCounter %= 4;
	if (oGlobal.roomCounter == 0) {
		room_goto(Menu);
	} else {
		room_goto(oGlobal.roomList[oGlobal.roomCounter]);	
	}
}