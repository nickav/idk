// Timing
time += 1;

// Computed vars
totalTime = delayTime + chargeTime + shotTime * numShots - 1;
canShoot = time > delayTime + chargeTime;
charge = time > delayTime && time <= delayTime + chargeTime;

// clamp time
if (time > totalTime) time = 0;