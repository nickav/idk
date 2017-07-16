var visit = 0;
var explosions;

explosions[0] = self;

// find all connected explosives
while (visit < array_length_1d(explosions)) {
	var node = explosions[visit];
	visit += 1;

	var collisions = collision_rectangle_list(node.x - 16, node.y - 16, node.x + 32 - 1, node.y + 32 - 1, oBlockExplosive, 0, 1);
	for (var i = 0; i < ds_list_size(collisions); i++) {
		var inst = collisions[| i];
		if (!array_includes(explosions, inst)) {
			array_push(explosions, inst);
		}
	}
}

// destroy all the things!
for (var i = 1; i < array_length_1d(explosions); i++) {
	var node = explosions[i];
	instance_create(node.x + 8, node.y + 8, oCratePoof);
	instance_destroy(node, false);
}

event_inherited();