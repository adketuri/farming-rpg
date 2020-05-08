debug = false;
randomize();
room_goto_next();

display_set_gui_size(320,240);
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
black_alpha = 0;

transitioning = false;
spawn_room = -1;
spawn_x = 0;
spawn_y = 0;
spawn_player_facing = -1;

enum dir {
	right = 0,
	up = 90, 
	left = 180, 
	down = 270,
}

//window_set_cursor(cr_none);
//cursor_sprite = s_cursor;
