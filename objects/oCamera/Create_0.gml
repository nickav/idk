vw = 640;
vh = 352;

// Shaky
isShaking = 0; // computed
shake = false;
shakeTime = 0;
magnitude = 6;


/* */
// Enable the use of views
view_enabled = true;

// Make view 0 visible
view_set_visible(0, true);
view_set_wport(0, vw);
view_set_hport(0, vh);

// Create camera
camera = camera_create_view(0, 0, vw, vh, 0, -1, -1, -1, 32, 32);

view_set_camera(0, camera);