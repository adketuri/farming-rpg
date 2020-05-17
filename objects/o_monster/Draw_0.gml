if (state != mon_state.dead){
	draw_sprite(sprite, floor(frame), x + attack_offset_x, y + attack_offset_y);
} else {
	draw_sprite(dead_sprite, min(floor(frame), sprite_get_number(dead_sprite) - 1), x, y);	
}