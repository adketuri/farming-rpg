/// @description Create a crop
collideable = false;

frame_width = 24;
frame_height = 48;
crop_type = 0;
days_old = 0;
growth_stage = 0;
growth_stage_duration = 0;
max_growth_stage = (sprite_get_width(s_crops) / frame_width) - 1;
fully_grown = false;
sparkle = -1;

xx = x - (frame_width / 2) + 1;
yy = y - frame_height + 8;