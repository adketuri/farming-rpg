/// @description Draw mouse cursor in planting mode
 if (select_crop < 0) exit;
 
 var xx = (mx div cell_size) * cell_size;
 var yy = (my div cell_size) * cell_size;
 
 // Draw if crops can be planted
 var c = soil_at(mx, my) ? c_green : c_red;
 
 draw_rectangle_color(xx, yy, xx+cell_size, yy+cell_size, c, c, c, c, true);


 // Draw crop to be planted
 draw_sprite(s_crops_picked, select_crop, xx + cell_size/2, yy + cell_size/2);