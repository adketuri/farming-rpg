/// @description Create player
event_inherited();

anim_length = 4;
anim_speed = 9;

sprite_sheet = s_player
sprite_sheet_combat = s_player_combat

frame_w = sprite_get_width(sprite_index);
frame_h = sprite_get_height(sprite_index);
frame_w_combat = sprite_get_width(s_player_collision_combat);
frame_h_combat = sprite_get_height(s_player_collision_combat);

x_frame = 1 * frame_h;
y_frame = 0;

move_x = 0;
move_y = 0;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);
x_offset_combat = sprite_get_xoffset(s_player_collision_combat);
y_offset_combat = sprite_get_yoffset(s_player_collision_combat);

my_path = path_add();
facing = dir.down;

last_dir = 100000;
last_x = 0;
last_y = 0;

enum player_state {
	idle,
	moving,
	combat,
	attacking,
	mining,
	farming
}

// Combat
movement_grid = -1;
overlapping = -1; // currently overlapped enemy
target = -1; // currently targeted (clicked) enemy
state = player_state.idle;
state_time = 0;

// stats
attack = 10;
max_hp = 100;
hp = max_hp;
time_to_attack = 2;
max_satiety = 1000;
satiety = max_satiety;