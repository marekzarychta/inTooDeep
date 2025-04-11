

life-=1;
if life % 16 == 0 {
	addy += 16;	
}

if (instance_exists(idEnemy)) {
x = idEnemy.x - face * offset_x;

y = idEnemy.y - 16 + addy;

}
if(life <= 0) {
	instance_destroy();
}

