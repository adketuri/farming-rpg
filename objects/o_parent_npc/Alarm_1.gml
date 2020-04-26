/// @description Periodically move NPC
move_x = 0;
move_y = 0;

var idle = choose (0, 1);
if (!idle){
	var dir = choose(1, 2, 3, 4);
	switch(dir){
		case 1:
			move_x =  -WALK_SPEED / room_speed;
			break;
		case 2:
			move_x = WALK_SPEED / room_speed;
			break;
		case 3:
			move_y = WALK_SPEED / room_speed;
			break;
		case 4: 
			move_y = -WALK_SPEED / room_speed;
			break;
	}
}

alarm[1] = random_range(1.5, 3) * room_speed;