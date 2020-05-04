/// @description Toggle menu

if (keyboard_check_pressed(vk_escape)) show_inventory = !show_inventory;

if (!show_inventory) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size+x_buffer)*scale;
var cell_ybuff = (cell_size+y_buffer)*scale;

var i_mousex = mousex - slots_x + (x_buffer/2)*scale;
var i_mousey = mousey - slots_y + (x_buffer/2)*scale;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

if (nx >= 0 && nx < inv_width && ny >= 0 && ny < inv_height){
	m_slotx = nx;
	m_sloty = ny;
} else {
	m_slotx = -1;
	m_sloty = -1;
}

// Set selected slot to mouse position
selected_slot = m_slotx + m_sloty * inv_width;

