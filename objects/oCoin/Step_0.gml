if (!onGround)
    vy = Approach(vy, vyMax, 0.5);
else {
	if (vy < 1) vy = 0;
	vy *= -0.7;
	vx *= 0.7;
}

//vx = Approach(vx, 0, 0.05);

// Magnet towards player
/*if (instance_exists(oPlayer)) {
	var force = 10 / (distance_to_object(oPlayer) + 1);
	if (force < 0.1) force = 0;
	vx -= force;
}*/