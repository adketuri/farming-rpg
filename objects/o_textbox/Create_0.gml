box = s_textbox;
portrait = s_portraits;
namebox = s_namebox;

pad = 5;
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

portrait_x = (global.game_width - box_width - port_width / 2) * 0.5;
portrait_y = global.game_height - port_height;
box_x = portrait_x + port_width / 2;
box_y = global.game_height - box_height - pad;
namebox_x = portrait_x + port_width / 2;
namebox_y = box_y - namebox_height;

font = f_text;
draw_set_font(font);
x_buffer = port_width / 2 + 1;
y_buffer = 5;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
text_width = box_width - x_buffer - 4;
text_height = string_height("M");
name_text_x = namebox_x + x_buffer;
name_text_y = namebox_y + y_buffer;

portrait_index = 0;
counter = 0;
sound_counter = 0;
text[0] = "My name is Amiru. Or was it Andoru? Or Amalia? or Andrew?? I forget!!"
text[1] = "Actually, what's it matter? It's just text on the screen."
page = 0;
name = "Amiru?";
interact_key = vk_space;
pause = false;

text_col = c_white;
name_text_col = c_yellow;
event_perform(ev_other, ev_user1);
