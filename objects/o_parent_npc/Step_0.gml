/// @description Move NPC

show_debug_message(move_x);
show_debug_message(move_y);

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
if (move_x != 0 && place_meeting(x + move_x, y, o_collision)){
	repeat(abs(move_x)){
		if (!place_meeting(x + sign(move_x), y, o_collision)){
			x+= sign(move_x);
		} else {
			break;
		}
	}
	move_x = 0;
}
if (move_y != 0 && place_meeting(x, y + move_y, o_collision)){
	repeat(abs(move_y)){
		if (!place_meeting(x, y+sign(move_y), o_collision)){
			y+= sign(move_y);
		} else {
			break;
		}
	}
	move_y = 0;
}

// apply movement
x += move_x;
y += move_y;