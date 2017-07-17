jumpTimer += 1;

if (!onGround)
    vy = Approach(vy, vyMax, 0.5);
else {
	vy = 0;
	vx = 0;
}

vx = Approach(vx, 0, 0.05);

if (instance_exists(oPlayer) && distance_to_object(oPlayer) < 80) {
if (jumpTimer mod 60 == 0) {
	var dir = 1;
	if (oPlayer.x < x) dir = -1;
	
	vy = -6;
	vx = 4 * dir;
}
}

if (hp <= 0) {
	instance_destroy();
}