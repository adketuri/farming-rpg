/// @description Insert description here
// You can write your code in this editor
room_w = room_width;
room_h = room_height;
cell_size = 16;
global.movement_grid = -1;

if (spawn_room == -1) exit;

o_player.x = spawn_x;
o_player.y = spawn_y;
o_player.facing = spawn_player_facing;
camera.x = o_player.x;
camera.y = o_player.y;

if (layer_exists("Collisions")) layer_set_visible("Collisions", false);
if (layer_exists("Transitions")) layer_set_visible("Transitions", false);