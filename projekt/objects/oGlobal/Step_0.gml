/// @description Insert description here
// You can write your code in this editor

//timer for the coin ramp up
if oGlobal.coin_chain_timer > 0 {
    oGlobal.coin_chain_timer -= 1;
} else {
    oGlobal.coin_chain = 0;
}


//timer for coin pickup to avoid overlapping
if oGlobal.coin_sound_cooldown > 0 {
    oGlobal.coin_sound_cooldown -= 1;
}
