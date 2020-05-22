/// @description Move drops
if (drop_move){
	// Move away from player
	x = lerp(x, goal_x, room_speed / 2000);
	y = lerp(y, goal_y, room_speed / 2000);
	if (abs(x - goal_x) < 1 && abs(y - goal_y) < 1){
		drop_move = false;	
	}
} else {
	var px = o_player.x;
	var py = o_player.y;
	var r = 16;
	if (point_in_rectangle(px, py, x-r, y-r, x+r, y+r)) {
		// are we on top?
		r = 4;
		if (!point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
			// move towards player	
			x = lerp(x, px, 0.3);
			y = lerp(y, py, 0.3);
		} else {
			// pick it up
			var in = item_num;
			with (inventory) {
				var ds_inv = ds_inventory;
				var picked_up = false;
				
				// check if it exists already? if so we can stack	
				var yy = 0; repeat(inv_slots) {
					if (ds_inv[# 0, yy] == in){
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					}
					yy++;	
				}
				// otherwise add to empty slot
				if (!picked_up) {
					var yy = 0; repeat(inv_slots) {
						if (ds_inv[# 0, yy] == item.none){
							ds_inv[# 0, yy] = in;
							ds_inv[# 1, yy] = 1;
							picked_up = true;
							break;
						}
						yy++;	
					}
				}
				// otherwise, no room
				
			}
			if (picked_up){
				instance_destroy();
				show_debug_message("Picked up an item");
			}
		}
	}
	angle += room_speed / 2000;
}