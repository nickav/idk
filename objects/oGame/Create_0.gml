window_set_size(room_width * 2, room_height * 2);
window_center();

// gameplay
deaths = 0;
startTime = current_time;
hasGun = false;

// restart logic
restart = false;
prevTarget = 0;

// Debug vars
debug = !code_is_compiled();
log = 0;

// mute
audio_master_gain(0.15);