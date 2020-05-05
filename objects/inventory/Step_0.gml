/// @description Toggle menu

if (keyboard_check_pressed(vk_escape)) show_inventory = !show_inventory;

if (!show_inventory) {
	pickup_slot = -1;
	exit;
}

// Get selected slot
#region get selected_slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size+x_buffer)*scale;
var cell_ybuff = (cell_size+y_buffer)*scale;

var i_mousex = mousex - slots_x + (x_buffer/2)*scale;
var i_mousey = mousey - slots_y + (y_buffer/2)*scale;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

if (nx >= 0 && nx < inv_width && ny >= 0 && ny < inv_height) {
	m_slotx = nx;
	m_sloty = ny;
} else {
	m_slotx = -1;
	m_sloty = -1;
}

// Set selected slot to mouse position
selected_slot = m_slotx + (m_sloty * inv_width);
#endregion

// Pickup item
var inv_grid = ds_inventory;
var ss_item = -1;
if (selected_slot >= 0) {
	ss_item = inv_grid[# 0, selected_slot];
}

if (pickup_slot != -1 && mouse_check_button_pressed(mb_left)) {
	if (ss_item == -1) {
		// No item at this slot, drop the item 
		inv_grid[# 1, pickup_slot] -= 1;
		
		// Create the item in the game world
		var inst = instance_create_layer(o_player.x, o_player.y, "Instances", o_item);
		var dropped_item = inv_grid[# 0, pickup_slot];
		with (inst){
			item_num = dropped_item;
			x_frame = item_num mod (spr_width / cell_size);
			y_frame = item_num div (spr_width / cell_size);	
		}
		
		// Destroy if the last one
		if (inv_grid[# 1, pickup_slot] <= 0) {
			inv_grid[# 0, pickup_slot] = item.none;	
			pickup_slot = -1;
		}
		
	} else if (ss_item == item.none) {
		// Selected a slot with nothing at all, just move the item to the new position
		inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
		inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
		
		inv_grid[# 0, pickup_slot] = item.none;
		inv_grid[# 1, pickup_slot] = 0;
		
		pickup_slot = -1;
	} else if (ss_item == inv_grid[# 0, pickup_slot]) {
		// Items are same type, combine them
		if (selected_slot != pickup_slot) {
			// Ensures we've selected a different slot, if not we can just mark as unselected
			inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
		
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
		}
		pickup_slot = -1;
	} else {
		// Items are different types, swap it	
		var ss_item_num = inv_grid[# 1, pickup_slot]
		
		inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
		inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
		
		inv_grid[# 0, pickup_slot] = ss_item;
		inv_grid[# 1, pickup_slot] = ss_item_num;
		
		pickup_slot = -1;
	}
} else if (mouse_check_button_pressed(mb_right)){
	if (ss_item != -1 && ss_item != item.none){
		// pick up an item
		pickup_slot = selected_slot;
	} 
}
