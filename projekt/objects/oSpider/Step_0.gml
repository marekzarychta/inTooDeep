// obliczamy dystans do gracza
var dist = point_distance(x, y, oPlayer.x, oPlayer.y);

// jeżeli gracz dalej niż max_dist → klatka 1
if (dist >= max_dist) {
    image_index = 0; // klatki liczone od 0
}
// jeżeli gracz bliżej niż min_dist → klatka 13
else if (dist <= min_dist) {
    image_index = 12; // ostatnia klatka (0–12 = 13 klatek)
}
// w przeciwnym razie interpolujemy pomiędzy
else {
    var t = (max_dist - dist) / (max_dist - min_dist); 
    // t = 0 → max_dist, t = 1 → min_dist

    var frame = lerp(0, 12, t); // od klatki 0 do 12
    image_index = frame;
}