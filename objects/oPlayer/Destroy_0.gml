instance_create(x, y, oCratePoof);
if (instance_exists(oPlayerAtkBox)) instance_destroy(oPlayerAtkBox);

if (dead) {
	with (oGame) deaths += 1;
}