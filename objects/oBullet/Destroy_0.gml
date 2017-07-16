with (instance_create(x + sprite_width / 2, y + sprite_height / 2, oCratePoof)) {
	image_xscale = 0.5;
	image_yscale = 0.5;
}
audio_play_sound(sndExplodeSmall, 0, 0);