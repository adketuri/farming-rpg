/// @description Create player
event_inherited();

anim_length = 4;
anim_speed = 9;
sprite_sheet = s_player

frame_w = sprite_get_width(sprite_index);
frame_h = sprite_get_height(sprite_index);

x_frame = 1 * frame_h;
y_frame = 0;

move_x = 0;
move_y = 0;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

my_path = path_add();
facing = -1;

last_dir = 0;

last_x = 0;
last_y = 0;

movement_grid = -1;