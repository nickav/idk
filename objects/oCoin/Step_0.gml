if (!onGround)
    vy = Approach(vy, vyMax, 0.5);
else {
	if (vy < 2) vy = 0;
	vy *= -0.7;
	vx *= 0.7;
}

//vx = Approach(vx, 0, 0.05);
