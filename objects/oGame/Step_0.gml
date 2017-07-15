// Input variables for debug room traversal
var kRestart, kExit, kPrev, kNext;

kRestart = keyboard_check_pressed(ord("R"));
kExit    = keyboard_check_pressed(vk_escape);
kPrev    = keyboard_check_pressed(vk_subtract);
kNext    = keyboard_check_pressed(vk_add);

if (kRestart)
    room_restart();
if (kExit)
    game_end();

// Iterate through rooms backward
if (kPrev) {
    if (room == room_first)
        room_goto(room_last);
    else
        room_goto_previous();
}

// Iterate through rooms forwards
if (kNext) {
    if (room == room_last)
        room_goto(room_first);
    else
        room_goto_next();
}

// Toggle touch controls
if (keyboard_check_pressed(ord("P"))) {
    if (instance_exists(oTouchCompatible))
        with (oTouchCompatible)
            instance_destroy();
    else
        instance_create(0, 0, oTouchCompatible);
}


// Create new blocks
if (mouse_check_button(mb_left)) {
	var xx = floor(mouse_x / 16) * 16, yy = floor(mouse_y / 16) * 16;
	var collision = collision_point(xx, yy, oParSolid, false, true);
	if (!collision) {
		instance_create(xx, yy, oBlock);
	}
}