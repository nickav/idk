/*var camera = view_camera[view_current];
var vx = camera_get_view_x(camera), vy = camera_get_view_y(camera);
var vw = camera_get_view_width(camera), vh = camera_get_view_height(camera);
*/

var vx = 0, vy = 0, vw = room_width, vh = room_height;

draw_set_color(c_white);
draw_set_font(font0);

if (instance_exists(oTouchCompatible)) {
    draw_sprite(sLeftArrow, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sRightArrow, 0, __view_get( e__VW.XView, 0 ) + 96, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sJumpButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 16, __view_get( e__VW.YView, 0 ) + 280);
    //draw_sprite(sAtkButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 96, __view_get( e__VW.YView, 0 ) + 280);
}


// Debug draw /////////////////////////////
if (!debug) return;

draw_text(16, 16, string(room_get_name(room)));
	
if (log) draw_text(16, 32, string(log));