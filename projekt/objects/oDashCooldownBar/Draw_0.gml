// Pozycja paska względem gracza
var barX = oPlayer.x - barWidth / 2; // Wycentruj pasek względem gracza
var barY = oPlayer.y + sprite_height + 5; // Umieść pasek poniżej gracza

// Kolor poziomej kreski
draw_set_color(c_white);
draw_rectangle(barX, barY, barX + barWidth, barY + barHeight, false);

// Pionowe kreski na brzegach
draw_line(barX-1, barY - tickHeightSmall / 2, barX-1, barY + barHeight + tickHeightSmall / 2);
draw_line(barX + barWidth, barY - tickHeightSmall / 2, barX + barWidth, barY + barHeight + tickHeightSmall / 2);

// Duża pionowa kreska przesuwająca się w lewo
var tickX = barX + (barWidth * (dashCooldownCurrent / dashCooldownMax));
draw_line(tickX, barY - tickHeightLarge / 2, tickX, barY + barHeight + tickHeightLarge / 2);
