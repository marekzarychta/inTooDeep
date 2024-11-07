life-=1;

if life % 20 == 0 {
	addy += 16;	
}

x = idEnemy.x - idEnemy.face * offset_x;

y = idEnemy.y - 16 + addy;

if(life <= 0) {
	instance_destroy();
}

