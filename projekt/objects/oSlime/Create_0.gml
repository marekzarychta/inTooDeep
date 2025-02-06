event_inherited();

health_points = 100000000;

sprites = [sSlimeIdle, sSlimeWalk, sSlimeStunned];

stunned = false;
moveSpd = 0.6;
stun_duration = 0;


sprite_index = sprites[0];

emiterLeft = part_emitter_create(global.particleSystem);
//emiterRight = part_emitter_create(global.particleSystem);

