/// @description Handle transition

// Handle black fade
if (transitioning){
	var transition_speed = 4 / room_speed;
	if (room != spawn_room){
		black_alpha += transition_speed;
		if (black_alpha >= 1) {
			room_goto(spawn_room);
		}
	} else {
		black_alpha -= transition_speed;
		if (black_alpha <= 0) {
			transitioning = false;
		}
	}
	
	// Draw black fade
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
	

