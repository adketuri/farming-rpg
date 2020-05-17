/// @description Determines which object the player is overlapping, updating cursor accordingly

var overlap = -1;
with(o_monster){
	if (position_meeting(mouse_x, mouse_y, id) && hp > 0)
    {
        overlap = id;
		break;
    }
}

if (overlap > -1){
	window_set_cursor(cr_drag);
} else {
	window_set_cursor(cr_default);
}
with(o_player){
	overlapping = overlap;
}