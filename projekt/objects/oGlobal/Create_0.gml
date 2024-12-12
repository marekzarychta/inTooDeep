global.lista = ds_list_create();
gold = 0;

inventory = instance_create_layer(x, y, layer, oInventory);
inventory.persistent = true;
interface = noone;

camera = noone;
persistent = true;


global.particleSystem = part_system_create();

part_system_depth(global.particleSystem, 200);
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
part_type_life(dashParticleType, 15, 20);
part_type_size(dashParticleType, 1, 1, 0.00, 0);
part_type_orientation(dashParticleType, 180, 180, 0, 0, 1);
//part_type_blend(dashParticleType, 1);

part_type_direction(dashParticleType, 180, 180, 0, 1);
part_type_speed(dashParticleType, 0.1, 0.1, 0.1, 0);
part_type_alpha3(dashParticleType, 0.7, 0.8, 0.02);

destructionParticleType = part_type_create();

part_type_sprite(destructionParticleType, sParticleFalling, 0, 0, 1);
part_type_life(destructionParticleType, 5, 10);
part_type_size(destructionParticleType, 1, 1, 0.00, 0);
part_type_orientation(destructionParticleType, 0, 359, 0, 0, 1);
part_type_blend(destructionParticleType, 1);

part_type_direction(destructionParticleType, 0, 359, 0.01, 1);
part_type_speed(destructionParticleType, 0.1, 0.1, 0.1, 0);
part_type_alpha3(destructionParticleType, 0.7, 0.8, 0.02);