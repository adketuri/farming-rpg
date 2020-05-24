/// @description Create NPC
event_inherited();

anim_length = 4;
anim_speed = 9;
sprite_sheet = s_npc;

frame_w = sprite_get_width(sprite_index);
frame_h = sprite_get_height(sprite_index);

x_frame = 1 * frame_h;
y_frame = 0;

move_x = 0;
move_y = 0;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

alarm[1] = 1;
can_move = true;

portrait_index = 0;
voice_pitch = 1;
name = "Person";
text = ["<Unspecified dialogue>"];
speakers = [id];
next_line = [0];
scripts = -1;