//draw_text(__view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 16, string_hash_to_newline(string("Press 'P' to toggle touch controls on/off")));

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

draw_set_color(c_white);
draw_text(16, 16, string(room_get_name(room)));


if (instance_exists(oTouchCompatible)) {
    draw_sprite(sLeftArrow, 0, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 280);
    draw_sprite(sRightArrow, 0, __view_get( e__VW.XView, 0 ) + 96, __view_get( e__VW.YView, 0 ) + 280);   
    draw_sprite(sJumpButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 16, __view_get( e__VW.YView, 0 ) + 280);
    //draw_sprite(sAtkButton, 0, __view_get( e__VW.XView, 0 ) + 640 - 64 - 96, __view_get( e__VW.YView, 0 ) + 280); 
}

