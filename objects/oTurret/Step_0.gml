// About to charge
if (time == delayTime + 1) {
	audio_play_sound(sndCharge, 0, 0);
}

// Shooting
if (canShoot && instance_exists(oPlayer) && (time mod shotTime == 0)) {
	var shotError = random_range(-other.error, other.error);
	with (ShootBullet(x + sprite_width / 2, y + sprite_height / 2, bullet)) {
		direction = point_direction(x, y, oPlayer.x, oPlayer.y) + shotError;
	}
}