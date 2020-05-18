/// @description Draw our gauges
var c = c_white;
var c2 = c_gray;

// Draw HP bar
gui_x = 5;
gui_y = 15;
draw_sprite_part_ext(sprite, 0, back_x, back_y, back_width, back_height, gui_x, gui_y, 1, 1, c_white, 1);
draw_sprite_part_ext(sprite, 0, hp_x, hp_y, round(gauge_width * o_player.hp / o_player.max_hp), gauge_height, gui_x + 1, gui_y + 1, 1, 1, c_white, 1);

// "HP"
var xx = gui_x;
var yy = gui_y - 6;
draw_set_font(f_nums);
draw_set_halign(fa_left);
draw_text_color(xx + 2, yy + 0, "HP", c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "HP", c, c, c2, c2, 1);

// Value
var xx = gui_x + gauge_width;
var yy = gui_y - 9;
draw_set_font(f_text);
draw_set_halign(fa_right);
draw_text_color(xx + 2, yy + 0, o_player.hp, c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, o_player.hp, c, c, c2, c2, 1);

// Draw hunger back
gui_y = 30;
draw_sprite_part_ext(sprite, 0, back_x, back_y, back_width, back_height, gui_x, gui_y, 1, 1, c_white, 1);
draw_sprite_part_ext(sprite, 0, hunger_x, hunger_y, round(gauge_width * o_player.satiety / o_player.max_satiety), gauge_height, gui_x + 1, gui_y + 1, 1, 1, c_white, 1);

// "Satiety"
var xx = gui_x;
var yy = gui_y - 6;
draw_set_font(f_nums);
draw_set_halign(fa_left);
draw_text_color(xx + 2, yy + 0, "Satiety", c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "Satiety", c, c, c2, c2, 1);

// Date
gui_x = 5;
gui_y = 39;
var xx = gui_x;
var yy = gui_y;
draw_text_color(xx + 2, yy + 0, "Day: " + string(daycycle.day), c_black, c_black, c_black, c_black, 1);
draw_text_color(xx + 1, yy - 1, "Day: " + string(daycycle.day), c, c, c2, c2, 1);
//yy += 6;
//draw_text_color(xx + 2, yy + 0, "Week: " + string(daycycle.week), c_black, c_black, c_black, c_black, 1);
//draw_text_color(xx + 1, yy - 1, "Week: " + string(daycycle.week), c, c, c2, c2, 1);