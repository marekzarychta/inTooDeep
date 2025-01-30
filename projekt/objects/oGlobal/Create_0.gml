global.lista = ds_list_create();

global.task_list = ds_list_create();

var task0 = instance_create_layer(x, y, layer, oTask);
task0.persistent = true;
task0.numer = 0;
task0._value = 6;
task0.desc = "Zniszcz "+string(task0._value)+" wazonow";
task0.words = "Bardzo lubie patrzeć\n na zniszczone wazony";
task0.counter = 0;
ds_list_add(global.task_list, task0);


var task1 = instance_create_layer(x, y, layer, oTask);
task1.persistent = true;
task1.numer = 1;
task1._value = 3;
task1.desc = "Zabij "+string(task1._value)+" szkielety";
task1.words = "Nie znoszę hałasu szkieletów";
task1.counter = 0;
ds_list_add(global.task_list, task1);

var task2 = instance_create_layer(x, y, layer, oTask);
task2.persistent = true;
task2.numer = 2;
task2._value = 5;
task2.desc = "Spadnij na "+string(task2._value)+" szkieletow";
task2.words = "Uwielbiam patrzec na miazge!";
task2.counter = 0;
ds_list_add(global.task_list, task2);

activeTask = noone;

gold = 0;
window_set_cursor(cr_none);
inventory = instance_create_layer(x, y, layer, oInventory);
inventory.persistent = true;
interface = noone;
pause = noone;

camera = noone;
persistent = true;
SetHP();

roomList = [Menu, demo, demo2, demo3];
roomCounter = 1;

importantObjects = [oInventory, oChest, oItemTemplate, oBox, oCart, oBreakableWallOrange, oBreakableWallRed, oDoor, oDoorButton]; 

global.particleSystem = part_system_create();

