/// @description Initialize clock
draw_daylight = false;
time_pause = true;

seconds = 0; 
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

time_increment = 10 * room_speed / 60;
time_multiplier = 1;

max_darkness = 0.7;
darkness = 0;
light_color = c_black;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

enum phase { 
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}