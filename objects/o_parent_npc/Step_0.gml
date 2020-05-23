/// @description Move NPC
if (!can_move) {
	// face the player
	if (abs(x - o_player.x) > abs(y - o_player.y)){
		if (x < o_player.x){
			y_frame = 1; // right	
		} else {
			y_frame = 2; // left
		}
	} else {
		if (y < o_player.y){
			y_frame = 0; 
		} else {
			y_frame = 3;
		}
	}
	exit;
}

// check for a collision
collision_layer = layer_tilemap_get_id("Collisions")
if (move_x != 0 && tile_collision(x + move_x, y, collision_layer)){
	repeat(abs(move_x)){
		if (!tile_collision(x + sign(move_x), y, collision_layer)){
			x+= sign(move_x);
		} else {
			break;
		}
	}
	move_x = 0;
}
if (move_y != 0 && tile_collision(x, y + move_y, collision_layer)){
	repeat(abs(move_y)){
		if (!tile_collision(x, y+sign(move_y), collision_layer)){
			y+= sign(move_y);
		} else {
			break;
		}
	}
	move_y = 0;
}
if (move_x != 0){
	var collision_h = instance_place(x + move_x, y, o_collision);
	if (collision_h != noone && collision_h.collideable){
		repeat(abs(move_x)){
			if (!place_meeting(x + sign(move_x), y, o_collision)){
				x+= sign(move_x);
			} else {
				break;
			}
		}
		move_x = 0;
	}
}
if (move_y != 0){
	var collision_v = instance_place(x, y + move_y, o_collision);
	if (collision_v != noone && collision_v.collideable){
		repeat(abs(move_y)){
			if (!place_meeting(x, y+sign(move_y), o_collision)){
				y+= sign(move_y);
			} else {
				break;
			}
		}
		move_y = 0;
	}
}

// apply movement
x += move_x;
y += move_y;