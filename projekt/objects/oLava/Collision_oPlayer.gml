with (other) { // Collision with player
    if (oLava.lavaPlayerDamageTimer == 0) { // Only deals damage when the timer is 0
        LoseHP(self, oLava.lavaDamagePlayer); // Deal damage
        oLava.lavaPlayerDamageTimer = oLava.lavaDamageDelay; // Reset timer
    }
}
