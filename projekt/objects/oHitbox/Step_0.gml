life-=1;


if life % 10 == 0 {
	addy += 8;	
}

x = oPlayer.x + oPlayer.attackDir * 13;

y = oPlayer.y - 8 + addy;

if(life <= 0) {
	instance_destroy();
}

