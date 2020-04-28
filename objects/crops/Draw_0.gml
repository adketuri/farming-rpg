/// @description Draw mouse cursor in planting mode
 if (!planting) exit;
 
 var xx = (mx div cell_size) * cell_size + cell_size / 2;
 var yy = (my div cell_size) * cell_size + cell_size / 2;
 
 // Draw crop to be planted
 draw_sprite(s_crops_picked, select_crop, xx, yy);