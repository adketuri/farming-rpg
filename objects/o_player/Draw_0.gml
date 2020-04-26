/// @description Draw player
var anim_length = 4;
var anim_speed = 9;

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

draw_sprite_part(s_player, 0, floor(x_frame) * SPR_W, floor(y_frame) * SPR_H, SPR_W, SPR_H, x, y);

if (x_frame <= anim_length ) {
	x_frame += anim_speed / room_speed;
} 
if (x_frame >= anim_length) {
	x_frame = 0;
}
