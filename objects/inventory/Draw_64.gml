/// @description Draw inventory

if (!show_inventory) exit;

draw_sprite_ext(s_inventory_ui, 0, inv_ui_x, inv_ui_y, scale, scale, 0, c_white, 1);

draw_set_font(f_text);
var c = c_white;
var c2 = c_gray;
var info_grid = ds_player_info;
draw_set_halign(fa_left)
draw_text_color(info_x, info_y, info_grid[# 1, 1], c, c, c2, c2, 1);
draw_set_halign(fa_right)
draw_text_color(money_x, info_y, string(info_grid[# 1, 0]) + " Flips", c, c, c2, c2, 1);