{

hitParticleType = part_type_create();

part_type_sprite(hitParticleType, sParticleFallingWhite, 0, 0, 1);
part_type_life(hitParticleType, 15, 35);
part_type_size(hitParticleType, 1.2, 1.2, -0.02, 0);
part_type_color1(hitParticleType, c_gray);
part_type_orientation(hitParticleType, 0, 359, 0, 0, 0);
part_type_direction(hitParticleType, 0, 359, 0, 1);
part_type_speed(hitParticleType, 0.2, 0.4, -0.004, 0);		
	
slimeHitParticleType = part_type_create();

part_type_sprite(slimeHitParticleType, sParticleSlime, 0, 0, 1);
part_type_life(slimeHitParticleType, 25, 30);
part_type_size(slimeHitParticleType, 1.2, 1.2, -0.01, 0);
part_type_orientation(slimeHitParticleType, 0, 359, 0, 0, 0);
part_type_direction(slimeHitParticleType, 0, 359, 0, 1);
part_type_speed(slimeHitParticleType, 0.1, 0.4, -0.004, 0);	
	
slimeParticleType = part_type_create();

part_type_sprite(slimeParticleType, sParticleSlime, 0, 0, 1);
part_type_life(slimeParticleType, 25, 40);
part_type_size(slimeParticleType, 1.2, 1.2, -0.01, 0);
part_type_orientation(slimeParticleType, 0, 0, 0, 0, 0);
part_type_direction(slimeParticleType, 170, 210, 0, 1);
part_type_speed(slimeParticleType, 0.1, 0.5, -0.004, 0);

slimeRightParticleType = part_type_create();

part_type_sprite(slimeRightParticleType, sParticleSlime, 0, 0, 1);
part_type_life(slimeRightParticleType, 25, 40);
part_type_size(slimeRightParticleType, 1.2, 1.2, -0.01, 0);
part_type_orientation(slimeRightParticleType, 0, 0, 0, 0, 0);
part_type_direction(slimeRightParticleType, -30, 10, 0, 1);
part_type_speed(slimeRightParticleType, 0.1, 0.5, -0.004, 0);
	
fricParticleType = part_type_create();

part_type_sprite(fricParticleType, sParticleFallOnGround, 0, 0, 1);
part_type_life(fricParticleType, 10, 15);
part_type_size(fricParticleType, 1, 1.2, -0.01, 0);
part_type_orientation(fricParticleType, 90, 90, 0, 0, 0);
part_type_direction(fricParticleType, 0, 180, 0, 1);
part_type_speed(fricParticleType, 0.1, 0.2, -0.004, 0);
	
cartParticleType = part_type_create();

part_type_sprite(cartParticleType, sParticleCart, 0, 0, 1);
part_type_life(cartParticleType, 10, 15);
part_type_size(cartParticleType, 1, 1.2, -0.01, 0);
part_type_orientation(cartParticleType, 90, 90, 0, 0, 0);

part_type_direction(cartParticleType, 0, 180, 0, 1);
part_type_speed(cartParticleType, 0.1, 0.2, -0.004, 0);
	
	
walkParticleType = part_type_create();

part_type_sprite(walkParticleType, sParticleFallOnGround, 0, 0, 1);
part_type_life(walkParticleType, 20, 30);
part_type_size(walkParticleType, 1, 1.5, 0.001, 0);
part_type_orientation(walkParticleType, 0, 359, 0.1, 1, 0);
//part_type_color1(walkParticleType, c_white);
part_type_blend(walkParticleType, 1);

part_type_direction(walkParticleType, 0, 359, 0, 1);
part_type_speed(walkParticleType, 0.1, 0.2, -0.004, 0);
//part_type_gravity(walkParticleType, 0.3, 1);
part_type_alpha3(walkParticleType, 0.3, 0.5, 0.05);

fallOnGroundParticleType = part_type_create();

part_type_sprite(fallOnGroundParticleType, sParticleFallOnGround, 0, 0, 1);
part_type_life(fallOnGroundParticleType, 30, 30);
part_type_size(fallOnGroundParticleType, 1, 1.2, 0.001, 0);
part_type_orientation(fallOnGroundParticleType, 0, 359, 0, 0, 1);
//part_type_color2(fallOnGroundParticleType, c_white, c_gray);
//part_type_blend(fallOnGroundParticleType, 1);

part_type_direction(fallOnGroundParticleType, 0, 180, 0, 1);
part_type_speed(fallOnGroundParticleType, 0.3, 0.3, -0.01, 0);
//part_type_gravity(fallOnGroundParticleType, 0.1, 1);
part_type_alpha2(fallOnGroundParticleType, 1, 0);

jumpRightParticleType = part_type_create();

part_type_sprite(jumpRightParticleType, sParticleFallOnGround, 0, 0, 1);
part_type_life(jumpRightParticleType, 35, 45);
part_type_size(jumpRightParticleType, 1, 1.2, 0.001, 0);
part_type_orientation(jumpRightParticleType, 0, 359, 0, 0, 1);
//part_type_color2(jumpRightParticleType, c_white, c_gray);
//part_type_blend(jumpRightParticleType, 1);

part_type_direction(jumpRightParticleType, 0, 0, 0, 1);
part_type_speed(jumpRightParticleType, 0.1, 0.3, -0.001, 0);
part_type_alpha2(jumpRightParticleType, 1, 0);

jumpLeftParticleType = part_type_create();

part_type_sprite(jumpLeftParticleType, sParticleFallOnGround, 0, 0, 1);
part_type_life(jumpLeftParticleType, 35, 45);
part_type_size(jumpLeftParticleType, 1, 1.2, 0.001, 0);
part_type_orientation(jumpLeftParticleType, 0, 359, 0, 0, 1);
//part_type_color2(jumpLeftParticleType, c_white, c_gray);
//part_type_blend(jumpLeftParticleType, 1);

part_type_direction(jumpLeftParticleType, 180, 180, 0, 1);
part_type_speed(jumpLeftParticleType, 0.1, 0.3, -0.001, 0);
part_type_alpha2(jumpLeftParticleType, 1, 0);


fallLeftParticleType = part_type_create();

part_type_sprite(fallLeftParticleType, sParticleFallingWhite, 0, 0, 1);
part_type_life(fallLeftParticleType, 15, 25);
part_type_size(fallLeftParticleType, 1, 1, 0.00, 0);
//part_type_orientation(fallLeftParticleType, 0, 359, 0.1, 1, 1);
//part_type_blend(fallLeftParticleType, 1);

part_type_direction(fallLeftParticleType, 90, 90, 0, 1);
part_type_speed(fallLeftParticleType, 0.1, 0.12, -0.002, 0);
part_type_alpha2(fallLeftParticleType, 1, 0.2);

fallRightParticleType = part_type_create();

part_type_sprite(fallRightParticleType, sParticleFallingWhite, 0, 0, 1);
part_type_life(fallRightParticleType, 15, 25);
part_type_size(fallRightParticleType, 1, 1, 0.00, 0);
//part_type_orientation(fallRightParticleType, 0, 359, 0.1, 1, 0);
//part_type_blend(fallRightParticleType, 1);

part_type_direction(fallRightParticleType, 90, 90, 0, 1);
part_type_speed(fallRightParticleType, 0.1, 0.12, -0.002, 0);
part_type_alpha2(fallRightParticleType, 1, 0.2);

fallParticleType = part_type_create();

part_type_sprite(fallParticleType, sParticleFallingWhite, 0, 0, 1);
part_type_life(fallParticleType, 3, 4);
part_type_size(fallParticleType, 1, 1, 0.00, 0);
part_type_orientation(fallParticleType, 90, 90, 0, 0, 1);
//part_type_blend(fallParticleType, 1);

part_type_direction(fallParticleType, 90, 90, 0, 1);
part_type_speed(fallParticleType, 0.1, 0.1, 0, 0);
part_type_alpha2(fallParticleType, 1, 0.2);

dashParticleType = part_type_create();

part_type_sprite(dashParticleType, sParticleFalling, 0, 0, 1);
part_type_life(dashParticleType, 10, 15);
part_type_size(dashParticleType, 1.2, 1.2, -0.03, 0);
part_type_orientation(dashParticleType, 0, 0, 0, 0, 1);
//part_type_blend(dashParticleType, 1);

part_type_direction(dashParticleType, 180, 180, 0, 1);
//part_type_speed(dashParticleType, 0.0, 0.005, 0.01, 0);
part_type_alpha1(dashParticleType, 0.05);

dashWhiteParticleType = part_type_create();

part_type_sprite(dashWhiteParticleType, sParticleFallingWhite, 0, 0, 1);
part_type_life(dashWhiteParticleType, 10, 15);
part_type_size(dashWhiteParticleType, 1.2, 1.2, -0.03, 0);
part_type_orientation(dashWhiteParticleType, 0, 0, 0, 0, 1);
part_type_blend(dashWhiteParticleType, 1);
part_type_direction(dashWhiteParticleType, 180, 180, 0, 1);
//part_type_speed(dashWhiteParticleType,  0.0, 0.005, 0.01, 0);
part_type_alpha1(dashWhiteParticleType, 0.05);

destructionParticleType = part_type_create();

part_type_sprite(destructionParticleType, sParticleDestruction, 0, 0, 1);
part_type_life(destructionParticleType, 5, 10);
part_type_size(destructionParticleType, 1, 1, 0.00, 0);
part_type_orientation(destructionParticleType, 0, 359, 0, 0, 1);
part_type_blend(destructionParticleType, 1);

part_type_direction(destructionParticleType, 0, 359, 0.01, 1);
part_type_speed(destructionParticleType, 0.1, 0.1, 0.1, 0);
part_type_alpha3(destructionParticleType, 0.7, 0.8, 0.02);
}
	