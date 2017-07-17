window_set_size(room_width * 2, room_height * 2);
window_center();

// restart logic
restart = false;
hasGun = false;
prevRoom = -1;
prevTarget = 0;

// mute
audio_master_gain(0.15);