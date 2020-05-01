/// @description Initialize clock
draw_daylight = false;
time_pause = true;

seconds = 0; 
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

time_increment = 1000 * room_speed / 60;

darkness = 0;
light_color = c_black;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();