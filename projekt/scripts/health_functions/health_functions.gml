function SetHP() {

	max_health = 2;
	current_health = max_health;
	
	bufferEnemyHit = 60;
	timerEnemyHit = 0;
}

function DrawHealthBar(RootObject) {
	
	x = startX + oCamera._camX;
	y = startY + oCamera._camY;
	
	draw_sprite_stretched(sHealthBar, 0, x,y, MAX_HEALTH_WIDTH*16+6, 16);

	var stretch = 16 * MAX_HEALTH_WIDTH / oPlayer.max_health;

	for (var i = 0; i < oPlayer.current_health; i++){
		var xx = x + i * stretch + 3;
		draw_sprite_stretched(sHealthPoint,0,xx,y+3,stretch,10);
	}	
}

function HPManage() {
	if place_meeting(x, y, oEnemyParent) && timerEnemyHit == 0 {
		timerEnemyHit = bufferEnemyHit;
		LoseHP();
		
		if current_health == 0 {
			toDown(oPlayer);
			oPlayer.isAlive = false;
			oPlayer.sprite_index = sPlayerDead;
			timerEnemyHit = 0;
			DropAllItems(oInventory);
			if (oInventory.opened) {
				oInventory.opened = false;	
				CloseInventory(oInventory);
			}
		}
	}
	
	
	
	if timerEnemyHit > 30 {
		timerEnemyHit--;	
		oPlayer.sprite_index = sPlayerGotHit;
	} else if timerEnemyHit > 0 {
		timerEnemyHit--;	
	}
}

function LoseHP() {
	if current_health > 0 {
		current_health--;	
	}
}

function GainHP() {
	if current_health < max_health {
		current_health++;	
	}
}