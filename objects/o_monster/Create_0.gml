/// @description Initialize monster
event_inherited();
collideable = true;
sprite = -1;
total_frames = 4;
frame = id % 4;

// pathing
movement_grid = -1;
my_path = path_add();
path_update_time = 0;


// combat values
combat = false;
attack_timer = 0;
time_to_attack = 2;
attacking = false;
attack = 5;