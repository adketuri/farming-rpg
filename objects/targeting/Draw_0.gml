/// @description Draws the cursor over a targeted monster
if (o_player != noone){
	with (o_player){
		if (target != -1){
			with (target){
				draw_sprite(s_target, image_index, x - sprite_width/2 + 4, y - sprite_height - 4)	
			}
		}
	}
}