/// @description Move player and handle collisions

if (game.transitioning || inventory.show_inventory) return;

if (mouse_check_button_pressed(mb_left)) {
	if (instance_exists(o_goal)){
		instance_destroy(o_goal);
	}
	instance_create_layer(mouse_x, mouse_y, "Instances", o_goal);
	begin_movement(o_goal.x, o_goal.y, 100)
	if (overlapping){
		target = overlapping;	
	} else {
		target = -1;
	}
}
if ((path_position >= 1 && instance_exists(o_goal))){
	instance_destroy(o_goal);	
}

#region facing and directions
move_x = 0;
move_y = 0;
if (instance_exists (o_goal) && path_position < 1){
	if (direction >= 136 and direction <= 225) {
		if (abs(direction - last_dir) > 30){
			facing = dir.left;
			last_dir = direction;
		}
		move_x = -1;
	} else if (direction >= 46 and direction <= 135) {
		if (abs(direction - last_dir) > 30){
			facing = dir.up;
			last_dir = direction;
		}
		move_y = -1;
	} else if (direction >= 226 and direction <= 305) {
		if (abs(direction - last_dir) > 30){
			facing = dir.down;
			last_dir = direction;
		}		
		move_y = 1;
	} else if (direction >= 306 or direction <= 45) {
		if (abs(direction - last_dir) > 30){
			facing = dir.right;
			last_dir = direction;
		}		
		move_x = 1;
	} 
} 

if (last_x == x && last_y == y){
	facing = -1;
} else {
	last_x = x;
	last_y = y;
}
#endregion

#region collision and movement
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
#endregion

#region combat
// Check if we can switch in/out of combat mode
if (!combat && target != -1 && distance_to_object(target) < 5){
	// Remove path, begin attacking
	if (instance_exists(o_goal)){
		instance_destroy(o_goal);
	}
	if (path_exists(my_path)){
		path_delete(my_path);
	}
	if (abs(target.x - x) < abs(target.y - y)){
		// face up or down	
		if (target.y > y){
			combat_facing = dir.down;	
		} else {
			combat_facing = dir.up;
		}
	} else {
		// face left or right
		if (target.x > x){
			combat_facing = dir.right;	
		} else {
			combat_facing = dir.left;
		}
	}
	combat = true;
} else if (combat && target == -1 || distance_to_object(target) > 5){
	// Remove combat mode, move towards target again	
	combat = false;
}

if (combat && !attacking) {
	attack_timer += delta_time / 1000000;
	if (attack_timer >= time_to_attack){
		attacking = true;
		x_frame = 0;
		attack_timer = 0;
	}
}
#endregion