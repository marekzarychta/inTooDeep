event_inherited();
sprites = [];
switch(terrain){
	case "normal":
	sprites = [sBreakableWall_Orange, sBreakableWall_Red];
	break;
	case "cave":
	sprites = [sBreakableWall_Orange_Cave, sBreakableWall_Red_Cave];
	break;
	case "lava":
	sprites = [sBreakableWall_Orange_Lava, sBreakableWall_Red_Lava];
	break;
}

sprite_index = sprites[threshhold-2];

show_debug_message(terrain);

emitter = part_emitter_create(global.particleSystem);
