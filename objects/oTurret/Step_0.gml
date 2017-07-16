if (canShoot && instance_exists(oPlayer) && (shootTime mod 5 == 0)) {
	with (instance_create(x + sprite_width / 2, y + sprite_height / 2, bullet)) {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y) + random_range(-2, 2);
		speed = 15;
		parent = other;
	}
	
	shootCount += 1;
	if (shootCount >= burst) {
		canShoot = false;
		shootCount = 0;
		alarm[0] = shootDelay;
		shootTime = 0;
	}
}

shootTime += 1;