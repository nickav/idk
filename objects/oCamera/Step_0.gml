
// Track player
var camera = view_camera[view_current];
var vx = camera_get_view_x(camera), vy = camera_get_view_y(camera);
var vw = camera_get_view_width(camera), vh = camera_get_view_height(camera);
var margin = 0.5;

if (instance_exists(oPlayer)) {
	var smooth = 0.2;
	var px = oPlayer.x + oPlayer.vx / smooth, py = oPlayer.y + oPlayer.vy / smooth;
	var tx = clamp(px - vw * 0.5, (px - 100) - vw * 0.5, (px + 100) - vw * 0.5);
	var ty = clamp(py - vh * 0.5, py - vh * 0.5 - 100, py - vh * 0.5 + 100);
	
	camera_set_view_pos(view_camera[0], lerp(vx, tx, smooth), lerp(vy, ty, smooth));
}

//Shake the camera assigned to the current view
if (shake) {
	camera_set_view_pos(camera, random_range(-magnitude, magnitude), random_range(-magnitude, magnitude));
}

// clamp camera to room bounds
camera_set_view_pos(camera,
                    clamp( camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera) ),
                    clamp( camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera) ));