/// @description Move player and handle collisions

if (game.transitioning || inventory.show_inventory) return;

// poll keyboard input
input_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
input_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
input_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
input_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);

if (mouse_check_button_pressed(mb_left)) {
	if (instance_exists(o_goal)){
		instance_destroy(o_goal);
	}
	instance_create_layer(mouse_x, mouse_y, "Instances", o_goal);
	path_delete(my_path)
	my_path = path_add();
	//mp_grid_clear_all(global.movement_grid);
	global.movement_grid = mp_grid_create(0, 0, room_width div game.cell_size, room_height div game.cell_size, game.cell_size, game.cell_size)
	var xx = 0; repeat(room_width div game.cell_size){
		var yy = 0; repeat(room_height div game.cell_size){
			var lay_id = layer_get_id("Collisions");
			var map_id = layer_tilemap_get_id(lay_id);
			var tile = tilemap_get_at_pixel(map_id, xx * game.cell_size, yy * game.cell_size);
			if (tile > 0){
				mp_grid_add_cell(global.movement_grid, xx, yy);
			}
			yy++;
		}
		xx++;
	}
	mp_grid_path(global.movement_grid, my_path, x, y, o_goal.x, o_goal.y, true);
	path_start(my_path, 2, path_action_stop, true);
}
if (path_position >= 1 and instance_exists (o_goal)){
	instance_destroy(o_goal);	
}


//// alter speed
//spd = SPEED
//if (input_walk xor input_run) {
//	spd = abs((input_walk*WALK_SPEED) - (input_run*RUN_SPEED));
//} 

// set intended movement
//move_x = 0
//move_y = 0
//move_x = (input_right - input_left) * spd / room_speed;
//if (move_x == 0) {
//	move_y = (input_down - input_up) * spd / room_speed;
//}
move_x = 0;
move_y = 0;
show_debug_message(facing);
if (instance_exists (o_goal) && path_position < 1){
	if (direction >= 306 or direction <= 45) {
		move_x = 1;
		facing = dir.right;
	} else if (direction >= 136 and direction <= 225) {
		move_x = -1;
		facing = dir.left;
	}
	if (move_x == 0){
		if (direction >= 46 and direction <= 135) {
			move_y = -1;
			facing = dir.up;
		} else if (direction >= 226 and direction <= 305) {
			move_y = 1;
			facing = dir.down;
		} 
	}
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