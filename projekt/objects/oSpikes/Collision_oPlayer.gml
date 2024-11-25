with (other) { // Collision with player
    if (oSpikes.spikesPlayerDamageTimer == 0) { // Only deals damage when the timer is 0
        LoseHP(self, oSpikes.spikesDamagePlayer); // Deal damage
        oSpikes.spikesPlayerDamageTimer = oSpikes.spikesDamageDelay; // Reset timer
    }
}
