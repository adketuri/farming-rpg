/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("T"))) {	time_pause = !time_pause; }
if (time_pause) exit;

seconds += time_increment;
minutes = seconds / 60;
hours = minutes / 60;

if (draw_daylight){
	#region Phases
	var darks, colors, phase_start, phase_end;
	if (hours > phase.sunrise and hours < phase.daytime) {
		darks = [max_darkness, 0.2];
		colors = [merge_color(c_black, c_navy,0.3), c_orange];
		phase_start = phase.sunrise;
		phase_end = phase.daytime;
	} else if (hours > phase.daytime and hours < phase.sunset) {
		darks = [0.2, 0, 0, 0, 0.2];
		colors = [c_orange, c_orange, c_white, c_orange, c_orange];
		phase_start = phase.daytime;
		phase_end = phase.sunset;
	} else if (hours > phase.sunset and hours < phase.nighttime) {
		darks = [0.2, max_darkness];
		colors = [c_orange, c_navy, merge_color(c_black, c_navy, 0.2)];
		phase_start = phase.sunset;
		phase_end = phase.nighttime;
	} else {
		darks = [max_darkness];
		colors = [merge_color(c_black, c_navy, 0.2)];
		phase_start = phase.nighttime;
		phase_end = phase.sunrise;
	}
	#endregion

	#region Alter Colors/Darkness
	if (phase_start == phase.nighttime) { 
		light_color = colors[0];
	} else {
		var cc = ((hours - phase_start) / (phase_end - phase_start)) * (array_length_1d(colors) - 1);
		var c1 = colors[floor(cc)];
		var c2 = colors[ceil(cc)];
		light_color = merge_color(c1, c2, cc-floor(cc));
	}
	
	if (phase_start == phase.nighttime) { 
		darkness = darks[0];
	} else {
		var dc = ((hours - phase_start) / (phase_end - phase_start)) * (array_length_1d(darks) - 1);
		var d1 = darks[floor(dc)];
		var d2 = darks[ceil(dc)];
		darkness = lerp(d1, d2, dc-floor(dc));
	}
	#endregion
}

#region Cycle check
if (hours >= 24) {
	seconds = 0;
	day++;
	with (crops) {
		event_perform(ev_other, ev_user1);	
	}
	if (day > 30) {
		day = 1;
		season++;
		if (season > 4){
			season = 1;
			year++;
		}
			
	}
}
#endregion