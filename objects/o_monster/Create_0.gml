/// @description Initialize monster
event_inherited();
collideable = true;
sprite = -1;
dead_sprite = -1;
total_frames = 4;
frame = (id * 2) % 4;

// pathing
movement_grid = -1;
my_path = path_add();
path_update_time = 0;
time_to_attack = 2;
attack_anim_time = 0.15;


// states
enum mon_state {
	idle,
	following,
	combat,
	attacking,
	returning,
	dead,
}
state = mon_state.idle;
state_time = 0;
attack_offset_x = 0;
attack_offset_y = 0;

// Stats
hp = 30;
attack = 5;