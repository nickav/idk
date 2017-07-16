vw = 512;
vh = 320;
shake = false;
magnitude = 6;

//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);
view_set_wport(0, vw);
view_set_hport(0, vh);

//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(0, 0, vw, vh, 0, -1, -1, -1, 32, 32);

view_set_camera(0, camera);