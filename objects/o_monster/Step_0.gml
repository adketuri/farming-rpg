/// @description Update monster 
frame = (frame + 5 / room_speed) % total_frames;

path_update_time += delta_time / 1000000;
var target = o_player;
if (path_update_time > 0.5){
	path_update_time = 0;
	begin_movement(target.x, target.y, 50);
}

if (distance_to_object(target) < 5){
	if (path_exists(my_path)){
		path_delete(my_path);
	}
	attack_timer += delta_time / 1000000;
	if (attack_timer > time_to_attack){
		attack_timer = 0;
		start_damage(target.x, target.y, attack);
	}
}