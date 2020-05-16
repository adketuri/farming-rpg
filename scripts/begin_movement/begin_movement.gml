///@description creates path

if (path_exists(my_path)){
	path_delete(my_path);
}
my_path = path_add();
mp_grid_path(movement_grid, my_path, x, y, o_goal.x, o_goal.y, true);
path_start(my_path, 100 / room_speed, path_action_stop, true);
last_x = -1;
last_y = -1;
last_dir = -1000;