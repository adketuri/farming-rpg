/// @description Draw mouse cursor in planting mode
var select_crop = inventory.quick_selected_item;
if (select_crop <= 0) exit;

var xx = (mx div cell_size) * cell_size;
var yy = (my div cell_size) * cell_size;

// Draw if crops can be planted
var c = soil_at(mx, my) ? c_green : c_red;
// FIXME do we want this?
//draw_sprite_ext(s_goal, 0, xx +cell_size/2, yy+cell_size/2, 1, 1, 0, c, 1);

if (!soil_at(mx, my)){
	exit;
}

// Draw crop to be planted
draw_sprite(s_crops_picked, select_crop - 11, xx + cell_size/2, yy + cell_size/2);