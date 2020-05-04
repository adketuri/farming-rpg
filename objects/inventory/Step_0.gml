/// @description Toggle menu

if (keyboard_check_pressed(vk_escape)) show_inventory = !show_inventory;

if (!show_inventory) exit;

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

if (nx >= 0 && nx < inv_width && ny >= 0 && ny < inv_height){
	m_slotx = nx;
	m_sloty = ny;
} else {
	//m_slotx = -1;
	//m_sloty = -1;
}

// Set selected slot to mouse position
selected_slot = m_slotx + (m_sloty * inv_width);
#endregion

// Pickup item
var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];
show_debug_message(ss_item)

if (ss_item != item.none && mouse_check_button_pressed(mb_right)){
	pickup_slot = selected_slot;
	show_debug_message(pickup_slot)
}
