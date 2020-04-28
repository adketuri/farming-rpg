/// @description Move player and handle collisions

if (game.transitioning) return;

// poll keyboard input
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

// alter speed
spd = SPEED
if (input_walk xor input_run) {
	spd = abs((input_walk*WALK_SPEED) - (input_run*RUN_SPEED));
} 

// set intended movement
move_x = 0
move_y = 0
move_x = (input_right - input_left) * spd / room_speed;
if (move_x == 0) {
	move_y = (input_down - input_up) * spd / room_speed;
}


// get direction player is facing
if (move_x != 0) facing = move_x < 0 ? dir.left : dir.right;
if (move_y != 0) facing = move_y < 0 ? dir.up : dir.down;
if (move_x == 0 && move_y == 0) facing = -1;

// check for a collision with tiles
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

// check for collision with transitions
var inst = instance_place(x, y, o_transition);
if (inst != noone && facing == inst.player_facing_before){
	with(game){
		spawn_room = inst.target_room;
		spawn_x = inst.target_x;
		spawn_y = inst.target_y;
		spawn_player_facing = inst.player_facing_after;
		transitioning = true;
	}
}

// apply movement
x += move_x;
y += move_y;