// Timing
time += 1;

// Computed vars
totalTime = delayTime + chargeTime + shotTime * numShots;
canShoot = time > delayTime + chargeTime;
charge = time > delayTime && time <= delayTime + chargeTime;

// clamp time
if (time > totalTime) time = 0;