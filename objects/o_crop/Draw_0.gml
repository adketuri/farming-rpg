/// @description Draw the crop
draw_sprite_part(
	s_crops, 
	0, 
	growth_stage * frame_width, 
	(crop_type - 1) * frame_height, 
	frame_width, 
	frame_height, 
	xx, 
	yy,
);

if (sparkle >= 0) {
	draw_sprite(s_sparkle, sparkle, x+2, y-2);
	sparkle += 0.1;
	if (sparkle >= sprite_get_number(s_sparkle)){
		sparkle = -1;
		alarm[1] = random_range(3,5)*room_speed;
	}
}