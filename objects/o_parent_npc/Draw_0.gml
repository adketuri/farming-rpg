/// @description Draw NPC

if (move_x < 0) {
	y_frame = 2; 	
} else if (move_x > 0) {
	y_frame = 1;	
} else if (move_y < 0) {
	y_frame = 3; 	
} else if (move_y > 0) {
	y_frame = 0;	
} else {
	x_frame = 1;	
}

var xx = x - x_offset;
var yy = y - y_offset;
draw_sprite(s_shadow, 0, x, y);
draw_sprite_part(sprite_sheet, 0, floor(x_frame) * frame_w, floor(y_frame) * frame_h, frame_w, frame_h, xx, yy);

if (x_frame <= anim_length ) {
	x_frame += anim_speed / room_speed;
} 
if (x_frame >= anim_length) {
	x_frame = 0;
}

if (game.debug) draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
