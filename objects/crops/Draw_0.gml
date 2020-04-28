/// @description Draw mouse cursor in planting mode
 if (!planting) exit;
 
 // Draw crop to be planted
 draw_sprite(s_crops_picked, select_crop, mx, my);