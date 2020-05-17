/// @description Draw player

if (!combat) {
	if (facing == dir.left) {
		y_frame = 2; 	
	} else if (facing == dir.right) {
		y_frame = 1;	
	} else if (facing == dir.up) {
		y_frame = 3; 	
	} else if (facing == dir.down) {
		y_frame = 0;	
	} else {
		x_frame = 1;	
	}
	anim_length = 4;
} else {
	if (attacking){
		if (combat_facing == dir.left) {
			y_frame = 9; 	
		} else if (combat_facing == dir.right) {
			y_frame = 2;	
		} else if (combat_facing == dir.up) {
			y_frame = 5; 	
		} else if (combat_facing == dir.down) {
			y_frame = 8;	
		} 		
	} else {
		if (combat_facing == dir.left) {
			y_frame = 1; 	
		} else if (combat_facing == dir.right) {
			y_frame = 0;	
		} else if (combat_facing == dir.up) {
			y_frame = 4; 	
		} else if (combat_facing == dir.down) {
			y_frame = 7;	
		} 
	}
	anim_length = 3;
}

if (game.debug){
	if (movement_grid != -1) {
		mp_grid_draw(movement_grid);
	}
	if (my_path != -1 && path_exists(my_path)){
		draw_path(my_path, x, y, true);	
	}
}

if (combat){
	var xx = x - x_offset_combat; 
	var yy = y - y_offset_combat;
	if (combat_facing == dir.down && attacking){
		yy += 10; // oops haha	
	}
	draw_sprite_part(sprite_sheet_combat, 0, floor(x_frame) * frame_w_combat, floor(y_frame) * frame_h_combat, frame_w_combat, frame_h_combat, xx, yy);	
} else {
	var xx = x - x_offset; 
	var yy = y - y_offset;
	draw_sprite_part(sprite_sheet, 0, floor(x_frame) * frame_w, floor(y_frame) * frame_h, frame_w, frame_h, xx, yy);
}

if (x_frame <= anim_length ) {
	x_frame += anim_speed / room_speed;
} 
if (x_frame >= anim_length) {
	if (attacking) {
		attacking = false;
		start_damage(target.x, target.y, attack)
		with (target){
			hp -= attack;
			if (hp <= 0){
				with (o_player){
					target = -1;
					facing = combat_facing;
				}
			}
		}
	} else {
		x_frame = 0;
	}
}

if (game.debug) draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);