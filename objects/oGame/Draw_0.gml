var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

draw_set_color(c_white);
if (debug) {
	draw_text(16, 16, string(room_get_name(room)));
	
	if (log) draw_text(16, 32, string(log));
}

if (instance_exists(oTouchCompatible)) {
    draw_sprite(sLeftArrow, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sRightArrow, 0, __view_get( e__VW.XView, 0 ) + 96, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sJumpButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 16, __view_get( e__VW.YView, 0 ) + 280);
    //draw_sprite(sAtkButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 96, __view_get( e__VW.YView, 0 ) + 280);
}