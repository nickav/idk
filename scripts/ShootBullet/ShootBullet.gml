/// @description ShootBullet(x, y, bullet)
/// @param x
/// @param y

var xx = argument0, yy = argument1, bulletType = argument2 ? argument2 : oBullet;
var bullet = instance_create(xx, yy, bulletType);

with (bullet) {
	parent = other;
}

audio_play_sound(sndShot, 0, 0);

return bullet;
