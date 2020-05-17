if (mouse_check_button_pressed(mb_left)) {
	if (instance_exists(o_goal)){
		instance_destroy(o_goal);
	}
	instance_create_layer(mouse_x, mouse_y, "Instances", o_goal);
	begin_movement(o_goal.x, o_goal.y, 100)
	if (overlapping){
		target = overlapping;	
	} else {
		target = -1;
	}
}