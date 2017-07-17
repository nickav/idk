// Timing
time += 1;
if (time > totalTime) time = 0;

// Computed vars
totalTime = delayTime + chargeTime + shotTime * numShots;
canShoot = time > delayTime + chargeTime;
charge = time > delayTime && time <= delayTime + chargeTime;