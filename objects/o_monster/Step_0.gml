/// @description Update monster 
frame = (frame + 5 / room_speed) % total_frames;
state_time += delta_time / 1000000;
var target = o_player;
switch (state){
	case mon_state.idle:
	case mon_state.following:
		if (state_time > 0.5 && distance_to_object(target) > 5){
			begin_movement(target.x, target.y, 50);
			state_time = 0;
			state = change_monster_state(state, mon_state.following);
		}
		if (distance_to_object(target) < 5){
			if (path_exists(my_path)){
				path_delete(my_path);
			}
			state = change_monster_state(state, mon_state.combat);
		}
		break;
	case mon_state.combat:
		if (distance_to_object(target) > 5){
			state = change_monster_state(state, mon_state.idle);
		} else if (state_time > time_to_attack){
			state = change_monster_state(state, mon_state.attacking);	
		}
		break;
	case mon_state.attacking:
		attack_offset_x = lerp(x, target.x, state_time / attack_anim_time) - x;
		attack_offset_y = lerp(y, target.y, state_time / attack_anim_time) - y;
		if (state_time > attack_anim_time){
			with(target){
				hp -= attack;	
			}
			start_damage(target.x, target.y, attack);
			state = change_monster_state(state, mon_state.returning);
		}
		break;
	case mon_state.returning:
		attack_offset_x = lerp(x, target.x, 1 - state_time / attack_anim_time) - x;
		attack_offset_y = lerp(y, target.y, 1 - state_time / attack_anim_time) - y;
		if (state_time > attack_anim_time){
			attack_offset_x = 0;
			attack_offset_y = 0;
			state = change_monster_state(state, mon_state.combat);
		}
		break;
	case mon_state.dead:
		if (state_time > 10){
			instance_destroy();
		}
		break;
}