/// @description Move player and handle collisions

if (game.transitioning || inventory.show_inventory) return;

#region state management
switch (state) {
	case player_state.idle:
	case player_state.moving:
		player_check_mouse_click();
		if (target != -1 && target_type == overlap_types.npc && active_textbox == noone){
			change_player_facing(target.x, target.y);
			state = change_state(state, player_state.talking);
			with (target){
				o_player.active_textbox = create_textbox(text, speakers, next_line);
				can_move = false;
				move_x = 0;
				move_y = 0;
			}
			target = -1;
			instance_destroy(o_goal);
			if (path_exists(my_path)){
				path_delete(my_path);
			}
		} else if (plant_target_x != -1 && instance_exists(o_goal) && distance_to_object(o_goal) < 4){
			// Check if we can plant
			instance_destroy(o_goal);
			if (path_exists(my_path)){
				path_delete(my_path);
			}
			change_player_facing(plant_target_x, plant_target_y);
			state = change_state(state, player_state.planting);
		} else if (target != -1 && distance_to_object(target) < 4){
			// Remove path
			if (instance_exists(o_goal)){
				instance_destroy(o_goal);
			}
			if (path_exists(my_path)){
				path_delete(my_path);
			}
			// begin attacking or harvesting
			change_player_facing(target.x, target.y);
			if (target_type == overlap_types.monster && target.hp > 0){
				state = change_state(state, player_state.combat);
			} else if (target_type == overlap_types.crop && target.fully_grown){
				state = change_state(state, player_state.harvesting);	
			}
		} 
		break;
	case player_state.combat:
		player_check_mouse_click();	
		if (target == -1 || distance_to_object(target) > 4 || target.hp <= 0){
			state = change_state(state, player_state.idle);
			target = -1;
		} else if (state_time >= time_to_attack){
			x_frame = 0;
			state = change_state(state, player_state.attacking);
		}
		break;
	case player_state.attacking:
		if (x_frame >= anim_length) {
			start_damage(target.x, target.y, attack)
			with (target){
				hp -= o_player.attack;
				if (hp <= 0){
					with (o_player){
						target = -1;
						facing = facing;
						state = change_state(state, player_state.idle);
					}
				}
			}
			state = change_state(state, player_state.combat);
		}
		break;
	case player_state.planting:
		if (state_time >= time_to_plant){
			with (crops){
				event_user(2);	
			}
			state = change_state(state, player_state.idle);
		}
		break;
	case player_state.harvesting:
		if (state_time >= time_to_harvest){
			with (target){
				repeat(random_range(1, 3)){
					// Create the item in the game world
					var inst = instance_create_layer(x, y, "Instances", o_item);
					var dropped_item = crop_type;
					with (inst){
						item_num = dropped_item;
						x_frame = item_num mod (o_item.spr_width / 16);
						y_frame = item_num div (o_item.spr_width / 16);	
					}
				}
				var cx = o_player.target.x div 16;
				var cy = o_player.target.y div 16;
				show_debug_message("Removing at " + string(cx) + " " + string(cy));
				crops.ds_crops_instances[# cx, cy] = 0;
			}
			instance_destroy(target);
			state = change_state(state, player_state.idle);
		}
		break;
	case player_state.talking:
		if (!instance_exists(active_textbox)){
			active_textbox = noone;	
			state = change_state(state, player_state.idle);
		}
		break;
	default:
		break;
}
state_time += delta_time / 1000000;
#endregion

if (path_position >= 1 && instance_exists(o_goal)){
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

var combat = state == player_state.combat || state == player_state.attacking;
// Update x frame
if (!combat && state != player_state.planting && state != player_state.harvesting && last_x == x && last_y == y){
	x_frame = 1;
} else {
	last_x = x;
	last_y = y;
}
x_frame += anim_speed / room_speed;	
if (state != player_state.attacking){
	x_frame = x_frame mod anim_length;
}

// Update y frame
if (!combat) {
	if (facing == dir.left) {
		y_frame = 2; 	
	} else if (facing == dir.right) {
		y_frame = 1;	
	} else if (facing == dir.up) {
		y_frame = 3; 	
	} else if (facing == dir.down) {
		y_frame = 0;	
	}
	if (state == player_state.planting || state == player_state.harvesting){
		y_frame += 8;	
	}
	anim_length = 4;
} else {
	if (state == player_state.attacking){
		if (facing == dir.left) {
			y_frame = 9; 	
		} else if (facing == dir.right) {
			y_frame = 2;	
		} else if (facing == dir.up) {
			y_frame = 5; 	
		} else if (facing == dir.down) {
			y_frame = 8;	
		} 		
	} else {
		if (facing == dir.left) {
			y_frame = 1; 	
		} else if (facing == dir.right) {
			y_frame = 0;	
		} else if (facing == dir.up) {
			y_frame = 4; 	
		} else if (facing == dir.down) {
			y_frame = 7;	
		} 
	}
	anim_length = 3;
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

#region hunger meter
satiety -= delta_time / 1000000

#endregion