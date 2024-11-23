event_inherited();

velStart = 3.5;
dist = 72;

f = velStart * velStart / (2 * dist);

weightLvl = 0;
mass = weightChangeValue[weightLvl];

closedSprite = sCart;
fullSprite = sCartFull;
markSprite = sCartMark;
markSpriteFull = sCartMarkFull;



content = ds_list_create();

var coin = instance_create_layer(x, y, layer, oCoin)
coin.in_inventory = true;
ds_list_add(content, coin);

moveDir = 0;
onTracks = true;

openable = false;
marked = false;
