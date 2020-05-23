/// @description Determines which object the player is overlapping, updating cursor accordingly

var overlap = -1;
var overlap_type = -1;
with(o_crop){
	if (position_meeting(mouse_x, mouse_y, id) && fully_grown)
    {
        overlap = id;
		overlap_type = overlap_types.crop;
		break;
    }
}
with (o_npc){
	if (position_meeting(mouse_x, mouse_y, id))
    {
        overlap = id;
		overlap_type = overlap_types.npc;
		break;
    }
}
with(o_monster){
	if (position_meeting(mouse_x, mouse_y, id) && hp > 0)
    {
        overlap = id;
		overlap_type = overlap_types.monster;
		break;
    }
}

if (overlap > -1){
	if (overlap_type == overlap_types.monster){
		window_set_cursor(cr_drag);
	} else if (overlap_type == overlap_types.crop){
		window_set_cursor(cr_arrow);	
	} else if (overlap_type == overlap_types.npc){
		window_set_cursor(cr_handpoint);	
	}
} else {
	window_set_cursor(cr_default);
}
with(o_player){
	overlapping = overlap;
	overlapping_type = overlap_type;
}