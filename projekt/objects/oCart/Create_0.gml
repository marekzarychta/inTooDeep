event_inherited();

velStart = 3.5;
dist = 72;

f = velStart * velStart / (2 * dist);

moveBuffer = ceil(velStart / f);
moveTimer = moveBuffer;

weightLvl = 0;
mass = weightChangeValue[weightLvl];

closedSprite = sCart;
halfFullSprite = sCartHalfFull;
fullSprite = sCartFull;
markSprite = sCartMark;
markSpriteFull = sCartMarkFull;
markSpriteHalfFull = sCartMarkHalfFull;

emiterLeft = part_emitter_create(global.particleSystem);
emiterRight = part_emitter_create(global.particleSystem);


content = ds_list_create();

maxSize = 2;

//var coin = instance_create_layer(x, y, layer, oCoin)
//coin.in_inventory = true;
//ds_list_add(content, coin);

moveDir = 0;
onTracks = true;

openable = false;
marked = false;

textBoxInstance = noone;
textBoxInstance2 = noone;
